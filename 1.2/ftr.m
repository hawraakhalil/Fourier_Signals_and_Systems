function [f, xf, W] = ftr(t, xt, T, varargin)
% FTR   Numerical Continuous-Time Fourier Transform
%       [f, xf, W] = ftr(t, xt, T)           %  direct trapz  (default)
%       [f, xf, W] = ftr(t, xt, T,'fft')     %  FFT shortcut
%
%   t   : N×1 uniform time grid  (seconds)
%   xt  : samples x(t)
%   T   : window length (sec)  — must satisfy  T = N*Δt
%
%   f   : frequency grid (Hz)  f_k = k/T
%   W   : angular-frequency grid (rad/s)  W = 2πf

% --- Determine computation method --------------------------------------
method = 'trapz';
if nargin > 3 && strcmpi(varargin{1}, 'fft')
    method = 'fft';
end

% --- Basic checks -------------------------------------------------------
t  = t(:);  xt = xt(:);
N  = numel(t);
dt = T / N;                             % definition Δt = T/N

% --- Frequency & omega grids ------------------------------------------
f = (-N/2:N/2-1).' / T;                 % Δf = 1/T
W = 2*pi*f;                             % rad/s

% --- Numerical evaluation ---------------------------------------------
switch method
    case 'trapz'
        xf = zeros(size(f));
        for k = 1:N
            xf(k) = trapz(t, xt .* exp(-1j * W(k) .* t));
        end

    case 'fft'
        xf = fftshift(fft(xt)) * dt;    % scale by Δt
end
end
