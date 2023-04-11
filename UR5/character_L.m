function res = character_L(current_q, area_num, speed)

%q_end = Move_2_area(current_q, area_num, speed);  %先移动到对应单元格上方
speed = 0.08;
current_q = current_q;
next_p = [100;  -28; 88; 20; 300; 10];
q_end = current_2_next(current_q, next_p,speed, 0); %Put down and prepare to write

current_q = q_end;
next_p = [100;  -28; 6; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);  % The first line |


current_q = q_end;
next_p = [100;  -78; 7; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);

res = character_O(current_q, area_num, 0.12);
end