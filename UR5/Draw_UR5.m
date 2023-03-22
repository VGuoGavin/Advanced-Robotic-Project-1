function res = Draw_UR5 (th1, th2, th3,th4,th5,th6, fcla )
% 
% th1 = 0
% th2 = 180
% th3 = 0
% th4 = 0
% th5 = 0
% th6 = 0
% fcla = 0


global Link

ToDeg = 180/pi;
ToRad = pi/180;
UX = [1 0 0]';
UY = [0 1 0]';
UZ = [0 0 1]';
%Link= struct('name','Body' , 'th'角度,  0, 'dz'z轴方向距离, 0,  'dy'y轴方向距离, 0, 'dx'x轴方向距离, 0, 'alf',90*ToRad,'az',UZ);  
Link= struct('name','Body' , 'th',  0, 'dz', 0,  'dy', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);     % az 
Link(1)= struct('name','Base' , 'th',  th1*ToRad, 'dz', 0, 'dy', 0,'dx', 0, 'alf',0*ToRad,'az',UZ);        %Base To 1

Link(2) = struct('name','J1' , 'th',   0*ToRad, 'dz', 90/5,     'dy', 0,    'dx',  0,      'alf',90*ToRad, 'az',UZ);       %1 TO 2
Link(3) = struct('name','J2' , 'th',  0*ToRad, 'dz', 0,         'dy', 0,    'dx',  -425/5, 'alf',0*ToRad,  'az',UZ);    %2 TO 3
Link(4) = struct('name','J3' , 'th',  0*ToRad, 'dz', 0,         'dy', 0,    'dx',  -392/5, 'alf',0*ToRad,  'az',UZ);          %3 TO E
Link(5) = struct('name','J4' , 'th',  0*ToRad, 'dz', 110/5,     'dy', 0,    'dx',  0,      'alf',90*ToRad, 'az',UZ);    %2 TO 3
Link(6) = struct('name','J5' , 'th',  0*ToRad, 'dz', 95/5,      'dy', 0,    'dx',  0,      'alf',-90*ToRad,'az',UZ);          %3 TO E
Link(7) = struct('name','J6' , 'th',  0*ToRad, 'dz',  82/3,     'dy', 0,    'dx', 0,       'alf',0*ToRad,  'az',UZ);          %3 TO E


radius = 10;
len = 20;
joint_col = 0;

plot3(0,0,0,'ro');  %Draw the orginal position [0,0,0]

Link(2).th=th2*pi/180;
Link(3).th=th3*pi/180;
Link(4).th=th4*pi/180;
Link(5).th=th5*pi/180;
Link(6).th=th6*pi/180;
Link(7).th=th6*pi/180;

p0=[0,0,0]';

for i=1:7
    Matrix_DH_Ln(i);
end
%T = ones(4,4);
for i=2:7
    %T = T* Link(i-1).A*Link(i).A;
    Link(i).A=Link(i-1).A*Link(i).A;
    Link(i).p= Link(i).A(:,4);
    Link(i).n= Link(i).A(:,1);
    Link(i).o= Link(i).A(:,2);
    Link(i).a= Link(i).A(:,3);
    Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
    
    Connect3D(Link(i-1).p, Link(i).p,'b',9); hold on;
    
    DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az,radius, len, joint_col); hold on;
end

grid on;
% view(134,12);
axis([-200,200,-200,200,-100,200]);
xlabel('x');
ylabel('y');
zlabel('z');
drawnow;
pic=getframe;
if(fcla)
 cla;
end


