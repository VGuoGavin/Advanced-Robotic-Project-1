function q_end  = Jacobian_trajectory(q_begin, p_target, speed, write)

global X_g;  %Used fot storing the writing paths
global Y_g;
global Z_g;
global F_time_flag
global L_time_flag
global O_time_flag
global W_time_flag
global F_time
global L_time
global O_time
global W_time

XX_real = [];  
YY_real = [];  
ZZ_real = [];  

p_target = p_target/200;   %Unit translation because of the size of image : The calculation = 200 : 1
q = q_begin;
q_comf = q;
eps = 0.02 ;
C = eye(6) * 1000;
step = 0;

Winv = zeros(6);
for i = 1:6
    Winv(i,i) = i/6 + 0.1;
end


[~, ~, ~, ~, ~, T_end, ~]  = Jacobian_calculation(q(1), q(2), q(3), q(4), q(5), q(6)); 
T_full_curr = T_end;            % Get the destination first
y(1:3) = T_full_curr(1:3,4);
y(4) = atan2(T_full_curr(3,2), T_full_curr(3,3));
y(5) = atan2(-T_full_curr(3,1), sqrt(T_full_curr(3,2)^2 + T_full_curr(3,3)^2));
y(6) = atan2(T_full_curr(2,1), T_full_curr(1,1));
%error = sum(abs(p_target - y));     % calculate the error distance to determine stop or not
distance = sqrt(   (p_target(1) - y(1))^2+ (p_target(2) - y(2))^2+ (p_target(3) - y(3))^2  );


while (distance > eps)
    if F_time_flag ==1 | L_time_flag ==1 | O_time_flag ==1 | W_time_flag ==1 
        tic
    end
    [~, ~, ~, ~, ~, T_end, J_curr] = Jacobian_calculation(q(1), q(2), q(3), q(4), q(5), q(6));
    % Get the end position and Jocabian matrix
    Jh = Winv * J_curr' * inv(J_curr * Winv * J_curr' + inv(C));  % pinv(J_curr);   % Calculate the inverse of Jacobian matrix
    y = zeros(6,1);
    T_full_curr = T_end; 
    y(1:3) = T_full_curr(1:3,4);
    y(4) = atan2(T_full_curr(3,2), T_full_curr(3,3));
	y(5) = atan2(-T_full_curr(3,1), sqrt(T_full_curr(3,2)^2 + T_full_curr(3,3)^2));
	y(6) = atan2(T_full_curr(2,1), T_full_curr(1,1));
    distance = sqrt(   (p_target(1) - y(1))^2+ (p_target(2) - y(2))^2+ (p_target(3) - y(3))^2  );

    q = q + 10*speed * Jh*(((p_target - y))/(130*distance)); 
    
    Draw_UR5(q(1), q(2), q(3), q(4), q(5), q(6), 1);
    
    if step >0 && write % Control write or not
        XX_real(step) = 200*T_full_curr(1,4);
        YY_real(step) = 200*T_full_curr(2,4);
        ZZ_real(step) = 200*T_full_curr(3,4);
        plot3(XX_real, YY_real, ZZ_real, 'r.');  % Write
        hold on;
    end
    if F_time_flag ==1 
        F_time = F_time + toc;
    end
    if L_time_flag ==1 
        L_time =  L_time + toc;
    end
    if O_time_flag ==1 
        O_time =  O_time + toc;
    end
    if W_time_flag ==1 
        W_time =  W_time + toc;
    end
        step = step + 1;    % Count the steps
    end
    X_g = [X_g, XX_real];
    Y_g = [Y_g, YY_real];
    Z_g = [Z_g, ZZ_real];
    q_end = q;
end
