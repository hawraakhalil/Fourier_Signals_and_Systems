function [t_sample, x_sample] = sample_signal(t, xt, fs)
% SAMPLE samples a continuous-time signal at a given sampling rate fs.
% Input:
%   t  - original time vector
%   xt - continuous signal vector (same size as t)
%   fs - sampling frequency in Hz
% Output:
%   t_sample  - sampled time vector (uniform spacing 1/fs)
%   x_sample  - values of xt at the sampled times

    Ts = 1/fs;                        % sampling interval
    t_sample = t(1):Ts:t(end);       % create sample times from t(1) to t(end)
    x_sample = interp1(t, xt, t_sample, 'linear');  % interpolate xt at those times

end
