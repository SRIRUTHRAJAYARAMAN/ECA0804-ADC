%% EXP 8 - Objective 2: Frequency Spectrum Analysis via FFT
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

% FFT Spectrum Computation
N = length(pm);
f = linspace(-fs/2, fs/2, N);                   % Frequency axis
PM_FFT = abs(fftshift(fft(pm))) / N;            % Scaled double-sided FFT

% Plot Frequency Spectrum
figure('Name', 'Objective 2: FFT Spectrum of PM Signal', 'NumberTitle', 'off');
plot(f, PM_FFT, 'b', 'LineWidth', 1.2);
title('Magnitude Frequency Spectrum of PM Signal (FFT)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([-fc - 4*fm, fc + 4*fm]);
grid on;

fprintf('--- Objective 2 Verification ---\n');
fprintf('Sampling Frequency (fs) : %d Hz\n', fs);
fprintf('FFT Length (N)          : %d points\n', N);
fprintf('Frequency spectrum centered and scaled successfully.\n');