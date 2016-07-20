function [ observations ] = bernoulli_observations( n, p0, p1, change_time )
% Generates observations from bernoulli processes;
% n = length of process, p0, p1 = bernoulli process parameters, change_time = index at which observations are drawn from second process

observations = zeros(n, 1);
observations(1:change_time - 1) = rand(change_time - 1, 1) <= p0;
observations(change_time:end) = rand(n - change_time + 1, 1) <= p1;

end

