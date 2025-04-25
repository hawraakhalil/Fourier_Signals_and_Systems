function E = compute_error(xt, t, n, T)
    % compute_error: Calculates the squared error between the original signal
    % xt and its truncated Fourier Series approximation xhat.
    %
    % Inputs:
    %   xt - original signal samples (vector)
    %   t  - time vector (same size as xt)
    %   n  - number of harmonics used in the approximation
    %   T  - period used for the Fourier Series
    %
    % Output:
    %   E  - total squared error between xt and its approximation xhat

    % compute the truncated Fourier Series approximation of xt
    [xhat, ~] = ffs(xt, t, n, T);

    % ensure input and output are column vectors and take real part of approximation
    xhat = real(xhat(:));
    xt = xt(:);

    % compute the pointwise squared error
    error_sq = abs(xt - xhat).^2;

    % numerically integrate the squared error using the trapezoidal rule
    E = trapz(t, error_sq);
end