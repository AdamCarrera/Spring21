set(0, 'defaulttextinterpreter', 'Latex')

% Define system
num = 6;
den = [3 21 30];
sys = tf(num, den);

% Define input
t = linspace(0, 6, 500);
f = cos(3*t);

% Plot simulation
[y, t] = lsim(sys, f, t);

figure;plot(t, f, t, y)
title("Linear Simulation")
xlabel('Time, $t$')
ylabel('$x(t)$ and $f(t)$')
xlim([0 6])
legend('$6\cos 3t$', '$x(t)$', 'Interpreter','latex')