%% EXP 3 - Objective 1: VSB Signal Generation & Filtering
clc;
clear;
close all;

% Simulation Parameters
fs = 100000;          % Sampling frequency (Hz)
t = 0:1/fs:0.02;      % Time vector (20 ms duration)
fm = 500;             % Modulating message frequency (Hz)
fc = 5000;            % Carrier frequency (Hz)

% Signal Generation
m = cos(2 * pi * fm * t);             % Low-frequency message signal
c = cos(2 * pi * fc * t);             % High-frequency carrier signal

% Step 1: DSB-SC Modulation (Multiplication)
dsb = m .* c;

% Step 2: VSB Filter Design & Filtering
% 4th-order Butterworth filter centered around the carrier frequency
[b, a] = butter(4, fc / (fs / 2));
vsb = filter(b, a, dsb);

% Plotting Time-Domain Waveforms
figure('Name', 'Objective 1: VSB Modulation Process', 'NumberTitle', 'off');

subplot(4,1,1);
plot(t, m, 'LineWidth', 1.2);
title('1. Modulating Message Signal m(t)');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(4,1,2);
plot(t, c, 'LineWidth', 1.1);
title('2. Carrier Signal c(t)');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(4,1,3);
plot(t, dsb, 'LineWidth', 1.1);
title('3. DSB-SC Modulated Signal');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(4,1,4);
plot(t, vsb, 'LineWidth', 1.2);
title('4. VSB Modulated Signal (After Vestigial Filter)');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;