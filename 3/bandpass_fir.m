function h = bandpass_fir(f_low, f_high, fs, N)
    % f_low: lower cutoff (Hz)
    % f_high: upper cutoff (Hz)
    % fs: sampling rate
    % N: number of taps (odd recommended)

    n = -(N-1)/2:(N-1)/2;
    h_low = 2*f_high/fs * sinc(2*f_high*n/fs);
    h_high = 2*f_low/fs * sinc(2*f_low*n/fs);
    h = h_low - h_high;  % band-pass = LPF - HPF

    % Window
    n_win = 0:N-1;
    w = 0.54 - 0.46 * cos(2*pi*n_win/(N-1));
    h = h .* w;

    % Normalize
    h = h / sum(h);
end
