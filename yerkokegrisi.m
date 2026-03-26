clc; clear; close all; 

  

num = 2.31; 

den = [0.0025 0.02 0.205]; 

G = tf(num, den); 

  

K_vals = [0.31, -0.002, 0.75, 924, 0.45]; 

  

figure('Color', 'white'); 

rlocus(G); 

hold on; 

  

colors = lines(length(K_vals)); 

handles = []; 

labels = {}; 

  

for i = 1:length(K_vals) 

    sys_cl = feedback(K_vals(i) * G, 1); 

    p = pole(sys_cl); 

    h = plot(real(p), imag(p), 'x', 'MarkerSize', 12, 'LineWidth', 2, 'Color', colors(i,:)); 

    handles = [handles; h(1)]; 

    labels{end+1} = ['K = ', num2str(K_vals(i))]; 

end 

  

title('Root Locus Analizi'); 

xlabel('Real Axis'); ylabel('Imaginary Axis'); 

grid on; 

legend(handles, labels, 'Location', 'Best'); 

axis([-20 5 -1000 1000]); 