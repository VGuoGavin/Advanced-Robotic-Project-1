function [q, q_dot] = IK(q_0, p_global, flag)

[T, cur_pos] = FK(q_0);

tic
to_ras = 2*pi;
count = 0;
while norm(p_global(1:3) - cur_pos(1:3)) > 1e-01
    %[q, q_dot] = PseudoInverse(q_0, link_lengths, p_global, flag);
    %[q, q_dot] = Damped_LS(q_0, link_lengths, p_global);
    %[q, q_dot] = Null_Space(q_0, link_lengths, p_global, flag);
    [q, q_dot] = TaskAugmentation(q_0, p_global);
    [T,cur_pos] =  FK(q);
    disp("cur_pos")
    disp(cur_pos)
    clf;
    %Draw_UR5(q(1), q(2)/to_ras, q(3)/to_ras, q(4)/to_ras, q(5)/to_ras, q(6)/to_ras, 0)
    %Visualize_Robot(q, q_dot, T, T1, T2, T3, T4, T5, cur_pos, p_global, color_list, 0)
    pause(0.1);
    
    q_0 = q;
    count = count + 1; 
end
disp(cur_pos)
toc



end
