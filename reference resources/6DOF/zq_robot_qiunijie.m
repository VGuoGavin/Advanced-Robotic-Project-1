function [ th1,d2,th3] = zq_robot_qiunijie( px,py,pz )
ToDeg = 180/pi;
ToRad = pi/180;

th1=-atan2(px,py);        %逆运动学方程
th3=acos((100-pz)/100);
d2=py*cos(th1)-px*sin(th1)-100*sin(th3);

fprintf('th1=%4.2f \n',th1*ToDeg);   %观察输出结果
fprintf('d2=%4.2f \n',d2);
fprintf('th3=%4.2f \n',th3*ToDeg);

end



