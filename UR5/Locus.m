function res = Locus(x,y,z, type) %x,y,z, type:是否删除上一帧
    T06 = Forwawrd([0,0,0,0,0,0]); % 先求变换矩阵
    T = T06;
    T (1,4) = x/200;   % 变换一下比例
    T (2,4) = y/200;
    T (3,4) = z/200;
    Inv = Backward(T); % 单独求逆运算
    Draw_UR5(Inv(1,1),Inv(1,2),Inv(1,3),Inv(1,4),Inv(1,5),Inv(1,6), type);
end