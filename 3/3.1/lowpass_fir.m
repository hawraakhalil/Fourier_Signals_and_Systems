function h = lowpass_fir(fc, fs, N)
    % fc: cutoff frequency (Hz)
    % fs: sampling frequency (Hz)
    % N: number of filter taps (odd number recommended)

    % Time indices for filter taps
    n = -(N-1)/2:(N-1)/2;

    % Ideal low-pass filter using sinc function    
    % The sinc function is scaled by the cutoff frequency (fc) and sampling 
    % frequency (fs). The factor of 2fc/fs adjusts the sinc function to 
    % represent the desired low-pass filter's frequency response.
    h = 2*fc/fs * sinc(2*fc*n/fs);

    % Apply Hamming window to reduce side lobes
    % The Hamming window reduces the ripples (side lobes) of the sinc 
    % function, making the frequency response of the filter more practical.
    % The window tapers off at both ends to smooth the response.
    n = 0:N-1;
    w = 0.54 - 0.46 * cos(2*pi*n/(N-1));
    h = h .* w;

    % The filter is normalized by dividing by the sum of the coefficients
    % to ensure that the filter does not attenuate the DC component (f = 0).
    h = h / sum(h);
end