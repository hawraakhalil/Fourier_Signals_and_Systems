n = 10;                               % fixed number of harmonics
t = linspace(-2, 2, 1000);            % time vector
xt = exp(-t.^2);                      % gaussian pulse signal

T_vals = [1, 3, 5, 10, 50, 200, 500]; % range of period values to test
errors = zeros(size(T_vals));        % initialize error array

for i = 1:length(T_vals)
    T = T_vals(i);
    errors(i) = compute_error(xt, t, n, T); % compute squared error for each T
end

% plot error vs. period
figure;
plot(T_vals, errors, '-o', 'LineWidth', 1.5)
xlabel('Period $T$', 'Interpreter', 'latex')
ylabel('Squared Error $E(n, T)$', 'Interpreter', 'latex')
title('Error vs. $T$ (Fixed $n = 10$)', 'Interpreter', 'latex')
grid on