%% EXP 8 - Objective 4: Carrier and Sideband Component Identification
clc;
clear;
close all;

% Parameters
fm = 100;               % Modulating frequency (Hz)
fc = 1000;              % Carrier frequency (Hz)
num_sidebands = 3;      % Number of sideband pairs to evaluate

fprintf('--- Objective 4: Carrier and Sideband Frequencies ---\n');
fprintf('Carrier Frequency (fc)       : %d Hz\n', fc);
fprintf('Message Spacing (fm)         : %d Hz\n', fm);
fprintf('--------------------------------------------------\n');
fprintf(' Component    | Frequency (Hz) | Formula          \n');
fprintf('--------------------------------------------------\n');
fprintf(' Carrier      |     %4d       | fc               \n', fc);

for n = 1:num_sidebands
    fprintf(' USB %d        |     %4d       | fc + %d*fm       \n', n, fc + n*fm, n);
    fprintf(' LSB %d        |     %4d       | fc - %d*fm       \n', n, fc - n*fm, n);
end
fprintf('--------------------------------------------------\n');