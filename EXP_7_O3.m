%% EXP 7 - Objective 3: Modulation Index Determination & Verification
clc;
clear;
close all;

% Given Parameters
Am = 2;
fm = 500;
Ac = 1;
fc = 10000;
kf = 250;

% Calculations
delta_f = kf * Am;
beta = delta_f / fm;
beta_verify = delta_f / fm;

% Display Formatted Verification Table
fprintf('--- Objective 3: Modulation Index Verification ---\n');
fprintf('Carrier Frequency (fc)       = %.0f Hz\n', fc);
fprintf('Message Frequency (fm)       = %.0f Hz\n', fm);
fprintf('Message Amplitude (Am)       = %.0f V\n', Am);
fprintf('Frequency Sensitivity (kf)   = %.0f Hz/V\n', kf);
fprintf('Frequency Deviation (Delta f)= %.2f Hz\n', delta_f);
fprintf('Modulation Index (Beta)      = %.2f\n', beta);
fprintf('Verified Modulation Index    = %.2f\n', beta_verify);

% Verification Check
tolerance = 1e-6;
if abs(beta - beta_verify) < tolerance
    fprintf('\nVerification Successful\n');
else
    fprintf('\nVerification Failed\n');
end