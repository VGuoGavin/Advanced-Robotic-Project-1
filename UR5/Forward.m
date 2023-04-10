function [T_01, T_02, T_03, T_04, T_05, T_end] = Forward(theta)
%disp('Inicializando parametros...')
q1 = theta(1);
q2 = theta(2);
q3 = theta(3);
q4 = theta(4);
q5 = theta(5);
q6 = theta(6);

   %   a     alfa      d         teta
DH=[    0,	  pi/2,	  0.0892,	 q1;
    0.425,	  0,	  0.0,	     q2;
    0.392,	  0,	  0.0,       q3;
      0.0,	  pi/2,	  0.109,     q4;
      0.0,	 -pi/2,	  0.095,	 q5;
      0.0,	  0.0,	  0.0825,	 q6];

T_01 = (Translation(DH(1,3), 'z') * Rotation(DH(1,4), 'z') * Translation(DH(1,1), 'x') * Rotation(DH(1,2), 'x'));
T_12 = (Translation(DH(2,3), 'z') * Rotation(DH(2,4), 'z') * Translation(DH(2,1), 'x') * Rotation(DH(2,2), 'x'));
T_23 = (Translation(DH(3,3), 'z') * Rotation(DH(3,4), 'z') * Translation(DH(3,1), 'x') * Rotation(DH(3,2), 'x'));
T_34 = (Translation(DH(4,3), 'z') * Rotation(DH(4,4), 'z') * Translation(DH(4,1), 'x') * Rotation(DH(4,2), 'x'));
T_45 = (Translation(DH(5,3), 'z') * Rotation(DH(5,4), 'z') * Translation(DH(5,1), 'x') * Rotation(DH(5,2), 'x'));
T_56 = (Translation(DH(6,3), 'z') * Rotation(DH(6,4), 'z') * Translation(DH(6,1), 'x') * Rotation(DH(6,2), 'x'));
 
T_02 = (T_01 * T_12);
T_03 = (T_02 * T_23);
T_04 = (T_03 * T_34);
T_05 = (T_04 * T_45);
T_end = (T_05 * T_56); %The end is the same with T_06

end

