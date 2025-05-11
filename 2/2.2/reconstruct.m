function xrcon = reconstruct(t, x_sample, fs, N)
    Ts = 1/fs;                                      % sampling period
    t_sample = 0:Ts:(length(x_sample)-1)*Ts;        % discrete sample times
    xrcon = zeros(size(t));                         % initialize reconstructed signal
    
    for i = 1:length(t)                              % loop over each output time point
        % find sample indices within N*Ts of current time t(i)
        relevant_idx = find(abs(t_sample - t(i)) <= N*Ts);
        
        for n = relevant_idx                         % loop over nearby sample points
            sinc_arg = fs * (t(i) - t_sample(n));    % scaled sinc argument
            xrcon(i) = xrcon(i) + x_sample(n) * mysinc(sinc_arg);  % weighted sinc interpolation
        end
    end
end



% --- Helper sinc function ---
function y = mysinc(x)
    y = ones(size(x));
    idx = x ~= 0;
    y(idx) = sin(pi*x(idx)) ./ (pi*x(idx));
end