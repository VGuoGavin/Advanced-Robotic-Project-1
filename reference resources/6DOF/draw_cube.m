close all;
clear;

ToDeg = 180/pi;
ToRad = pi/180;
point1=[];    %设为矩阵
point2=[];
point3=[];

num=1;
global Link

for z=0:5:50
    for y=-25:5:25
        for x=50:5:100
            
            [th1,d2,th3]= zq_robot_qiunijie(x,y,z); %逆运动学

            th1=th1*ToDeg;
            th3=th3*ToDeg;

            move=zq_robot_dh(th1,d2,th3,1);  %正运动学
            
            point1(num) = Link(4).p(1);    %用这个矩阵来存数据，这里共存三行数据
            point2(num) = Link(4).p(2);
            point3(num) = Link(4).p(3);
            
            plot3(point1,point2,point3,'r.');hold on;   %这里用了point1,point2,point3，而不用 point1(num)，point2(num), point3(num)?  
            
            fprintf('point1=%4.2f \n',point1(num));     %观察输出点的情况
            fprintf('point2=%4.2f \n',point2(num));
            fprintf('point3=%4.2f \n',point3(num));
            
            num = num + 1;
        end
    end
end
grid on;   


