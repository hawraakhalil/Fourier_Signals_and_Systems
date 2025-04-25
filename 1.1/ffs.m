function [xhat, ck] = ffs(xt, t, n, T)
    % ffs: Truncated Fourier Series approximation
    %
    % Inputs:
    %   xt - input signal samples (vector)
    %   t  - time vector, same length as xt
    %   n  - number of harmonics on each side (total 2n+1 terms)
    %   T  - assumed period of the signal
    %
    % Outputs:
    %   xhat - reconstructed signal from the truncated Fourier Series
    %   ck   - complex Fourier coefficients from k = -n to k = n

    % ensure input vectors are column vectors
    t = t(:);
    xt = xt(:);

    % initialize vector for Fourier coefficients
    ck = zeros(2*n+1, 1);

    % compute Fourier coefficients c_k using numerical integration
    for k = -n:n
        index = k + n + 1;  % MATLAB uses 1-based indexing
        integrand = xt .* exp(-1j * 2 * pi * k * t / T);  % multiply by complex exponential
        ck(index) = (1/T) * trapz(t, integrand);          % approximate integral with trapz
    end

    % initialize the reconstructed signal
    xhat = zeros(size(t));

    % sum over all harmonics to reconstruct the signal
    for k = -n:n
        index = k + n + 1;
        xhat = xhat + ck(index) * exp(1j * 2 * pi * k * t / T);
    end

    % if the input signal is real, return only the real part of the reconstruction
    if isreal(xt)
        xhat = real(xhat);
    end
end
