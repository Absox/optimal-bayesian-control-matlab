function [result] = expected_penalty(k, p, early)
% Calculates expected penalty
    if early % T > k : early stopping
        result = (1 - p)^k * (2 - p) / p;
    else % T < k : late stopping penalty
        result = (-2 * (1 - p)^k + p*((1 - p)^k - 2*k - 1) + 2) / ((p - 1) * p);
    end
end