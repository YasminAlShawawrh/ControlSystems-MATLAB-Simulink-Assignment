%Yasmin Al Shawawrh
%1220848
%Q4

s = tf('s');
G = (5*s^2 + 2*s) / ((s + 1)*(s + 7));
T = feedback(G, 1);
figure;
step(T);
title('Step Response of Unity Negative Feedback System');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
