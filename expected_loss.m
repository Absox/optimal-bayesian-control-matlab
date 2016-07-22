function [wk] = expected_loss(m, pik, q, p, a1, a2)
    wk = zeros(m, 1);
    wk(m) = terminal_loss(m, pik(m), q, a1, p);

    for i = m-1:-1:1
        wk(i) = omega(i, wk(i+1), pik(i), q, p, a1, a2);
    end
end