function [ result ] = zhengyundongxue( A )
%dh矩阵函数
zeta=A(1);
d=A(2);
a=A(3);
alf=A(4);

result=[cos(zeta)  -sin(zeta)*cos(alf)  sin(zeta)*sin(alf)  a*cos(zeta);
       sin(zeta)   cos(zeta)*cos(alf)    -cos(zeta)*sin(alf)  a*sin(zeta);
       0          sin(alf)             cos(alf)             d;
       0           0                    0                  1];

end



