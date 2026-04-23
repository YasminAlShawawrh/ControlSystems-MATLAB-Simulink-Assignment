%Yasmin Al Shawawrh
%1220848
%Q1

A = [1]; %numerator 
B = [1 3 0]; %denominator
G = tf(A, B);  
T = feedback(G, 1); 
step(T);
title('Step Response of Unity Feedback System');
xlabel('Time');
ylabel('Amplitude');
grid on;