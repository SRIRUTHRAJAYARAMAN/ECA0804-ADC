%% EXP 4 - Objective 1: Frequency Mixing & IF Generation
clc;
clear;
close all;

% Parameters
fs = 100000;          % Sampling frequency (Hz)
t = 0:1/fs:0.02;      % Time vector (20 ms duration)
fm = 500;             % Modulating message frequency (Hz)
fc = 10000;           % RF Carrier frequency (Hz)
fIF = 4550;           % Intermediate Frequency (Hz)
fLO = fc + fIF;       % High-side Local Oscillator (14,550 Hz)

% Signal Generation
m = cos(2 * pi * fm * t);                  % Baseband message signal
c = cos(2 * pi * fc * t);                  % Carrier signal
am = (1 + m) .* cos(2 * pi * fc * t);      % Standard AM signal

% Local Oscillator & Frequency Mixing
LO = cos(2 * pi * fLO * t);                % Local Oscillator signal
mixed = am .* LO;                          % Mixer output: sum & difference frequencies

% IF Filtering
% Isolates difference component (|fLO - fc| = 4550 Hz)
[b, a] = butter(4, 5000 / (fs / 2));
IF = filter(b, a, mixed);

% Plotting Waveforms
figure('Name', 'Objective 1: Superheterodyne Mixing & IF Generation', 'NumberTitle', 'off');

subplot(4,1,1);
plot(t, am, 'LineWidth', 1.1);
title('1. Received AM / RF Signal');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(4,1,2);
plot(t, LO, 'LineWidth', 1.1);
title(sprintf('2. Local Oscillator Signal (f_{LO} = %d Hz)', fLO));
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(4,1,3);
plot(t, mixed, 'LineWidth', 1.1);
title('3. Mixer Output (Sum & Difference Components)');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(4,1,4);
plot(t, IF, 'r', 'LineWidth', 1.2);
title(sprintf('4. Filtered Intermediate Frequency (IF) Signal (f_{IF} = %d Hz)', fIF));
xlabel('Time (s)'); ylabel('Amplitude');
grid on;