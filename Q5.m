%Yasmin Al Shawawrh
%1220848
%Q5
%part1

s = tf('s');
G = 1 / ((s + 2)*(s + 10)*(s + 15));
T = feedback(G, 1); 
figure;
rlocus(T);
title('Root Locus of Open-Loop System');

%Yasmin Al Shawawrh
%1220848
%Q5
%part2

OS = 7;    
Ts = 0.9434;   
zeta = -log(OS/100) / sqrt(pi^2 + log(OS/100)^2);
wn = 4 / (zeta * Ts);
sigma = zeta * wn;
wd = wn * sqrt(1 - zeta^2);
s_desired = -sigma + 1i * wd;
den_val = (s_desired + 2) * (s_desired + 10) * (s_desired + 15);
K = -den_val;
fprintf('Desired pole: %.4f %+.4fj\n', real(s_desired), imag(s_desired));
fprintf('Calculated gain K: %.4f\n', real(K));

%Yasmin Al Shawawrh
%1220848
%Q5
%part3
p1 = -2;
p2 = -10;
p3 = -15;
Ts_new = 1.05 * Ts;
OS = 0.07;
zeta = -log(OS)/sqrt(pi^2 + log(OS)^2);
wn = 4 / (zeta * Ts_new);
sigma = -zeta * wn;
wd = wn * sqrt(1 - zeta^2);
s_des = sigma + 1i*wd;
fprintf('--- Desired Pole ---\n');
fprintf('s_des = %.4f %+.4fj\n\n', real(s_des), imag(s_des));
angle_p1 = angle(s_des - p1) * (180/pi);
angle_p2 = angle(s_des - p2) * (180/pi);
angle_p3 = angle(s_des - p3) * (180/pi);
angle_origin = angle(s_des - 0) * (180/pi);
total_pole_angle = angle_p1 + angle_p2 + angle_p3 + angle_origin;
zero_angle_deg = -180 + total_pole_angle;
zero_angle_rad = deg2rad(zero_angle_deg);
fprintf('\nAngle from poles:\n');
fprintf('Angle p1 (-2): %.2f deg\n', angle_p1);
fprintf('Angle p2 (-10): %.2f deg\n', angle_p2);
fprintf('Angle p3 (-15): %.2f deg\n', angle_p3);
fprintf('Angle from origin (0): %.2f deg\n', angle_origin);
fprintf('Total pole angle: %.2f deg\n', total_pole_angle);
fprintf('Required zero angle: %.2f deg\n', zero_angle_deg);
a = real(s_des) - (imag(s_des)/tan(zero_angle_rad));
fprintf('Zero a = %.4f --> PI Zero at s = -%.4f\n\n', a, a);
PI = tf([1 a], [1 0]);
G = 1 / ((s + 2)*(s + 10)*(s + 15));
num = abs(s_des * (s_des + 2)*(s_des + 10)*(s_des + 15));
den = abs(s_des + a);
K = num / den;
fprintf('--- PI Controller ---\n');
fprintf('Calculated gain K = %.2f\n', K);
fprintf('C(s) = %.2f * (s + %.4f) / s\n\n', K, a);
L = K * PI * G;
T = feedback(L, 1);
T
figure;
step(T);
title('Step Response of PI Compensated System');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

clc;
clear;
close all;

%Yasmin Al Shawawrh
%1220848
%Q5
%part4

s = tf('s');
G = 1 / ((s + 2)*(s + 10)*(s + 15));
K_uncomp = 498; % from part 1
T_uncomp = feedback(K_uncomp * G, 1);
a = 0.6273;
K_comp = 443.56;
PI = tf([1 a], [1 0]);
T_comp = feedback(K_comp * PI * G, 1);
figure;
step(T_uncomp, 'r', T_comp, 'b', 15);
legend('Uncompensated (K = 498)', 'PI Compensated (K = 443.56)');
title('Step Response: Uncompensated vs PI Compensated');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;


 
