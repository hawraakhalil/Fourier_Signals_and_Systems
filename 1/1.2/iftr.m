function [t, xt_rec, T] = iftr(f, xf, W, varargin)
% IFTR  Numerical Inverse Continuous-Time Fourier Transform
%       [t, xt_rec, T] = iftr(f, xf, W)            %  direct trapz (default)
%       [t, xt_rec, T] = iftr(f, xf, W,'fft')      %  IFFT shortcut
%
%   f   : frequency grid (Hz)  — used only for IFFT scaling
%   xf  : spectrum samples X(f)
%   W   : angular-frequency grid (rad/s)  (must satisfy W = 2πf)
%
%   Returns time grid t (seconds) and reconstructed x(t).

% --- Determine computation method --------------------------------------
method = 'trapz';
if nargin > 4 && strcmpi(varargin{1}, 'fft')
    method = 'fft';
end

% --- Grid & spacing derived solely from W ------------------------------
f  = f(:);  xf = xf(:);  W = W(:);
assert(all(abs(W - 2*pi*f) < 1e-10), ...
       'W and f are inconsistent: W must equal 2πf.');

N  = numel(W);
dW = W(2) - W(1);                      % Δω
T  = 2*pi / dW;                        % window length via  Δω·T = 2π
dt = T / N;                            % Δt so that Δt·Δf = 1/N
df = 1 / T;                            % Δf  (Hz)

t  = (-N/2:N/2-1).' * dt;              % time grid

% --- Numerical evaluation ---------------------------------------------
switch method
    case 'trapz'
        % integrate over ω, then divide by 2π  (df = dW/2π)
        xt_rec = zeros(size(t));
        for m = 1:N
            xt_rec(m) = trapz(W, xf .* exp(1j * W .* t(m))) / (2*pi);
        end

    case 'fft'
        % IFFT shortcut (inverse DFT) with proper Δf scaling
        xt_rec = ifft(ifftshift(xf)) / df;
end

% --- Remove negligible imaginary residue for real signals -------------
if max(abs(imag(xt_rec))) < 1e-10
    xt_rec = real(xt_rec);
end
end
