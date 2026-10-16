%% EXP 6 - Objective 2: PM Signal Generation & Comparison with FM
clc;
clear;
close all;

% Parameters
Am = 1;
Ac = 1;
fm = 5;
fc = 50;
beta = 5;               % FM modulation index
kp = 5;                 % Phase sensitivity constant (rad/V)
fs = 1000;
t = 0:1/fs:1;

% Signal Generation
m = Am * cos(2 * pi * fm * t);                                 % Message signal
c = Ac * cos(2 * pi * fc * t);                                 % Carrier signal
fm_sig = Ac * cos(2 * pi * fc * t + beta * sin(2 * pi * fm * t)); % FM signal
pm_sig = Ac * cos(2 * pi * fc * t + kp * m);                   % PM signal

% Display
fprintf('--- Objective 2: PM Analysis & Comparison ---\n');
fprintf('Phase Sensitivity (kp)        : %d rad/V\n', kp);
fprintf('Maximum Phase Deviation       : %d radians\n', kp * Am);
fprintf('Comparison: FM instantaneous phase integrates m(t), while PM tracks m(t) directly.\n');

% Plotting Complete Comparison
figure('Name', 'Objective 2: FM vs PM Comparison', 'NumberTitle', 'off');

subplot(4,1,1);
plot(t, m, 'LineWidth', 1.2);
title('1. Modulating Message Signal');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(4,1,2);
plot(t, c, 'LineWidth', 1.1);
title('2. Carrier Signal');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(4,1,3);
plot(t, fm_sig, 'b', 'LineWidth', 1.1);
title('3. Frequency Modulated (FM) Signal');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(4,1,4);
plot(t, pm_sig, 'm', 'LineWidth', 1.1);
title('4. Phase Modulated (PM) Signal');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;