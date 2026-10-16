%% EXP 8 - Objective 3: Power Spectral Density (PSD)
clc;
clear;
close all;

% Parameters
Am = 1;
fm = 100;
Ac = 5;
fc = 1000;
kp = pi / 2;
fs = 20 * fc;
t = 0:1/fs:4/fm;

% PM Signal
m = Am * sin(2 * pi * fm * t);
pm = Ac * cos(2 * pi * fc * t + kp * m);

% Power Spectral Density Computation
N = length(pm);
f = linspace(-fs/2, fs/2, N);
PM_FFT_shift = abs(fftshift(fft(pm)));
PSD = (PM_FFT_shift.^2) / (N * fs);             % Power Spectral Density

% Plot PSD
figure('Name', 'Objective 3: Power Spectral Density of PM Signal', 'NumberTitle', 'off');
plot(f, PSD, 'r', 'LineWidth', 1.2);
title('Power Spectral Density (PSD) of PM Signal');
xlabel('Frequency (Hz)');
ylabel('PSD (Watts/Hz)');
xlim([-fc - 4*fm, fc + 4*fm]);
grid on;

fprintf('--- Objective 3 Verification ---\n');
fprintf('Max Spectral Density Peak : %.6f W/Hz\n', max(PSD));
fprintf('Power Spectral Density computation and plotting completed.\n');