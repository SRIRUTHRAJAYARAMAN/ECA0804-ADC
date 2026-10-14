%% EXP 2 - Objective 4: Sideband Power & Efficiency vs. Modulation Index
clc;
clear;
close all;

% Parameters
Ac = 5;
R = 1;
Pc = (Ac^2) / (2 * R);
mu_values = [0.2, 0.5, 0.8, 1.0];

% Initialize Arrays
P_sb_total = zeros(size(mu_values));
P_total = zeros(size(mu_values));
efficiency = zeros(size(mu_values));

fprintf('--- Objective 4: Variation of mu and Transmission Efficiency ---\n');
fprintf(' mu   |   Pc (W)   |  Ptsb (W)  |   Pt (W)   | Efficiency (%%)\n');
fprintf('------------------------------------------------------------\n');

for i = 1:length(mu_values)
    m = mu_values(i);
    P_sb_total(i) = (m^2 * Pc) / 2;             % Total sideband power
    P_total(i) = Pc + P_sb_total(i);             % Total power
    efficiency(i) = (P_sb_total(i) / P_total(i)) * 100; % Efficiency

    fprintf('%.2f  |  %8.4f  |  %8.4f  |  %8.4f  |    %6.2f %%\n', ...
        m, Pc, P_sb_total(i), P_total(i), efficiency(i));
end

% Plot Efficiency Curve
figure('Name', 'Objective 4: Efficiency vs Modulation Index', 'NumberTitle', 'off');

subplot(2,1,1);
plot(mu_values, efficiency, '-o', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
title('Transmission Efficiency vs Modulation Index (\mu)');
xlabel('Modulation Index (\mu)');
ylabel('Efficiency (\eta %)');
grid on;

subplot(2,1,2);
plot(mu_values, P_sb_total, '-s', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
hold on;
plot(mu_values, P_total, '-^', 'LineWidth', 1.5, 'MarkerFaceColor', 'g');
legend('Total Sideband Power (Ptsb)', 'Total Power (Pt)', 'Location', 'northwest');
title('Power Variation with \mu');
xlabel('Modulation Index (\mu)');
ylabel('Power (W)');
grid on;