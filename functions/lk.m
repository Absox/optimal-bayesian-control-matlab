function [result] = lk(q, z)
    % Returns likelihood ratio Lk = q1(zk)/z0(zk)
    result = q(1, z) / q(0, z);
end