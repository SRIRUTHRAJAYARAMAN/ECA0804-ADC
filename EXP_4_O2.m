%% EXP 4 - Objective 2: Envelope Detection, Recovery & Comparison
clc;
clear;
close all;

% Parameters
fs = 100000;          % Sampling frequency (Hz)
t = 0:1/fs:0.02;      % Time vector
fm = 500;             % Message frequency (Hz)
fc = 10000;           % RF Carrier frequency (Hz)
fLO = 14550;          % Local Oscillator frequency (Hz)

% Signal Processing Chain
m = cos(2 * pi * fm * t);                  % Transmitted message
c = cos(2 * pi * fc * t);                  % Carrier
am = (1 + m) .* cos(2 * pi * fc * t);      % AM Signal
LO = cos(2 * pi * fLO * t);                % Local Oscillator
mixed = am .* LO;                          % Frequency Mixing

% IF Filter
[b, a] = butter(4, 5000 / (fs / 2));
IF = filter(b, a, mixed);

% Envelope Detection using Hilbert Transform
env = abs(hilbert(IF));

% Display Complete 5-Stage Superheterodyne Receiver
figure('Name', 'Objective 2: Superheterodyne Receiver Waveform Analysis', 'NumberTitle', 'off');

subplot(5,1,1);
plot(t, m, 'LineWidth', 1.2);
title('1. Transmitted Message Signal');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(5,1,2);
plot(t, c, 'LineWidth', 1.1);
title('2. RF Carrier Signal');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(5,1,3);
plot(t, am, 'LineWidth', 1.1);
title('3. Modulated AM Signal');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(5,1,4);
plot(t, IF, 'LineWidth', 1.1);
title('4. Intermediate Frequency (IF) Signal');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(5,1,5);
plot(t, env, 'r', 'LineWidth', 1.2);
title('5. Recovered Message Signal (Envelope Detected)');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

% Quantitative Verification
fprintf('--- Objective 2 Verification ---\n');
fprintf('RF Carrier Frequency (fc) : %d Hz\n', fc);
fprintf('LO Frequency (fLO)        : %d Hz\n', fLO);
fprintf('Standard IF (|fLO - fc|)  : %d Hz\n', abs(fLO - fc));
fprintf('Baseband Message (fm)     : %d Hz\n', fm);
fprintf('Message recovery through IF stage envelope detection completed successfully.\n');