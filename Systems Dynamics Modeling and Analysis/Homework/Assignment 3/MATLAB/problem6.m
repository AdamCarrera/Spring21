% Define blocks
E = tf(6, [1 0]);
M = tf(1, [4 1]);
G = tf(1, [3 2]);


% Without D
s1 = series(M, G);
s2 = feedback(s1, 10);
s3 = series(s2, E);
s4 = feedback(s3, 1)