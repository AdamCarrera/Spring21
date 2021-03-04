A = [0 1; -1/2 -1];
B = [0; 2];
C = [0 1];
D = 0;

sys = ss(A, B, C, D);

sys_tf = tf(sys)