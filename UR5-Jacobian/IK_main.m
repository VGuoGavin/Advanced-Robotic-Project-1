clear
close all
clc

l_rate = 0.1;
q_initial = [pi/2, pi/2, 0, 0, 0, 0];
q = q_initial;
[T_01, T_02, T_03, T_04, T_05, T_end, J] = Jacobian_calculation(q(1), q(2), q(3), q(4), q(5), q(6));
q_comf = q;
eps = 0.1;

%y_ini = subs(T_0eff(1:3,4));
y_target = [0.4; 0.4; 0.4; -1; 1; -1];

Winv = zeros(6);
for i = 1:6
    Winv(i,i) = i/6 + 0.1;
end

C = eye(6) * 1000;
step = 0;
dcost = 1000;
cost = 0;
old_cost = 0;

T_full_curr = T_end;
y(1:3) = T_full_curr(1:3,4);
y(4) = atan2(T_full_curr(3,2), T_full_curr(3,3));
y(5) = atan2(-T_full_curr(3,1), sqrt(T_full_curr(3,2)^2 + T_full_curr(3,3)^2));
y(6) = atan2(T_full_curr(2,1), T_full_curr(1,1));
error = sum(abs(y_target - y));
while (error > eps)
    [T_01, T_02, T_03, T_04, T_05, T_end, J_curr] = Jacobian_calculation(q(1), q(2), q(3), q(4), q(5), q(6));
    Jh = Winv * J_curr' * inv(J_curr * Winv * J_curr' + inv(C));
    y = zeros(6,1);
    T_full_curr = T_end;
    y(1:3) = T_full_curr(1:3,4);
    y(4) = atan2(T_full_curr(3,2), T_full_curr(3,3));
	y(5) = atan2(-T_full_curr(3,1), sqrt(T_full_curr(3,2)^2 + T_full_curr(3,3)^2));
	y(6) = atan2(T_full_curr(2,1), T_full_curr(1,1));
    q = q + l_rate*(Jh*(y_target - y)); 
    Draw_UR5(q(1), q(2), q(3), q(4), q(5), q(6), 1);
    step = step + 1;
    dq = q_comf - q;
    cost = dq' * Winv * dq;
    dcost = abs(cost - old_cost);
    old_cost = cost;
    error = sum(abs(y_target - y));
end
Draw_UR5(q(1), q(2), q(3), q(4), q(5), q(6), 0);
