function pic=DHfk6Dof_Workplace(th1,th2,th3,fcla,fplot)  
%这是用来画工作空间的函数内核  d4,th5,th6,
% close all
global Link

% zq_3dof_robot;
%Build_3DOFRobot_Lnya;
radius    = 10;
len       =   20;
joint_col = 0;


plot3(0,0,0,'ro'); 

Link(2).th=th1*pi/180;           %变成弧度，th1取至draw_6DOF_Workplace。
Link(3).th=th2*pi/180;
Link(4).th=th3*pi/180;


% p0=[0,0,0]';

for i=1:4
Matrix_DH_Ln(i);  %生成关节链接的D-H矩阵。
end

for i=2:4
      Link(i).A=Link(i-1).A*Link(i).A;     %第i+1个矩阵乘第i个矩阵，矩阵右乘，把所有矩阵相乘。 Link(i)函数取至Matrix_DH_Ln(i)。
      Link(i).p= Link(i).A(:,4);     %取Link(i).A中所有行的第4列放到Link(i).p，把第i个关节的位置存在Link(i).p中。
      Link(i).n= Link(i).A(:,1);     %同上
      Link(i).o= Link(i).A(:,2);     %同上
      Link(i).a= Link(i).A(:,3);     %同上
      Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];  %把第i个关节的姿态存在 Link(i).R中
      if fplot   %当fplot为1时执行下面两个函数
          Connect3D(Link(i-1).p,Link(i).p,'b',2); hold on;             %'b'，是指线条为蓝色，Link(i)函数取至Matrix_DH_Ln(i)。画杆  ，hold on 保留当前坐标区中的绘图，从而使新添加到坐标区中的绘图不会删除现有绘图。
          DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;   %画圆筒
      end
end


grid on;
% view(134,12);
axis([-500,500,-500,500,-500,500]);    %指定范围
xlabel('x');
ylabel('y');
zlabel('z');
drawnow;
pic=getframe;

if(fcla)
    cla;
end




