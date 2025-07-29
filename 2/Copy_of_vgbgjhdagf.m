%% --- USER INPUT SECTION ---
close all;
clear font style;
stop.time = 35000;
% Data (replace with your actual variable)
time  = linspace(0, stop.time, stop.time);  % X-axis
solar = out.simout.Data(1:stop.time,1); % Main Y signal (Battery SoC %)

% Font settings
font.title.name  = 'Times New Roman';
font.title.size  = 200;
font.xlabel.size = 14;
font.ylabel.size = 15;
font.ticks.size  = 14;
font.legend.size = 14;

% --- Classic MATLAB colors (RGB triplets) ---
% [0.000, 0.447, 0.741]   % Default Blue
% [0.850, 0.325, 0.098]   % Orange
% [0.929, 0.694, 0.125]   % Yellow
% [0.494, 0.184, 0.556]   % Purple
% [0.466, 0.674, 0.188]   % Green
% [0.301, 0.745, 0.933]   % Cyan
% [0.635, 0.078, 0.184]   % Dark Red
% [1.000, 0.000, 0.000]   % Bright Red
% [0.000, 0.000, 0.000]   % Black
% [0.500, 0.500, 0.500]   % Gray

% Plot styling
style.main.color     = [0.000, 0.447, 0.741];   % Main signal (default blue)
style.top_dash.color = [0.466, 0.674, 0.188];   % Top dashed line (green)
style.bot_dash.color = [1.000, 0.000, 0.000];   % Bottom dashed line (red)

style.linewidth   = 3;
style.dashstyle   = '--';

% Axis limits
ylim_main = [-5 115];
xlim_main = [0 stop.time];

%% --- PLOTTING SECTION ---
figure;
hold on;

% Main signal
plot(time, solar, ...
    'Color', style.main.color, ...
    'LineWidth', style.linewidth);

% Dashed horizontal lines
yline(0, style.dashstyle, 'Color', style.bot_dash.color, 'LineWidth', style.linewidth-0.5);
yline(100, style.dashstyle, 'Color', style.top_dash.color, 'LineWidth', style.linewidth-0.5);

% Labels and title
xlabel('Time (s)', 'FontSize', font.xlabel.size);
ylabel('Battery SoC (%)', 'FontSize', font.ylabel.size);
title('Battery State of Charge vs Time ', ...
    'FontSize', font.title.size, ...
    'FontName', font.title.name, ...
    'FontWeight', 'bold');

% Legend
legend({'Battery SoC %', 'Min Battery Capacity', 'Max Battery Capacity'}, ...
    'FontSize', font.legend.size);

% Axis, font, grid
set(gca, 'FontSize', font.ticks.size);
if ~isempty(ylim_main), ylim(ylim_main); end
if ~isempty(xlim_main), xlim(xlim_main); end
grid on;
