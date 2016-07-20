function [ pik ] = information_state_variable( observations, p0, p1, change_time_probability )
% Calculates the sequence of information state variables

pik = zeros(size(observations));

% Initial value of information state variable
% π_0 = P(x_0 = 1 | z_0) = q_1(z_0)p_0 / (q_1(z_0)p_0 + q_0(z_0)(1-p_0))
pik(1) = q(observations(1), p1) * change_time_probability / (q(observations(1), p1) * change_time_probability + q(observations(1), p0) * (1 - change_time_probability));

% Subsequent information state variable values
% π_k+1 = L_k+1(π_k + ξ_k * p_k+1) / ((1 - p_k+1)ξ_k + L_k+1 (π_k + ξ_k * p_k+1))
for k = 2:size(pik, 1) % Note the index shift.
    Lk = q(observations(k), p1) / q(observations(k), p0);
    pik(k) = Lk * (pik(k-1) + (1 - pik(k-1)) * change_time_probability) / ((1 - change_time_probability) * (1 - pik(k-1)) + Lk * (pik(k-1) + (1 - pik(k-1)) * change_time_probability));
end

end

function [value] = q(observation, p)
    if observation == 1
        value = p;
    else
        value = 1 - p;
    end

end
