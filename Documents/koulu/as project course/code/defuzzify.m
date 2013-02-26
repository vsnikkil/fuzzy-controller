function F = defuzzify(Bout, MFout)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% OTSO: Declared A, c, Ao and co here so their sizes are constant
A = zeros(1,length(MFout)); 
c = zeros(1,length(MFout)); 
Ao = zeros(1,length(MFout)-1); 
co = zeros(1,length(MFout)-1);
for i = 1:length(MFout)
    [A(i), c(i)] = caac(MFout(:,i), Bout(i)); % OTSO: MFout and Bout switched places
    
    if i < length(MFout)
        [Ao(i), co(i)] = overlap(MFout(:,i), MFout(:,i+1), Bout(i), Bout(i+1));
    end
end

F = (sum(c.*A) - sum(co.*Ao))/(sum(A) - sum(Ao));

end
