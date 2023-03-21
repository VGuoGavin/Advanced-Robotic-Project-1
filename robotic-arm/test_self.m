% 3 link robotic arm simulator. brute force from one place to another suing forward kinematics.
clc
clear
close all

%% Initial conditions
theta1=pi/12;
theta2=pi/12;
theta3=pi/12;
L1=1;
L2=1;
L3=1;
deltatheta1=0;
deltatheta2=0; 
deltatheta3=0; %theta1,2,3 velocity
Xc=1;
Yc=1;
a = 0;
b = 0;

%% moving initial point to ending point
while a == 0 
   while b == 0
     theta1=theta1+deltatheta1/2;
     theta2=theta2+deltatheta2/2;
     theta3=theta3+deltatheta3/2;

     % Jacobian matrix and inverse Jacobian.
     J= [-L1*sind(theta1)-L2*sind(theta1+theta2)-L3*sind(theta1+theta2+theta3),...
     -L2*sind(theta1+theta2)-L3*sind(theta1+theta2+theta3),...
     -L3*sind(theta1+theta2+theta3);...
     L1*cosd(theta1)+L2*cosd(theta1+theta2)+L3*cosd(theta1+theta2+theta3),...
     L2*cosd(theta1+theta2)+L3*cosd(theta1+theta2+theta3),...
     L3*cosd(theta1+theta2+theta3)];
     pseudoJ = pinv(J); 
     
     % End-effector location
     P3 = [L1*cosd(theta1)+L2*cosd(theta1+theta2)+L3*cosd(theta1+theta2+theta3);...
     L2*sind(theta1)+L2*sind(theta1+theta2)+L3*sind(theta1+theta2+theta3)]';
     P0 = [0 0];
      
     % Location of the middle two joints
     P1 = [L1*cosd(theta1) ; L1*sind(theta1)]';
     P2 = P1 + [L2*cosd(theta1+theta2);L2*sind(theta1+theta2)]';
     Q1=[P0(1,1) P1(1,1) P2(1,1) P3(1,1)];
     Q2=[P0(1,2) P1(1,2) P2(1,2) P3(1,2)];
     Img = plot(Q1,Q2,'-o','LineWidth',4);
     axis([-4,4,-4,4]);
     axis square
     grid on;
     Xinit=P3(1,1);
     Yinit=P3(1,2);
     Xend=Xc;
     Yend=Yc; 
     Xspeed=(Xend-Xinit);
     Yspeed=(Yend-Yinit);
     OrinEnd=atan2d(Yend,Xend);
     Orininit=atan2d(Yinit,Xinit);
     orin_error=OrinEnd-Orininit;

     % converging at error = 0.01 
     if abs(orin_error)<=0.01
        b=1;
     end
     
     thetadot=pseudoJ*[Xspeed;Yspeed];
     theta1dot=thetadot(1,1);
     theta2dot=thetadot(2,1);
     theta3dot=thetadot(3,1);
     deltatheta1=rad2deg(theta1dot); 
     deltatheta2=rad2deg(theta2dot);
     deltatheta3=rad2deg(theta3dot);
     pause(0.01);
   end
   
   %% taking input from cursor
   if b==1
       [Xc,Yc,buttons] = ginput;
       b=0;
   end
end
