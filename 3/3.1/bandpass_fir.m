function h = bandpass_fir(f_low, f_high, fs, N)
    % f_low: lower cutoff (Hz)
    % f_high: upper cutoff (Hz)
    % fs: sampling frequency
    % N: filter length (odd number recommended)

    n = -(N-1)/2:(N-1)/2;

    % Ideal band-pass filter via subtraction of two low-pass filters
    h_low = 2*f_high/fs * sinc(2*f_high*n/fs);
    h_high = 2*f_low/fs * sinc(2*f_low*n/fs);
    h = h_low - h_high;

    % Apply Hamming window
    n_win = 0:N-1;
    w = 0.54 - 0.46 * cos(2*pi*n_win/(N-1));
    h = h .* w;

    % Energy normalization to prevent amplification
    h = h / norm(h, 2);  % Normalize L2 norm (energy)
end
