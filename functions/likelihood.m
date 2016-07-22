function [result] = likelihood(z, q, p, pim)
    % Likelihood of an observation, given history.
    result = q(1, z) * (pim + (1-pim) * p) + q(0, z) * (1 - p) * (1 - pim);
end