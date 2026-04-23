%Yasmin Al Shawawrh
%1220848
%Q2

A = 9; %numerator 
B = [1 2 0]; %denominator
G = tf(A, B);
T = feedback(G, 1); %T(s)= 9/(s^2+2s+9)
wn = sqrt(9);    
zeta = 2 / (2*wn);               
Tr = (1.76*zeta^3 - 0.417*zeta^2 + 1.039*zeta + 1)/wn;
Ts = 4 / (zeta * wn); 
Tp = pi / (wn * sqrt(1 - zeta^2));
OS = exp((-zeta*pi) / sqrt(1 - zeta^2)) * 100;
fprintf('Damping Ratio (zeta): %.2f\n', zeta);
fprintf('Natural Frequency (wn): %.2f rad/s\n', wn);
fprintf('Rise Time (Tr): %.2f s\n', Tr);
fprintf('Settling Time (Ts): %.2f s\n', Ts);
fprintf('Peak Time (Tp): %.2f s\n', Tp);
fprintf('Overshoot (OS): %.2f %%\n', OS);
figure;
step(T);
stepinfo(T);
title('Step Response of G(s)= 9/(s^2+2s)');
xlabel('Time');
ylabel('Amplitude');
grid on;
