function xrcon = reconstruct(t, x_sample, fs, N)
    Ts = 1/fs;
    t_sample = 0:Ts:(length(x_sample)-1)*Ts;
    xrcon = zeros(size(t));
    
    for i = 1:length(t)
        relevant_idx = find(abs(t_sample - t(i)) <= N*Ts);
        for n = relevant_idx
            sinc_arg = fs * (t(i) - t_sample(n));
            xrcon(i) = xrcon(i) + x_sample(n) * mysinc(sinc_arg);
        end
    end
end


% --- Helper sinc function ---
function y = mysinc(x)
    y = ones(size(x));
    idx = x ~= 0;
    y(idx) = sin(pi*x(idx)) ./ (pi*x(idx));
end