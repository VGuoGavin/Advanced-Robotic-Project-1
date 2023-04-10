function res = character_F(current_q, area_num, speed)

q_end = Move_2_area(current_q, area_num,0.3);  %先移动到对应单元格上方

current_q = q_end;
next_p = [100;  72; 88; 20; 300; 10];
q_end = current_2_next(current_q, next_p,0.15, 0); %Put down and prepare to write

current_q = q_end;
next_p = [100;  72; 6; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);  % The first line |


current_q = q_end;
next_p = [100;  72; 88; 20; 300; 10];
q_end = current_2_next(current_q,next_p,0.13, 0);  % Go back prepare for the second -


current_q = q_end;
next_p = [100;  28; 88; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);


current_q = q_end;
next_p = [100;  72; 56; 20; 300; 10];
q_end = current_2_next(current_q,next_p,0.13, 0);

current_q = q_end;
next_p = [100;  28; 56; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);
res = character_L(q_end, 2, speed);
end