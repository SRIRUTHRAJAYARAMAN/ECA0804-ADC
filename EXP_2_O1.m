%% EXP 2 - Objective 1: AM Signal Generation & Demodulation
clc;
clear;
close all;

% Parameters
Am = 1;                 % Modulating signal amplitude (V)
fm = 500;               % Modulating frequency (Hz)
Ac = 5;                 % Carrier amplitude (V)
fc = 5000;              % Carrier frequency (Hz)
fs = 20 * fc;           % Sampling frequency (Hz)
t = 0:1/fs:4/fm;        % Time vector (4 cycles of message)

% Signal Generation
m = Am * sin(2 * pi * fm * t);             % Modulating signal
c = Ac * sin(2 * pi * fc * t);             % Carrier signal
mu = Am / Ac;                              % Modulation index (mu = 0.2)
am = Ac * (1 + mu * sin(2 * pi * fm * t)) .* sin(2 * pi * fc * t); % AM signal

% Envelope Detection
dem = abs(hilbert(am));
dem = dem - mean(dem);                     % Remove DC component

% Plotting
figure('Name', 'Objective 1: AM Generation and Demodulation', 'NumberTitle', 'off');

subplot(4,1,1);
plot(t, m, 'LineWidth', 1.2);
title('1. Modulating / Message Signal');
xlabel('Time (s)'); ylabel('Amplitude (V)');
grid on;

subplot(4,1,2);
plot(t, c, 'LineWidth', 1.1);
title('2. Carrier Signal');
xlabel('Time (s)'); ylabel('Amplitude (V)');
grid on;

subplot(4,1,3);
plot(t, am, 'LineWidth', 1.1);
title('3. Amplitude Modulated (AM) Signal');
xlabel('Time (s)'); ylabel('Amplitude (V)');
grid on;

subplot(4,1,4);
plot(t, dem, 'LineWidth', 1.2);
title('4. Demodulated Message Signal');
xlabel('Time (s)'); ylabel('Amplitude (V)');
grid on;