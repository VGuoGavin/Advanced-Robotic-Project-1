function q_end = Move_2_area(current_q, area_num, speed)

q_initial  = current_q;

if area_num == 1
    p_target = [80;  50; 50; 20; 250; 10];
    q_end = Jacobian_trajectory(q_initial, p_target, speed, 0);
    Draw_UR5(q_end(1), q_end(2), q_end(3), q_end(4), q_end(5), q_end(6), 0);
else
    if area_num == 2
        p_target = [80;  -50; 50; 20; 250; 10];
        q_end = Jacobian_trajectory(q_initial, p_target, speed, 0);
        Draw_UR5(q_end(1), q_end(2), q_end(3), q_end(4), q_end(5), q_end(6), 0);
    else 
        if area_num == 3
            p_target = [80;  50; -50; 20; 250; 10];
            q_end = Jacobian_trajectory(q_initial, p_target, speed, 0);
            Draw_UR5(q_end(1), q_end(2), q_end(3), q_end(4), q_end(5), q_end(6), 0);
        else
            p_target = [80;  -50; -50; 20; 250; 10];
            q_end = Jacobian_trajectory(q_initial, p_target, speed, 0);
            Draw_UR5(q_end(1), q_end(2), q_end(3), q_end(4), q_end(5), q_end(6), 0);
        end
    end
end
