function Bout = applyRules(R, B1, B2, MFout) % OTSO: added the output membership functions as an input
% applyRules Applies fuzzy control rules defined by matrix R

Bout = zeros(length(MFout), 1); % OTSO: changed this from max(max(R))
for i = 1:length(B1)
    for j = 1:length(B2)
        z = min(B1(i), B2(j));
        ind = R(i,j);
        if z > Bout(ind)
            Bout(ind) = z;
        end
    end
end

end
