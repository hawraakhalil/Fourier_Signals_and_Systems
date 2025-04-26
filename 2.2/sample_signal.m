function [t_sample, x_sample] = sample_signal(t, xt, fs)
    Ts = 1/fs;
    t_sample = t(1):Ts:t(end);
    x_sample = interp1(t, xt, t_sample, 'linear');
end
