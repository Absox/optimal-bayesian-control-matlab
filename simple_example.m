% Toy implementation of optimal stopping - uses geometric stopping time, bernoulli processes
% Ran Liu, rliu14@jhu.edu

% Parameters
observations_length = 3000;         % Number of observations
change_time_probability = 1/1000;   % Probability of state change
p0 = 0.25;                          % Bernoulli process probabilities in each state
p1 = 0.5;

% Generate observations
change_time = geornd(change_time_probability);      % Determine change time as a geometric random variable.
observations = bernoulli_observations(observations_length, p0, p1, change_time);

% Calculate information state variable for each time step k
pik = information_state_variable(observations, p0, p1, change_time_probability);

% Calculate loss values

% Calculate thresholds for each time step