% Gaussian Pulse Fourier Series approximation

T = 4;
t = linspace(-2, 2, 1000);
xt = exp(-t.^2);
n = 10;

[xhat, ck] = ffs(xt, t, n, T);

plot(t, xt, 'b', t, xhat, 'r--', 'LineWidth', 1.5)
legend('Original', 'Approximation')
title('Gaussian Pulse Approximation (n = 10, T = 500)')
xlabel('Time')
ylabel('Amplitude')
grid on