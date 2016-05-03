function [olsize, olcent] =  overlap(L, R, h1, h2)
%overlap calculates the size and centroid of the overlap between two
%membership functions when the height of the overlap is h
%   usage: [olsize, olcent] = overlap(L, R, h)
%   output: olsize: size of the overlap
%           olcent: x coordinate of the centroid of the overlap
%   inputs: L: x coordinates of the left triangle (left, center, right)
%           R: x coordinates of the right triangle (left, center, right)
%           h: height at which the overlap is calculated
h = min(h1, h2);
a = 0; b = 0; c = 0; d = 0; ll = 0; el = 0; er = 0; lr = 0;
if h == 0
    
    olsize = 0;
    olcent = 0;
elseif L(3) > R(1) % Check if the membership funtions overlap
    
    % Calculate x coordiate of the top of the overlap triangle
    kl = -1/(L(3)-L(2)); % Slope of the left triangle 
    kr = 1/(R(2)-R(1)); % Slope of the right triangle
    xcross = 1/(kl-kr)*(kl*L(2)-kr*R(2)); % X coordinate of the membership function crossing point

    ycross = kl*(xcross-L(2))+1; % Y coordinate of the membership function crossing point

    if ycross >= h % Check if the overlap area is a trapezoid
        % Overlap is a trapezoid        
        % See http://mathworld.wolfram.com/Trapezoid.html for the formulas
        % used in calculating the centroid of the trapezoid
        b = L(3)-R(1); % Lenght of the lower parallel side
        a = b*(ycross-h)/ycross; % Length of the upper parallel side (using similar triangles)
        el = xcross-R(1); % Dummy variable for calculating the legth of the left side
        ll = h*el/ycross; % Dummy variable for calculating the legth of the left side
        c = sqrt(ll^2+h^2); % Length of the left side

        er = L(3) - xcross; % Dummy variable for calculating the legth of the right side
        lr = h*er/ycross; % Dummy variable for calculating the legth of the right side
        d = sqrt(lr^2+h^2); % Length of the right side
        olcent = R(1) + b/2 + (2*a+b)*(c^2-d^2)/(6*(b^2-a^2)); % Centroid of the trapezoid
        
        olsize = h*(a+b)/2; % Area of the trapezoid
    else % Overlap is a triangle
        % Calcuate the size of the overlap triangle
        olsize = 1/2*ycross*(L(3)-R(1)); % Area of the triangle
        olcent = 1/3*(L(3)+R(1)+xcross); % Centroid ofthe triangle
    end

else % No overlap
    olsize = 0; % Size of the overlap is 0
    olcent = 0; % Centroid of the overlap is 0
end
end

