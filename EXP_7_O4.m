-%% EXP 7 - Objective 4: Effect of fm on Frequency Deviation and Beta
clc;
clear;
close all;

% Fixed Modulator Settings
Am = 2;                          % Message amplitude (V)
kf = 250;                        % Frequency sensitivity (Hz/V)
delta_f_const = kf * Am;         % Peak deviation remains constant (500 Hz)

% Test Across Different Message Frequencies
fm_range = [100, 250, 500, 1000, 2000]; % Frequencies in Hz
beta_vals = delta_f_const ./ fm_range;
delta_f_vals = repmat(delta_f_const, size(fm_range));

% Tabular Output to Console
fprintf('--- Objective 4: Invariance of Delta_f and Inverse Scaling of Beta ---\n');
fprintf('  fm (Hz)  |  Delta_f (Hz)  |   Beta (m_f)   \n');
fprintf('--------------------------------------------\n');
for i = 1:length(fm_range)
    fprintf('   %4d    |     %6.2f     |     %6.2f     \n', fm_range(i), delta_f_vals(i), beta_vals(i));
end

% Plotting the Relationships
figure('Name', 'Objective 4: Sensitivity to Message Frequency', 'NumberTitle', 'off');

subplot(2,1,1);
plot(fm_range, delta_f_vals, '-s', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
title('Peak Frequency Deviation (\Delta f) vs. Message Frequency (f_m)');
xlabel('Message Frequency f_m (Hz)'); ylabel('\Delta f (Hz)');
ylim([0, delta_f_const * 1.5]);
grid on;

subplot(2,1,2);
plot(fm_range, beta_vals, '-o', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
title('Modulation Index (\beta) vs. Message Frequency (f_m)');
xlabel('Message Frequency f_m (Hz)'); ylabel('Modulation Index \beta');
grid on;