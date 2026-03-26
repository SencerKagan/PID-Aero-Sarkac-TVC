clc; clear; close all; 

  

num = 2.31; 

den = [0.0025 0.02 0.205]; 

G = tf(num, den); 

  

t_step = 0:0.01:14; 

t_ramp = 0:0.01:10; 

  

u_step = ones(size(t_step)); 

u_ramp = t_ramp; 

u_parab = 0.5 * t_ramp.^2; 

  

[y_step, ~] = lsim(G, u_step, t_step); 

[y_ramp, ~] = lsim(G, u_ramp, t_ramp); 

[y_parab, ~] = lsim(G, u_parab, t_ramp); 

  

figure('Name', 'Açık Çevrim Analizi', 'Color', 'white'); 

  

subplot(3,1,1); 

plot(t_step, u_step, 'r--', 'LineWidth', 2); hold on; 

plot(t_step, y_step, 'b', 'LineWidth', 2); 

title('Basamak (Step) Cevabı'); 

ylabel('Genlik'); 

legend('Giriş', 'Çıkış', 'Location', 'SouthEast'); 

grid on; 

axis([0 14 -2 20]); 

  

subplot(3,1,2); 

plot(t_ramp, u_ramp, 'r--', 'LineWidth', 2); hold on; 

plot(t_ramp, y_ramp, 'b', 'LineWidth', 2); 

title('Rampa Cevabı'); 

ylabel('Genlik'); 

legend('Giriş', 'Çıkış', 'Location', 'NorthWest'); 

grid on; 

xlim([0 10]); 

  

subplot(3,1,3); 

plot(t_ramp, u_parab, 'r--', 'LineWidth', 2); hold on; 

plot(t_ramp, y_parab, 'b', 'LineWidth', 2); 

title('Parabolik Cevap'); 

xlabel('Zaman (s)'); ylabel('Genlik'); 

legend('Giriş', 'Çıkış', 'Location', 'NorthWest'); 

grid on; 

xlim([0 10]); 