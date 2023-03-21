syms pi d2 zeta1 zeta2 zeta3 A4  a1 a2 a3   nx ny nz ox oy oz ax ay az px py pz  U1;
%这是用来求正运动学中各个dh矩阵的
%p1=[0 d2 0 0];
p1=[zeta1 100 0 -pi/2];
A1=zhengyundongxue(p1);
A1=simplify(A1)

%p2=[zeta2 0 100 pi/2];
p2=[pi/2 d2 0 pi/2];
A2=zhengyundongxue(p2);
A2=simplify(A2)

%p3=[zeta3 0 100 0];
p3=[zeta3 0 100 0];
A3=zhengyundongxue(p3);
A3=simplify(A3)

A4=A1*A2*A3;
A4=simplify(A4)

a1=inv(A1);     %求逆
a2=inv(A2);
a3=inv(A3);
a1=simplify(a1)
a2=simplify(a2)
a3=simplify(a3)


U=[nx ox ax px;ny oy ay py;nz oz az pz;0 0 0 1];%设出要求的矩阵U

U1=a2*a1*U;
U1=simplify(U1)

