%% System Parameters
Dc = 0.04445; % Diameter of tank in [m]
Do = 0.0047625; % Diameter of orifice in [m]
g  = 9.81; % Gravitational acceleration in [m/s^2]
Ac = pi*Dc^2/4; % Cross-sectional area of tank based on diameter in [m^2]
Ao = pi*Do^2/4; % Cross-sectional area of orifice based on diameter in [m^2]
Kp = 0; % Pump constant in [m^3/s/V]
Cd = 0.9; % Unitless discharge coefficient between 0 and 1
vp = 0; % Pump voltage in [V]

%% Initial Condition
h0 = 0.1696; % Initial height of water in the tank in [m]

%% Simulate System
sim_time = 120; % Length of simulation in [s]
sim Sim_OpenLoop.mdl % Execute simulation

%% Plot Simulation Results
figure;  % Open a new figure
plot(t_sim + 127.4, h_sim);  % plot the simulated hieghts as a function of time
title("Height of Tank vs Time");
ylim([0 h0]) % Set y-axis range
xlabel('Time [s]')
ylabel('Height [m]')
hold on

%% Plot Experiment Results
plot(h1_exp(1275:1540,1), h1_exp(1275:1540,2))
legend("Simulation", "Experiment")

%% Kp Determination

pump_voltage = [4.5 5 5.5 6 6.5 7 7.5];
height_ss = [1.6 2.5 3.6 5 6.4 8 10];

Kp = ((Cd * Ao)./pump_voltage).*sqrt(2*g*height_ss)
figure;
plot(pump_voltage, Kp)
title("Pump Coefficient versus Pump Voltage")
xlabel("Pump Voltage [V]")
ylabel("Pump Coefficient [Unitless]")

%% Kp Determination Part 2

v_min = 2.5;
Kp = ((Cd * Ao)./(pump_voltage - v_min)).*sqrt(2*g*height_ss);

plot(pump_voltage, Kp)
title("Pump Coefficient versus Pump Voltage - Minimum Voltage", 'FontSize', 9)
xlabel("Pump Voltage [V]")
ylabel("Pump Coefficient [Unitless]")
