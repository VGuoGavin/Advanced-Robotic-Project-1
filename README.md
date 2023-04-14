<<<<<<< Jacobian
UR5 
1.Jacobian-inverse method simulation
2. Forwards and Backwards simulation
Code structure
————————————————————————————————————————————————------
Main.m 			   | Codes entrance including 2 methods
————————————————————————————————————————————————------
- Backwards.m             | Calculate the Backwards matrix
- Forwards.m                | Calculate the forwards matrix
- Jacobian_calculation  | Calculate the Jacobian matrix
- Matrix_DH_Ln.m.        | Based on DH parameters calculate forwards matrix
- Rotation.m                  | Calculate the rotation matrix
-Translation.m.              | Calculate the translation matrix
————————————————————————————————————————————————------
Jacobian methed writing related functions.
- Jacobian_trajectory.m  | Calculate the inverse of Jacobian and the next position
- Character_F.m.            | Writing “F” packaged function
- Character_L.m.            | Writing “L” packaged function
- Character_O.m.           | Writing “O” packaged function
- Character_W.m.           | Writing “W” packaged function
- current_2_next.m.        | End of manipulator  from one position to next one
- Move_2_ara.m.            | End of manipulator move to quadrant 1-4
————————————————————————————————————————————————------
Forwards and Backwards methods
- Locus.m.                        | Locus the position torque by giving the target x,y,z
- FB_Character_F.m.       | Writing “F” packaged function
- FB_Character_L.m.       | Writing “L” packaged function
- FB_Character_O.m.      | Writing “O” packaged function
- FB_Character_W.m.      | Writing “W” packaged function
- FB_current_2_next.m.   | End of manipulator  from one position to next one
- FB_Move_2_ara.m.       | End of manipulator move to quadrant 1-4
- mid_point.m                   | Used to calculate the centre point between two positions
——————————————————————————————————------——————————————------
UI design related functions
DrawCylinder.m               | Draw the joint function
Connect3D.m                  | Draw the links function
Draw_UR5.m.                 | Combine the UI with draw function parameters to draw UR5
——————————————————————————————————-----------------------------------
No need to install any other toolbox. Directly run the main.m function.
! !! Please pay attention that, only one trajectory can be shown in one time. Which means several lines codes In Draw_UR5.m located at bottom should be valid or invalid based on which method is running. The Jacobian method is default.


Other resources:
# 3-DOF-Robotic-Arm-Simulation
=======
# Robotic-Arm-Simulation

This is our project, we build our own codes on the orginal codes written by others.

UI- https://blog.csdn.net/weixin_42159320/article/details/88877770

Forwards & Inverse calculation https://blog.csdn.net/sinat_32804425/article/details/122125911

>>>>>>> main

This project presents a manipulation of a 3 link robotic arm joints and trajectory control scheme for a 3-link planar manipulator. The manipulator is simulated with the general equations of motion along with the provided boundary conditions. Forward Kinematics equations were the base equations of motions to manipulate the robotic arm in the workspace. The regional work-space and limit of the manipulator forces the robotic arm to shake infinitely. In order to control and make the arm in the steady state position, least damped square function is considered for minimum vibration position. The damping factor is 0.3 is considered the most suitable for this particular 3-link manipulator. Different observations are made through limiting the joint constraints varying the angle of the joints.


Jacobian:
https://github.com/yonchien/Comau_IK



Second part:
https://github.com/MAminSFV/UR5.git
https://github.com/AshankRudola/6DOF-robotic-arm

