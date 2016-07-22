function [result] = g(k, pik, uk, a1, a2, p)
% Stage error for given stage, information state, control, and transition probability

    if uk
        result = a1 * expected_penalty(k, p, true) * (1 - pik);
    else
        result = a2 * expected_penalty(k, p, false) * pik;
    end

end