function [result] = omega(k, wk, pik, q, p, a1, a2)

    phi_0 = pi_next(pik, 0, q, p);
    phi_1 = pi_next(pik, 1, q, p);
    l0 = likelihood(0, q, p, pik);
    l1 = likelihood(1, q, p, pik);

    omega_go = g(k, phi_0, 1, a1, a2, p) * l0 + g(k, phi_1, 1, a1, a2, p) * l1;
    omega_stay = g(k, phi_0, 0, a1, a2, p) * l0 + g(k, phi_1, 0, a1, a2, p) * l1 + wk;

    result = min(omega_stay, omega_go);
end