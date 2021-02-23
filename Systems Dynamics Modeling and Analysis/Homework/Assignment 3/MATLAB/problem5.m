% Define System
num = 6;
dem = [3 21 30];
sys = tf(num, den);

% Define input
t = linspace(0, 6, 500);
f = cos(3*t);

[y, t] = lsim(sys, f, t);

figure;plot(t, f, t, y)
title("Linear Simulation")
xlabel('t')
ylabel('x(t) and f(t)')
xlim([0 6])
legend('f(t)', 'x(t)')