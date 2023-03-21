close all;
clear;

ToDeg = 180/pi;
ToRad = pi/180;
point1=zeros(100,1);    %设为矩阵
point2=zeros(100,1);  
point3=zeros(100,1);  

num=1;
global Link

xx=50;
yy=[20;20;12;14;16;18;20;22;24;26;28;20;18;20;22;14;12;16;18;20;22;24;26;26;18;20;22];
zz=[50;48;46;46;46;46;46;46;46;46;46;44;42;42;42;38;36;36;34;34;34;34;35;34;38;37;38];

for i=1:1:27
   
            [th1,d2,th3]= zq_robot_qiunijie(xx,yy(i),zz(i));    %求逆解

            th1=th1*ToDeg;
            th3=th3*ToDeg;

            move=zq_robot_dh(th1,d2,th3,1);
            
            point1(num) = Link(4).p(1);    %用这个矩阵来存数据，这里共存三行数据
            point2(num) = Link(4).p(2);
            point3(num) = Link(4).p(3);
            
            plot3(point1,point2,point3,'r*');hold on;   %这里用了point1,point2,point3，而不用 point1(num)，point2(num), point3(num)?  
            
            fprintf('point1=%4.2f \n',point1(num));     %观察输出点的情况
            
            fprintf('point2=%4.2f \n',point2(num));
            fprintf('point3=%4.2f \n',point3(num));
            
            num = num + 1;
   
end
grid on;   


