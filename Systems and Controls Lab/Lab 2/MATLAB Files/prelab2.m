syms k_p k_i K_DC s tau

C = (k_p*s + k_i)/s;
G = (K_DC) / (tau * s + 1);

closed = C*G / (1 + C*G);

simplify(closed)