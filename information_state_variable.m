function [ pis ] = information_state_variable( observations, p, q )
% Calculates the sequence of information state variables

    pis = zeros(size(observations));

    % Initial value of information state variable
    % π_0 = P(x_0 = 1 | z_0) = q_1(z_0)p_0 / (q_1(z_0)p_0 + q_0(z_0)(1-p_0))
    pis(1) = q(1, observations(1)) * p(1) / (q(1, observations(1)) * p(1) + q(0, observations(1)) * (1 - p(1)));

    % Subsequent information state variable values
    for k = 2:size(pis, 1) % Note the index shift.
        pis(k) = pi_next(pis(k - 1), observations(k), q, p(k));
        %Lk = q(observations(k), p1) / q(observations(k), p0);
    end

end

