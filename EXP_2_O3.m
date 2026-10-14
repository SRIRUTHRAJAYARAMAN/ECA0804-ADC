%% EXP 2 - Objective 3: Power Calculations for a Given Modulation Index
clc;
clear;
close all;

% Parameters
Ac = 5;                  % Carrier amplitude (V)
Am = 1;                  % Message amplitude (V)
R = 1;                   % Normalized load resistance (Ohms)
mu = Am / Ac;            % Modulation index

% Theoretical Power Equations (using peak amplitude across resistance R)
Pc = (Ac^2) / (2 * R);                   % Carrier power
Psb = (mu^2 * Pc) / 4;                   % Power in one sideband (USB or LSB)
Ptsb = 2 * Psb;                          % Total sideband power
Pt = Pc + Ptsb;                          % Total transmitted power
eta = (Ptsb / Pt) * 100;                 % Transmission efficiency (%)

% Display Power Calculations
fprintf('--- Objective 3: Power Distribution Calculations ---\n');
fprintf('Modulation Index (mu)        : %.2f\n', mu);
fprintf('Carrier Power (Pc)           : %.4f W\n', Pc);
fprintf('USB Power                    : %.4f W\n', Psb);
fprintf('LSB Power                    : %.4f W\n', Psb);
fprintf('Total Sideband Power (Ptsb)  : %.4f W\n', Ptsb);
fprintf('Total Transmitted Power (Pt) : %.4f W\n', Pt);
fprintf('Transmission Efficiency (eta): %.2f %%\n', eta);

% Plot Power Distribution Bar Chart
figure('Name', 'Objective 3: Power Distribution', 'NumberTitle', 'off');
bar([Pc, Psb, Psb]);
set(gca, 'XTickLabel', {'Carrier (Pc)', 'USB (P_usb)', 'LSB (P_lsb)'});
ylabel('Power (Watts)');
title(sprintf('AM Power Distribution (\\mu = %.2f)', mu));
grid on;