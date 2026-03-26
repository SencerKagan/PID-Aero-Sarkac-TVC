clc; clear; close all; 

  

num = 2.31; 

den = [0.0025 0.02 0.205]; 

G = tf(num, den); 

  

Kp = 0.17689; 

Ki = 0.90333; 

Kd = 0.0086598; 

C = pid(Kp, Ki, Kd); 

  

T = feedback(C*G, 1); 

  

t = 0:0.01:5; 

r_step = ones(size(t)); 

r_ramp = t; 

r_parabolic = 0.5 * t.^2; 

  

[y_step, ~] = lsim(T, r_step, t); 

[y_ramp, ~] = lsim(T, r_ramp, t); 

[y_parabolic, ~] = lsim(T, r_parabolic, t); 

  

figure('Name', 'Sistem Tepki Analizi', 'Color', 'white'); 

  

subplot(3,1,1); 

plot(t, r_step, 'r--', 'LineWidth', 1.5); hold on; 

plot(t, y_step, 'b', 'LineWidth', 2); 

title('Basamak Tepkisi'); 

legend('Referans', 'Çıkış', 'Location', 'SouthEast'); 

grid on; ylabel('Genlik'); 

  

subplot(3,1,2); 

plot(t, r_ramp, 'r--', 'LineWidth', 1.5); hold on; 

plot(t, y_ramp, 'b', 'LineWidth', 2); 

title('Rampa Tepkisi'); 

legend('Referans', 'Çıkış', 'Location', 'SouthEast'); 

grid on; ylabel('Genlik'); 

  

subplot(3,1,3); 

plot(t, r_parabolic, 'r--', 'LineWidth', 1.5); hold on; 

plot(t, y_parabolic, 'b', 'LineWidth', 2); 

title('Parabolik Tepki'); 

legend('Referans', 'Çıkış', 'Location', 'SouthEast'); 

grid on; ylabel('Genlik'); xlabel('Zaman (sn)'); 