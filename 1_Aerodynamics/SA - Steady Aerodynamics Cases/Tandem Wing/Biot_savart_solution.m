clear all
close all



delta = -0.01:0.0001:0.01;
epsilon1 = 0.001;
epsilon2 = 0.0025;
epsilon3 = 0.01;


V_d1 = (0.25/pi)*sign(delta).*(delta.^2)./((delta.^2 + epsilon1^2).^(3/2));
V_d2 = (0.25/pi)*sign(delta).*(delta.^2)./((delta.^2 + epsilon2^2).^(3/2));
V_d3 = (0.25/pi)*sign(delta).*(delta.^2)./((delta.^2 + epsilon3^2).^(3/2));
V = (0.25/pi)*1./delta;



figure(1)
plot(delta,V,'b')
hold on
plot(delta,V_d1,'r')
% hold on
% plot(delta,V_d2,'k')
% hold on
% plot(delta,V_d3,'g')
grid on
xlabel('distance from the filament')
ylabel('induced velocity ')
% legend('singular model','\epsilon = c/4','\epsilon = c/8','\epsilon = c/16')