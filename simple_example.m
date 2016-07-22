% Toy implementation of optimal stopping - uses geometric stopping time, bernoulli processes
% Ran Liu, rliu14@jhu.edu

addpath('functions');

close all;
clear;

% Parameters
observations_length = 5000;             % Number of observations
change_time_probability = 1/2000;       % Probability of state change
p0 = 0.3;                              % Bernoulli process probabilities in each state
p1 = 0.75;
a1 = 200;                                 % Loss function gains for early, late detection
a2 = 1;

q = @(x, z) bernoulli_q(x, z, p0, p1);  % Lambda for qx(z) aliases function into the proper format, while passing our parameters.
p = @(k) change_time_probability;       % Lambda for pk literally just returns a constant in our geometric change time model.

% Generate observations
change_time = observations_length + 1;
while (change_time > observations_length)
    change_time = geornd(change_time_probability);      % Determine change time as a geometric random variable.
end

observations = bernoulli_observations(observations_length, p0, p1, change_time);

% Calculate information state variable for each time step k
pik = information_state_variable(observations, p, q);

% Calculate loss values
omega_k = expected_loss(observations_length, pik, q, change_time_probability, a1, a2);

% Calculate thresholds for each time step
f_k = thresholds(omega_k, pik, observations, a1, a2, change_time_probability);

detection_time = min(find(pik >= f_k));

fprintf('Detection time: %d; Actual change time: %d;\n', detection_time, change_time);

figure;
plot(pik);
hold on;
plot(f_k);
hold off;
vline(change_time);
vline(detection_time);