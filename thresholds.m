function [fk] = thresholds(omega, pik, z, a1, a2, p)
    fk = zeros(size(z));
    for i = 1:size(fk, 1)
        fk(i) = (a1 * expected_penalty(i, p, true) - omega(i)) / (a1 * expected_penalty(i, p, true) + a2 * expected_penalty(i, p, false));
    end
end