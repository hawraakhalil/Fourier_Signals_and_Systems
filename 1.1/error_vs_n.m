T = 4;                                % fixed period
t = linspace(-2, 2, 1000);            % time vector
xt = exp(-t.^2);                      % gaussian pulse signal

n_vals = [1, 5, 10, 20, 50, 100, 200]; % range of harmonic values to test
errors = zeros(size(n_vals));         % initialize error array

for i = 1:length(n_vals)
    n = n_vals(i);
    errors(i) = compute_error(xt, t, n, T); % compute squared error for each n
end

% plot error vs. number of harmonics
figure;
plot(n_vals, errors, '-o', 'LineWidth', 1.5)
xlabel('Number of Harmonics $n$', 'Interpreter', 'latex')
ylabel('Squared Error $E(n, T)$', 'Interpreter', 'latex')
title('Error vs. $n$ (Fixed $T = 4$)', 'Interpreter', 'latex')
grid on