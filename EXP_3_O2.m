%% EXP 3 - Objective 2: Coherent Demodulation & Waveform Comparison
clc;
clear;
close all;

% Parameters
fs = 100000;          % Sampling frequency (Hz)
t = 0:1/fs:0.02;      % Time vector
fm = 500;             % Message frequency (Hz)
fc = 5000;            % Carrier frequency (Hz)

% Transmitted Signals
m = cos(2 * pi * fm * t);
c = cos(2 * pi * fc * t);
dsb = m .* c;

% VSB Filtering
[b, a] = butter(4, fc / (fs / 2));
vsb = filter(b, a, dsb);

% Step 1: Coherent Demodulation (Synchronous Carrier Mixing)
demod = vsb .* (2 * cos(2 * pi * fc * t));

% Step 2: Low-Pass Filter (Cutoff at 1000 Hz to recover 500 Hz message)
[b1, a1] = butter(4, 1000 / (fs / 2));
rec = filter(b1, a1, demod);

% Comparison & Signal Verification
figure('Name', 'Objective 2: Coherent Demodulation & Recovery', 'NumberTitle', 'off');

subplot(3,1,1);
plot(t, demod, 'k', 'LineWidth', 1);
title('Demodulated Signal (Before Low-Pass Filtering)');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(3,1,2);
plot(t, rec, 'r', 'LineWidth', 1.5);
title('Recovered Message Signal (After LPF)');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

subplot(3,1,3);
plot(t, m, 'b--', 'LineWidth', 1.5); hold on;
plot(t, rec, 'r', 'LineWidth', 1.2);
legend('Original Message m(t)', 'Recovered Message', 'Location', 'northeast');
title('Comparison: Original vs Recovered Message');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

fprintf('--- Objective 2 Verification ---\n');
fprintf('Message Frequency : %d Hz\n', fm);
fprintf('Carrier Frequency : %d Hz\n', fc);
fprintf('Coherent demodulation and LPF reconstruction completed successfully.\n');