function [result] = pi_next(previous, observation, q, pk)
    % Returns π_k(π_k-1, z_k), given q and transition probability
    likelihood_ratio = lk(q, observation);
    % π_k+1 = L_k+1(π_k + ξ_k * p_k+1) / ((1 - p_k+1)ξ_k + L_k+1 (π_k + ξ_k * p_k+1))
    result = likelihood_ratio * (previous + (1 - previous) * pk) / ((1 - pk) * (1 - previous) + likelihood_ratio * (previous + (1 - previous) * pk));
end