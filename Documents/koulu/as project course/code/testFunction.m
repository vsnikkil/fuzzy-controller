function F = testFunction(theta, thetad, MFin1, MFin2, R, MFout)
% This function should be identical to that used in our controller
Btheta = calculateBelonging(MFin1, theta);
Bthetad = calculateBelonging(MFin2, thetad);
Bout = applyRules(R, Btheta, Bthetad, MFout);
F = defuzzify(Bout, MFout);