% MFin is a matrix containing the points of the triangles on x-axis
% so that each column describes one triangle.
% 
% function returns matrix B which tells how much u belongs to each
% triangle. (u is the input)
%
% ISSUE: what if left/right point = middle point
% then we have a division by 0. Must be fixed somehow
%

function B = calculateBelonging(MFin, u)
B = zeros(1,3); % OTSO: Declare the size at the start

len = size(MFin); % Get the dimensions of MFin
len = len(2);  % This tells how many triangles there are

% Iterate through all the triangles
for i = 1:len
    % First check if u is in the boundaries of certain triangle
    if u > MFin(1, i) && u < MFin(3, i) % True if u is within the boundaries
        % Then check which side of the centerpoint u is
        if u < MFin(2, i) % Left side of the center point
            % Calculate "belonging" next
            b = (u - MFin(1, i)) / (MFin(2, i) - MFin(1, i));
        else % u must be on the right side, or in the middle
            b = (MFin(3, i) - u) / (MFin(3, i) - MFin(2, i));
        end
    else % u didn't belong to that triangle, add 0 belonging
        b = 0;
    end
    B(i) = b; % Add b to results % OTSO: Changed how the values are added to B
end

return;
