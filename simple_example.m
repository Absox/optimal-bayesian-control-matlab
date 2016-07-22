% Toy implementation of optimal stopping - uses geometric stopping time, bernoulli processes
% Ran Liu, rliu14@jhu.edu

addpath('functions');

% Parameters
observations_length = 3000;             % Number of observations
change_time_probability = 1/1000;       % Probability of state change
p0 = 0.25;                              % Bernoulli process probabilities in each state
p1 = 0.75;
a1 = 1;                                 % Loss function gains for early, late detection
a2 = 1;

q = @(x, z) bernoulli_q(x, z, p0, p1);  % Lambda for qx(z) aliases function into the proper format, while passing our parameters.
p = @(k) change_time_probability;       % Lambda for pk literally just returns a constant in our geometric change time model.

% Generate observations
change_time = geornd(change_time_probability);      % Determine change time as a geometric random variable.
observations = bernoulli_observations(observations_length, p0, p1, change_time);

% Calculate information state variable for each time step k
pik = information_state_variable(observations, p, q);

% Calculate loss values

% Calculate thresholds for each time step