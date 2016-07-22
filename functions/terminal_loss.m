function [result] = terminal_loss(m, pim, q, a1, p)
% Calculates omega-m: expected terminal loss.
    expected_phi = pi_next(pim, 0, q, p) * likelihood(0, q, p, pim) + pi_next(pim, 1, q, p) * likelihood(1, q, p, pim);
    result = a1 * expected_penalty(m, p, true) * (1 - expected_phi);
end