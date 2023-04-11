function res = Character_F(current_q, area_num, speed)
% To write "F" by using Jacobian method

q_end = Move_2_area(current_q, area_num,0.3);      % First move to the first quadrant to prepare for writing

current_q = q_end;
next_p = [100;  72; 88; 20; 300; 10];
q_end = current_2_next(current_q, next_p,0.15, 0); % Put down on canvas

current_q = q_end;
next_p = [100;  72; 6; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1); % The first line |

current_q = q_end;
next_p = [100;  72; 88; 20; 300; 10];
q_end = current_2_next(current_q,next_p,0.13, 0);  % Go back prepare for the second draw

current_q = q_end;
next_p = [100;  28; 88; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1); % Second part -

current_q = q_end;
next_p = [100;  72; 56; 20; 300; 10];
q_end = current_2_next(current_q,next_p,0.13, 0); % Go to next draw beginning

current_q = q_end;
next_p = [100;  28; 56; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1); % Third part -
res = character_L(q_end, 2, speed);                % Go to next character

end