function J =  Jacobian(q)

a=[0,-0.42500,-0.39225,0,0,0];
d=[0.089159,0,0,0.10915,0.09465,0.08230];

T = Forwawrd(q);

r11 = T(1,1); r12 = T(1,2); r13 = T(1,3); px = T(1,4);
r21 = T(2,1); r22 = T(2,2); r23 = T(2,3); py = T(2,4);
r31 = T(3,1); r32 = T(3,2); r33 = T(3,3); pz = T(3,4);
s = sin(q);
c = cos(q);
s23 = sin(q(2)+q(3));
c23 = cos(q(2)+q(3));
s234 = sin(q(2)+q(3)+q(4));
c234 = cos(q(2)+q(3)+q(4));

J = zeros(6,6);
JA = [0, s(1), s(1), s(1), c(1)*s234, r13;
      0, -c(1),-c(1),-c(1),s(1)*s234, r23;
      1,    0,  0,      0,  -c234,    r33];

r0e = [px, py, pz]';
r1e = [px, py, pz-d(1)]';
r2e = [px-c(1)*c(2)*a(2), py-c(2)*s(1)*a(2), pz-s(2)*a(2)-d(1)]';
r3e = [px-c(1)*c23*a(3)- c(1)*c(2)*a(2), py-c23*s(1)*a(3), pz-s23*a(3)-s(2)*a(2)-d(1)]';
r4e = [r13*d(6)+c(1)*s234*d(5), r23*d(6)+s(1)*s234*d(5), r33*d(6)-c234*d(5)]';
r5e = [r13*d(6), r23*d(6), r33*d(6)]';

JL1 = [-py, px, 0]';
JL2 = [-c(1)*(pz-d(1)), -s(1)*(pz-d(1)), s(1)*py+c(1)*px ]';
JL3 = [c(1)*( s234*s(5)*d(6)+c234*d(5)-s23*a(3)), s(1)*(s234*s(5)*d(6)+c234*d(5)-s23*a(3)), -c234*s(5)*d(6)+s234*d(5)+c23*a(3)]';
JL4 = [c(1)*(s234*s(5)*d(6)+c234*d(5)), s(1)*(s234*s(5)*d(6)+c234*d(5)), -c234*s(5)*d(6)+s234*d(5)]';
JL5 = [-d(6)*(s(1)*s(5)+c(1)*c234*c(5)), d(6)*(c(1)*s(5)-c234*c(5)*s(1)), -c(5)*s234*d(6)]';
JL6 = [0, 0, 0]';

J1 = [JL1; JA(:,1)];
J2 = [JL2; JA(:,2)];
J3 = [JL3; JA(:,3)];
J4 = [JL4; JA(:,4)];
J5 = [JL5; JA(:,5)];
J6 = [JL6; JA(:,6)];

J = [J1, J2, J3, J4, J5, J6];








% 
% %% Extracting the link lengths
% d0 = link_lengths(1);
% d1 = link_lengths(2);
% d2 = link_lengths(3);
% d3 = link_lengths(4);
% d4 = link_lengths(5);
% d6 = link_lengths(6);
% 
% q0 = q(1);
% q1 = q(2);
% q2 = q(3);
% q3 = q(4);
% q4 = q(5);
% q5 = q(6);
% q6 = q(7);
% 
% %% Getting the forward kinematics
% T =  FK(q, link_lengths);
% T(1:3, 4) = 0;
% 
% %% Getting the jacobians
% Td = Tyd(q0)*Tz(d0)*Rz(q1)*Tx(d1)*Ry(q2)*Tx(d2)*Ry(q3)*Tx(d3)*Tz(d4)*Rx(q4)*Ry(q5)*Rx(q6)*Tx(d6) / T;
%  
% J1 = [ Td(1,4); Td(2,4); Td(3,4); Td(3,2); Td(1,3); Td(2,1)];
% 
% Td = Ty(q0)*Tz(d0)*Rzd(q1)*Tx(d1)*Ry(q2)*Tx(d2)*Ry(q3)*Tx(d3)*Tz(d4)*Rx(q4)*Ry(q5)*Rx(q6)*Tx(d6) / T;
%  
% J2 = [ Td(1,4); Td(2,4); Td(3,4); Td(3,2); Td(1,3); Td(2,1)];
% 
% Td = Ty(q0)*Tz(d0)*Rz(q1)*Tx(d1)*Ryd(q2)*Tx(d2)*Ry(q3)*Tx(d3)*Tz(d4)*Rx(q4)*Ry(q5)*Rx(q6)*Tx(d6) / T;
%  
% J3 = [ Td(1,4); Td(2,4); Td(3,4); Td(3,2); Td(1,3); Td(2,1)];
% 
% Td = Ty(q0)*Tz(d0)*Rz(q1)*Tx(d1)*Ry(q2)*Tx(d2)*Ryd(q3)*Tx(d3)*Tz(d4)*Rx(q4)*Ry(q5)*Rx(q6)*Tx(d6) / T;
%  
% J4 = [ Td(1,4); Td(2,4); Td(3,4); Td(3,2); Td(1,3); Td(2,1)];
% 
% Td = Ty(q0)*Tz(d0)*Rz(q1)*Tx(d1)*Ry(q2)*Tx(d2)*Ry(q3)*Tx(d3)*Tz(d4)*Rxd(q4)*Ry(q5)*Rx(q6)*Tx(d6) / T;
%  
% J5 = [ Td(1,4); Td(2,4); Td(3,4); Td(3,2); Td(1,3); Td(2,1)];
% 
% Td = Ty(q0)*Tz(d0)*Rz(q1)*Tx(d1)*Ry(q2)*Tx(d2)*Ry(q3)*Tx(d3)*Tz(d4)*Rx(q4)*Ryd(q5)*Rx(q6)*Tx(d6) / T;
%  
% J6 = [ Td(1,4); Td(2,4); Td(3,4); Td(3,2); Td(1,3); Td(2,1)];
% 
% Td = Ty(q0)*Tz(d0)*Rz(q1)*Tx(d1)*Ry(q2)*Tx(d2)*Ry(q3)*Tx(d3)*Tz(d4)*Rx(q4)*Ry(q5)*Rxd(q6)*Tx(d6) / T;
%  
% J7 = [ Td(1,4); Td(2,4); Td(3,4); Td(3,2); Td(1,3); Td(2,1)];
% 
% J = [J1, J2, J3, J4, J5, J6, J7];
end

