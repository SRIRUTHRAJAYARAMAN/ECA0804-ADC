%% EXP 8 - Objective 1: PM Signal Generation in Time Domain
clc;
clear;
close all;

% Parameters
Am = 1;                 % Message amplitude (V)
fm = 100;               % Message frequency (Hz)
Ac = 5;                 % Carrier amplitude (V)
fc = 1000;              % Carrier frequency (Hz)
kp = pi / 2;            % Phase sensitivity (rad/V)
fs = 20 * fc;           % Sampling frequency (Hz)
t = 0:1/fs:4/fm;        % Time vector (4 message cycles)

% Modulating and Carrier Signals
m = Am * sin(2 * pi * fm * t);                  % Modulating signal
c = Ac * sin(2 * pi * fc * t);                  % Carrier signal

% PM Signal Generation
pm = Ac * cos(2 * pi * fc * t + kp * m);

% Display
fprintf('--- Objective 1: PM Generation Parameters ---\n');
fprintf('Carrier Frequency (fc)  : %d Hz\n', fc);
fprintf('Message Frequency (fm)  : %d Hz\n', fm);
fprintf('Carrier Amplitude (Ac)  : %d V\n', Ac);
fprintf('Message Amplitude (Am)  : %d V\n', Am);
fprintf('Phase Sensitivity (kp)  : %.4f rad/V\n', kp);

% Time-Domain Plots
figure('Name', 'Objective 1: PM Time Domain Generation', 'NumberTitle', 'off');

subplot(3,1,1);
plot(t, m, 'LineWidth', 1.2);
title('1. Modulating Message Signal m(t)');
xlabel('Time (s)'); ylabel('Amplitude (V)');
grid on;

subplot(3,1,2);
plot(t, c, 'LineWidth', 1.1);
title('2. Unmodulated Carrier Signal c(t)');
xlabel('Time (s)'); ylabel('Amplitude (V)');
grid on;

subplot(3,1,3);
plot(t, pm, 'r', 'LineWidth', 1.1);
title('3. Phase Modulated (PM) Signal');
xlabel('Time (s)'); ylabel('Amplitude (V)');
grid on;