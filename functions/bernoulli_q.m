function [value] = bernoulli_q(state, observation, p0, p1)
    % Probability of observations for two state HMM that generates a Bernoulli process
    if observation == 1
        if state == 0
            value = p0;
        else
            value = p1;
        end
    else
        if state == 0
            value = 1 - p0;
        else
            value = 1 - p1;
        end
    end
end
