function [T06]=myfkine(q)

theta1 = q(1,1);
theta2 = q(1,2);
theta3 = q(1,3);
theta4 = q(1,4);
theta5 = q(1,5);
theta6 = q(1,6);
% MDH=[q(1,1)        60       0         0;
%      q(1,2)-pi/2   0        0         -pi/2;
%      q(1,3)-pi/2   0        150       0;
%      q(1,4)        130      70        -pi/2;
%      q(1,5)+pi/2    0        0         pi/2;
%      q(1,6)        90       0         -pi/2];
MDH=[theta1        60       0         0;
     theta2-pi/2   0        0         -pi/2;
     theta3-pi/2   0        150       0;
     theta4        130      70        -pi/2;
     theta5+pi/2    0        0         pi/2;
     theta6        90       0         -pi/2];

T01 = matrixT(MDH(1,3), MDH(1,4), MDH(1,2), MDH(1,1));
T12 = matrixT(MDH(2,3), MDH(2,4), MDH(2,2), MDH(2,1));
T23 = matrixT(MDH(3,3), MDH(3,4), MDH(3,2), MDH(3,1));
T34 = matrixT(MDH(4,3), MDH(4,4), MDH(4,2), MDH(4,1));
T45 = matrixT(MDH(5,3), MDH(5,4), MDH(5,2), MDH(5,1));
T56 = matrixT(MDH(6,3), MDH(6,4), MDH(6,2), MDH(6,1));

T06=T01*T12*T23*T34*T45*T56;
