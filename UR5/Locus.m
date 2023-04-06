function res = Locus(x,y,z, type) %x,y,z, type:是否删除上一帧
    T06 = Forwawrd([0,0,0,0,-pi/2,0]); % 先求变换矩阵
    T = T06;
    T (1,4) = x/200;         % 变换一下比例
    T (2,4) = y/200;
    T (3,4) = z/200;
    Inv = real(Backward(T)); % 单独求逆运算
    %disp(Inv);
    Draw_UR5(Inv(1,1),Inv(1,2),Inv(1,3),Inv(1,4),Inv(1,5),Inv(1,6), type);
    %Draw_UR5(Inv(2,1),Inv(2,2),Inv(2,3),Inv(1,4),Inv(1,5),Inv(1,6), type);
    %Draw_UR5(Inv(3,1),Inv(3,2),Inv(3,3),Inv(3,4),Inv(3,5),Inv(3,6), type);
    %Draw_UR5(Inv(4,1),Inv(4,2),Inv(4,3),Inv(4,4),Inv(4,5),Inv(4,6), type);
    %Draw_UR5(Inv(5,1),Inv(5,2),Inv(5,3),Inv(5,4),Inv(5,5),Inv(5,6), type);
    %Draw_UR5(Inv(6,1),Inv(6,2),Inv(6,3),Inv(6,4),Inv(6,5),Inv(6,6), type);
end