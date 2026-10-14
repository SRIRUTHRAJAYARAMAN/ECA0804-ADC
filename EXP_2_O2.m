%% EXP 2 - Objective 2: Sideband Frequencies Verification via FFT
clc;
clear;
close all;

% Parameters
Am = 1;
fm = 500;
Ac = 5;
fc = 5000;
fs = 20 * fc;
t = 0:1/fs:4/fm;

% Modulated Signal
mu = Am / Ac;
am = Ac * (1 + mu * sin(2 * pi * fm * t)) .* sin(2 * pi * fc * t);

% Frequency Spectrum Analysis (FFT)
N = length(am);
f = linspace(-fs/2, fs/2, N);
AM_FFT = abs(fftshift(fft(am))) / N;

% Theoretical Sideband Calculations
USB_theoretical = fc + fm;
LSB_theoretical = fc - fm;

% Display Verification
fprintf('--- Objective 2: Sideband Frequency Verification ---\n');
fprintf('Carrier Frequency (fc) : %d Hz\n', fc);
fprintf('Message Frequency (fm) : %d Hz\n', fm);
fprintf('Theoretical LSB (fc-fm): %d Hz\n', LSB_theoretical);
fprintf('Theoretical USB (fc+fm): %d Hz\n', USB_theoretical);

% Plot Frequency Spectrum
figure('Name', 'Objective 2: AM Frequency Spectrum', 'NumberTitle', 'off');
plot(f, AM_FFT, 'b', 'LineWidth', 1.2);
xlim([fc - 3*fm, fc + 3*fm]);
title('AM Double-Sided Spectrum (Carrier, LSB, USB)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;