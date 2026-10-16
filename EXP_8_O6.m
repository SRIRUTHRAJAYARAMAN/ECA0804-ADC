%% EXP 8 - Objective 6: Influence of Beta on PSD Characteristics
clc;
clear;
close all;

% Fixed Parameters
Ac = 5;
fc = 1000;
fm = 100;
fs = 20 * fc;
t = 0:1/fs:4/fm;
N = length(t);
f = linspace(-fs/2, fs/2, N);

% Compare Different Modulation Indices (beta = kp * Am)
beta_cases = [0.5, 1.57, 3.0];
colors = ['b', 'r', 'k'];

figure('Name', 'Objective 6: Effect of Modulation Index on PSD', 'NumberTitle', 'off');

for i = 1:length(beta_cases)
    b_val = beta_cases(i);
    % Direct angle modulation form for PM with single tone
    pm_test = Ac * cos(2 * pi * fc * t + b_val * sin(2 * pi * fm * t));

    % PSD Calculation
    PM_FFT_shift = abs(fftshift(fft(pm_test)));
    PSD_test = (PM_FFT_shift.^2) / (N * fs);

    subplot(3, 1, i);
    plot(f, PSD_test, colors(i), 'LineWidth', 1.2);
    title(sprintf('PSD for \\beta = %.2f (Carson BW \\approx %.1f Hz)', b_val, 2*(b_val+1)*fm));
    xlabel('Frequency (Hz)'); ylabel('PSD (W/Hz)');
    xlim([fc - 5*fm, fc + 5*fm]);
    grid on;
end