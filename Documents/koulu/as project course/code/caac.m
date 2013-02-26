function [A, cent] = caac(MF, B)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
a = 0; b = 0; c = 0; d = 0; ll = 0; el = 0; er = 0; lr = 0;
if B == 0
    A = 0;
    cent = 0;
    
elseif B < 1% Check if the overlap area is a trapezoid
        % Overlap is a trapezoid        
        % See http://mathworld.wolfram.com/Trapezoid.html for the formulas
        % used in calculating the centroid of the trapezoid
        b = MF(3)-MF(1); % Lenght of the lower parallel side
        a = b*(1-B); % Length of the upper parallel side (using similar triangles)
        el = MF(2)-MF(1); % Dummy variable for calculating the legth of the left side
        ll = B*el; % Dummy variable for calculating the legth of the left side
        c = sqrt(ll^2+B^2); % Length of the left side

        er = MF(3) - MF(2); % Dummy variable for calculating the legth of the right side
        lr = B*er; % Dummy variable for calculating the legth of the right side
        d = sqrt(lr^2+B^2); % Length of the right side
        cent = MF(1) + b/2 + (2*a+b)*(c^2-d^2)/(6*(b^2-a^2)); % Centroid of the trapezoid
        
        A = B*(a+b)/2; % Area of the trapezoid
    else % Overlap is a triangle
        % Calcuate the size of the overlap triangle
        A = 1/2*1*(MF(3)-MF(1)); % Area of the triangle
        cent = 1/3*(MF(3)+MF(1)+MF(2)); % Centroid ofthe triangle
end

end

