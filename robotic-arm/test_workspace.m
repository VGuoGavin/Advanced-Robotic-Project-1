% finding workspace using joint constraints

clc
clear
close all

%% initial conditions
L1=1;
L2=1;
L3=1;

%% joint constraints
for theta1 = -180:10:180
    for theta2 = 0:10:0
        for theta3 = -180:10:180     
     
            % end-effector location
            P3 = [L1*cosd(theta1)+L2*cosd(theta1+theta2)+L3*cosd(theta1+theta2+theta3),...
            L2*sind(theta1)+L2*sind(theta1+theta2)+L3*sind(theta1+theta2+theta3)];
            
            % plotting all possible points with joint constraints
            plot(P3(1,1),P3(1,2), '*')
            axis([-4,4,-4,4]);
            axis square
            grid on;
            hold on
        end
    end
end

