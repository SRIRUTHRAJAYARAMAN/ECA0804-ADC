%% EXP 8 - Objective 5: Phase Deviation and Carson Bandwidth
clc;
clear;
close all;

% Parameters
Am = 1;                 % Modulating amplitude (V)
fm = 100;               % Modulating frequency (Hz)
kp = pi / 2;            % Phase sensitivity (rad/V)

% Phase Deviation and Carson's Bandwidth
beta = kp * Am;                    % Phase deviation (radians)
BW_carson = 2 * (beta + 1) * fm;   % Carson's Bandwidth (Hz)

% Display Analysis
fprintf('--- Objective 5: Bandwidth & Spectral Distribution ---\n');
fprintf('Message Amplitude (Am)       : %.2f V\n', Am);
fprintf('Phase Sensitivity (kp)       : %.4f rad/V\n', kp);
fprintf('Phase Deviation (Beta)       : %.2f radians\n', beta);
fprintf('Estimated Carson Bandwidth   : %.2f Hz\n', BW_carson);
fprintf('Single-Sided Span around fc  : +/- %.2f Hz\n', BW_carson / 2);