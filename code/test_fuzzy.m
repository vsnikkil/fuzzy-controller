% Test the algorithm
theta = -0.4; % Value for angle (first input)
thetad = 0; % Value for the angluar speed (second input)
MFin1 = [-1.8 -0.8 0.2; % Membership functions for angle
         -1.0  0.0 1.0;
         -0.2  0.8 1.8];
MFin2 = [-5.4 -2.4 0.6; % Membership functions for angular speed
         -3.0  0.0 3.0;
         -0.6  2.4 5.4];
R = [1 1 2; % Rules matrix
     1 2 3;
     2 3 3];
MFout = [-3.6 -1.6 0.4; % Membership functions for output
         -2.0  0.0 2.0;
         -0.4  1.6 3.6];
testFunction(theta, thetad, MFin1, MFin2, R, MFout)