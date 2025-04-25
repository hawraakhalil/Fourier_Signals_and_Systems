% Time-limited sine wave approximation
T = 4;
t = linspace(-2, 2, 1000);
xt = sin(2*pi*t) .* (abs(t) < 1);
n = 10;

[xhat, ck] = ffs(xt, t, n, T);

plot(t, xt, 'b', t, xhat, 'r--', 'LineWidth', 1.5)
legend('Original (Limited Sine)', 'Approximation')
title('Time-Limited Sine Approximation (n = 10, T = 4)')
xlabel('Time'), ylabel('Amplitude')
grid on