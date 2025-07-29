%% --- USER INPUT SECTION ---
close all

time = linspace(0, 2.5e4, 25001);  % time vector

soc         = out.simout.Data(1:25001,1);     % State of charge %
solar       = out.simout.Data(1:25001,2);     % Solar generation mW
consumption = out.simout.Data(1:25001,3);     % Constant drain in mW

% Font and plot styling
font.legend       = 12;
font.xlabel.size  = 13;
font.ylabel.size  = 13;
font.title.size   = 14;
font.ticks        = 12;
font.xlabel.name  = 'Times New Roman';
font.ylabel.name  = 'Times New Roman';
font.title.name   = 'Times New Roman';
font.xlabel.weight = 'bold';
font.ylabel.weight = 'bold';
font.title.weight = 'bold';

linewidtht = 2.5;

% Axis limits
ylim_soc         = [-5 115];        
ylim_solar       = [-200 4300];     
ylim_consumption = [-2300 500];     

%% --- PLOTTING SECTION ---
figure;

% Subplot 1 - SoC
subplot(3,1,1);
plot(time, soc, 'Color', [0 0.447 0.741], 'LineWidth', linewidtht);  % Blue
title('State of Charge (SoC %) VS Time', ...
    'FontSize', font.title.size, ...
    'FontName', font.title.name, ...
    'FontWeight', font.title.weight);
ylabel('SoC (Battery Percentage)', ...
    'FontSize', font.ylabel.size, ...
    'FontName', font.ylabel.name, ...
    'FontWeight', font.ylabel.weight);
legend('Battery SoC %', 'FontSize', font.legend);
set(gca, 'FontSize', font.ticks);
if ~isempty(ylim_soc), ylim(ylim_soc); end
grid on;

% Subplot 2 - Solar Power Generation
subplot(3,1,2);
plot(time, solar, 'Color', [0.850 0.325 0.098], 'LineWidth', linewidtht);  % Orange
title('Solar Power Generation (mW) VS Time', ...
    'FontSize', font.title.size, ...
    'FontName', font.title.name, ...
    'FontWeight', font.title.weight);
ylabel('Power Generated (mW)', ...
    'FontSize', font.ylabel.size, ...
    'FontName', font.ylabel.name, ...
    'FontWeight', font.ylabel.weight);
legend('Power Generated (mW)', 'FontSize', font.legend);
set(gca, 'FontSize', font.ticks);
if ~isempty(ylim_solar), ylim(ylim_solar); end
grid on;

% Subplot 3 - Satellite Power Consumption
subplot(3,1,3);
plot(time, consumption, 'Color', [0.466 0.674 0.188], 'LineWidth', linewidtht);  % Green
title('Satellite Power Consumption (mW) VS Time', ...
    'FontSize', font.title.size, ...
    'FontName', font.title.name, ...
    'FontWeight', font.title.weight);
xlabel('Time', ...
    'FontSize', font.xlabel.size, ...
    'FontName', font.xlabel.name, ...
    'FontWeight', font.xlabel.weight);
ylabel('Power Drain (mW)', ...
    'FontSize', font.ylabel.size, ...
    'FontName', font.ylabel.name, ...
    'FontWeight', font.ylabel.weight);
legend('Power Drain (mW)', 'FontSize', font.legend);
set(gca, 'FontSize', font.ticks);
if ~isempty(ylim_consumption), ylim(ylim_consumption); end
grid on;
