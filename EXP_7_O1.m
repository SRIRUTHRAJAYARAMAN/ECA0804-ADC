%% EXP 7 - Objective 1: FM Signal Generation
clc;
clear;
close all;

% Given Parameters
Am = 2;              % Message amplitude (V)
fm = 500;            % Message frequency (Hz)
Ac = 1;              % Carrier amplitude (V)
fc = 10000;          % Carrier frequency (Hz)
kf = 250;            % Frequency sensitivity (Hz/V)
fs = 100000;         % Sampling frequency (Hz)
T = 0.01;            % Simulation duration (s)

% Time Vector
t = 0:1/fs:T;

% Modulating and Carrier Signals
m = Am * cos(2 * pi * fm * t);
c = Ac * cos(2 * pi * fc * t);

% FM Modulation
delta_f = kf * Am;
beta = delta_f / fm;
fm_signal = Ac * cos(2 * pi * fc * t + beta * sin(2 * pi * fm * t));

% Plot Time-Domain Waveforms
figure('Name', 'Objective 1: FM Signal Generation', 'NumberTitle', 'off');

subplot(3,1,1);
plot(t, m, 'b', 'LineWidth', 1.5);
title('1. Message Signal m(t)');
xlabel('Time (s)'); ylabel('Amplitude (V)');
grid on;

subplot(3,1,2);
plot(t, c, 'k', 'LineWidth', 1);
title('2. Unmodulated Carrier Signal c(t)');
xlabel('Time (s)'); ylabel('Amplitude (V)');
grid on;

subplot(3,1,3);
plot(t, fm_signal, 'r', 'LineWidth', 1);
title('3. Frequency Modulated (FM) Signal');
xlabel('Time (s)'); ylabel('Amplitude (V)');
grid on;