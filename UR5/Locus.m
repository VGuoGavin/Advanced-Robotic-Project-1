function end_point = Locus(x,y,z, type, write) %x,y,z, type:是否删除上一帧
global X2_g;
global Y2_g;
global Z2_g;

[~, ~, ~, ~, ~, T_end] = Forward([0, 0, 0, 0,-pi/2,0 ]); % 先求变换矩阵
T = T_end;
T (1,4) = x/200;         % 变换一下单位 = mm * 1000 / 5
T (2,4) = y/200;
T (3,4) = z/200;
Inv = real(Backward(T)); % 单独求逆运算

[~, ~, ~, ~, ~, T_trajectory]= Forward([Inv(1,1),Inv(1,2),Inv(1,3),Inv(1,4),Inv(1,5),Inv(1,6)]); 
%disp(Inv);
if write

    Draw_UR5(Inv(1,1),Inv(1,2),Inv(1,3),Inv(1,4),Inv(1,5),Inv(1,6), type);

    X2_g = [X2_g, T_trajectory(1, 4)*200];
    Y2_g = [Y2_g, T_trajectory(2, 4)*200];
    Z2_g = [Z2_g, T_trajectory(3, 4)*200];

    end_point = T_trajectory(1:3, 4);

else
    Draw_UR5(Inv(1,1),Inv(1,2),Inv(1,3),Inv(1,4),Inv(1,5),Inv(1,6), type);
    end_point = T_trajectory(1:3, 4);
    %
    % 
    % end_point = mid_point(x_last, y_last, z_last, x_next, y_next, z_next);
end

%Draw_UR5(Inv(2,1),Inv(2,2),Inv(2,3),Inv(1,4),Inv(1,5),Inv(1,6), type);
%Draw_UR5(Inv(3,1),Inv(3,2),Inv(3,3),Inv(3,4),Inv(3,5),Inv(3,6), type);
%Draw_UR5(Inv(4,1),Inv(4,2),Inv(4,3),Inv(4,4),Inv(4,5),Inv(4,6), type);
%Draw_UR5(Inv(5,1),Inv(5,2),Inv(5,3),Inv(5,4),Inv(5,5),Inv(5,6), type);
%Draw_UR5(Inv(6,1),Inv(6,2),Inv(6,3),Inv(6,4),Inv(6,5),Inv(6,6), type);
%Trajectory = T_trajectory(1:3,4)';
end