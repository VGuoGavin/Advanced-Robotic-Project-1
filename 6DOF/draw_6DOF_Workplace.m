close all;    %删除其句柄未隐藏的所有图窗。
clear;        %清除工作空间

ToDeg = 180/pi;   %转化为度数
ToRad = pi/180;   %转化为弧度

point1=[];    %设为矩阵
point2=[];
point3=[];
th_interval = 40;    %弧间隔
z_interval = 4;      %线间隔

th1=0;   %为th1至th6设定初始值
th2=0;
th3=0;

global Link

num = 1;

for theta1=-180:th_interval:180   %循环画工作空间
    for dt2=00:z_interval:100
        for theta3=-180:th_interval:180

                        zq_robot_dh(th1+theta1,th2+dt2,th3+theta3,1);  %,d4+dz4,th5+theta5,th6+theta6
                        point1(num) = Link(4).p(1);    %用这个矩阵来存数据，这里共存三行数据
                        point2(num) = Link(4).p(2);
                        point3(num) = Link(4).p(3);
                        num = num + 1;
                        plot3(point1,point2,point3,'r*');hold on;   %这里用了point1,point2,point3，而不用 point1(num)，point2(num), point3(num)?  

        end
    end
end

cla;       %cla 从当前坐标区删除包含可见句柄的所有图形对象，把上面的图形清除。
plot3(point1,point2,point3,'r*');      %这里再画一个图形
axis([-400,400,-400,400,-400,400]);    %设置轴范围和纵横比
grid on;                %显示 gca 命令返回的当前坐标区或图的主网格线。主网格线从每个刻度线延伸。grid off 删除当前坐标区或图上的所有网格线。


