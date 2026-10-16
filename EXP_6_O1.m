%% EXP 6 - Objective 1: FM Signal Generation & Analysis
clc;
clear;
close all;

% Parameters
Am = 1;                 % Modulating signal amplitude (V)
Ac = 1;                 % Carrier amplitude (V)
fm = 5;                 % Message frequency (Hz)
fc = 50;                % Carrier frequency (Hz)
beta = 5;               % Modulation index
fs = 1000;              % Sampling frequency (Hz)
t = 0:1/fs:1;           % Time vector (1 second duration)

% Signals
m = Am * cos(2 * pi * fm * t);                                 % Message signal
c = Ac * cos(2 * pi * fc * t);                                 % Carrier signal
fm_sig = Ac * cos(2 * pi * fc * t + beta * sin(2 * pi * fm * t)); % FM signal

% Frequency Deviation Calculation
delta_f = beta * fm;    % Peak frequency deviation (Hz)

% Display Results
fprintf('--- Objective 1: FM Analysis ---\n');
fprintf('Carrier Frequency (fc)        : %d Hz\n', fc);
fprintf('Message Frequency (fm)        : %d Hz\n', fm);
fprintf('Modulation Index (Beta)       : %d\n', beta);
fprintf('Frequency Deviation (Delta f) : %d Hz\n', delta_f);

% Plotting
figure('Name', 'Objective 1: FM Generation', 'NumberTitle', 'off');

subplot(3,1,1);
plot(t, m, 'LineWidth', 1.2);
title('1. Modulating Message Signal m(t)');
xlabel('Time (s)'); ylabel('Amplitude (V)');
grid on;

subplot(3,1,2);
plot(t, c, 'LineWidth', 1.1);
title('2. Carrier Signal c(t)');
xlabel('Time (s)'); ylabel('Amplitude (V)');
grid on;

subplot(3,1,3);
plot(t, fm_sig, 'r', 'LineWidth', 1.1);
title('3. Frequency Modulated (FM) Signal');
xlabel('Time (s)'); ylabel('Amplitude (V)');
grid on;