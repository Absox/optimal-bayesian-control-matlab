% Toy implementation of optimal stopping - uses geometric stopping time, bernoulli process
% Ran Liu, rliu14@jhu.edu

% Parameters
observations_length = 3000;         % Number of observations
change_time_probability = 1/1000;   % Probability of state change
p0 = 0.25;                          % Bernoulli process probabilities in each state
p1 = 0.5;

% Generate observations
change_time = geornd(change_time_probability);      % Determine change time as a geometric random variable.
observations = bernoulli_observations(observations_length, p0, p1, change_time);