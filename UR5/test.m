close all
clear all
global Link


%% Forwards and Backwards part
 
error = [];  
num = 1;
speed = 1;
Current_p = [10,10,100];
area_num = 1;
FB_character_F(Current_p, area_num, speed)



figure
plot(1:num,error);
hold on
title("error")
%% Jacobian part

close all
clear all
speed = 0.1;
current_q = [pi/2, 0, 0, 0, 0, 0];
area_num = 1;
q_end = Character_F(current_q, area_num, speed);
next_p = [0;  0; 165; 20; 300; 10];
q_end = current_2_next(q_end,next_p,0.12, 0); 

