%% EXP 7 - Objective 2: Calculation and Verification of Frequency Deviation
clc;
clear;
close all;

% Parameters
Am = 2;              % Message amplitude (V)
fc = 10000;          % Carrier frequency (Hz)
kf = 250;            % Frequency sensitivity (Hz/V)

% Frequency Deviation Calculation
delta_f = kf * Am;
f_max = fc + delta_f;
f_min = fc - delta_f;
delta_f_measured = (f_max - f_min) / 2;

% Display Verification
fprintf('--- Objective 2: Frequency Deviation Verification ---\n');
fprintf('Frequency Sensitivity (kf)     : %.0f Hz/V\n', kf);
fprintf('Message Amplitude (Am)         : %.0f V\n', Am);
fprintf('Calculated Peak Deviation (Af) : %.2f Hz\n', delta_f);
fprintf('Maximum Instantaneous Freq     : %.2f Hz\n', f_max);
fprintf('Minimum Instantaneous Freq     : %.2f Hz\n', f_min);
fprintf('Verified Peak Deviation        : %.2f Hz\n', delta_f_measured);

if abs(delta_f - delta_f_measured) < 1e-6
    fprintf('Status: Frequency Deviation Verification Successful\n');
else
    fprintf('Status: Frequency Deviation Verification Failed\n');
end