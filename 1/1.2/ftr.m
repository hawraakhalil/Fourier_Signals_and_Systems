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
    
    method = 'trapz';                        % default method set to 'trapz'
    if nargin > 3 && strcmpi(varargin{1}, 'fft')   % check if the 'fft' method is specified
        method = 'fft';                     % update method to 'fft'
    end
    
    t  = t(:);                               % ensure t is a column vector
    xt = xt(:);                              % ensure xt is a column vector
    N  = numel(t);                           % number of samples
    dt = T / N;                              % definition Δt = T/N
    
    f = (-N/2:N/2-1).' / T;                  % calculate frequency range Δf = 1/T
    W = 2*pi*f;                              % convert to angular frequency (rad/s)
    
    switch method                           
        case 'trapz'                         % method for trapezoidal integration
            xf = zeros(size(f));             % initialize xf (Fourier transform result)
            for k = 1:N                      
                xf(k) = trapz(t, xt .* exp(-1j * W(k) .* t));  % compute Fourier transform using trapezoidal rule
            end
    
        case 'fft'                           % method for Fast Fourier Transform (FFT)
            xf = fftshift(fft(xt)) * dt;      % compute FFT and shift the zero-frequency component to the center, scale by Δt
    end
end