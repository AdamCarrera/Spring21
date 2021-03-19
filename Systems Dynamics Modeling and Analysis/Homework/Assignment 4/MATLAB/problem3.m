% Define system as a function of input variables
syms s q T_0

u = [q; T_0];

A = [-1 1; 1 2];
B = eye(2) * u;
C = eye(2);
D = 0;

% Calculate transfer function
G = C*inv((s*eye(2) - A))*B

% Final Value
final_values = limit(s*G,s,0)