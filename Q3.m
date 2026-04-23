%Yasmin Al Shawawrh
%1220848
%Q3

s = tf('s');
G = 1 / ((s+3)*(s+7)*(s+9)*(s+13));
disp('Transfer Function G(s):');
G
poles = pole(G);
zeros = zero(G);
disp('Poles of the system:');
disp(poles);
disp('Zeros of the system:');
disp(zeros);
figure;
pzmap(G);
title('Pole-Zero Map of G(s)');
grid on;
