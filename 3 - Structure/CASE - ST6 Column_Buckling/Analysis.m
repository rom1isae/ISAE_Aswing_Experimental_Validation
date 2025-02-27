clear all
close all
clc

%%
pound2N = 4.44822;


%%
Specimen_1 = readtable('Specimen_1.csv',NumHeaderLines=1);

figure(1)
plot(Specimen_1.Var3,Specimen_1.Var4*pound2N,'sk',markersize=10,MarkerFaceColor='k')
grid on 
xlim([0 130])
ylim([0 1.2*max(Specimen_1.Var4*pound2N)])
title('Specimen 1 - Angle')


rho = 0.489; 
E = 10.6E6;
Area = mean(Specimen_1.Var2);
K = 0.5;

L = linspace(0,120,100);
for i = 1:length(L)
Fcr(i) = Area*(pi^2*E)./((K*L(i)/rho).^2);
end

slender_ratio = K*L/(rho);
hold on 
plot(slender_ratio,Fcr*pound2N,'--r',LineWidth=2)
xlabel('KL/r')
ylabel('F_{cr}: Critical load in N')
legend('Experimental data','Aswing Euler Critical load')
set(gca, 'FontSize', 16); 

%%
Specimen_2 = readtable('Specimen_2.csv',NumHeaderLines=1);

figure(2)
plot(Specimen_2.Var3,Specimen_2.Var4*pound2N,'sk',markersize=10,MarkerFaceColor='k')
grid on 
xlim([0 130])
ylim([0 1.2*max(Specimen_2.Var4*pound2N)])
title('Specimen 2 - Zee')
rho = 0.685; 
E = 10.6E6;
Area = mean(Specimen_2.Var2);
K = 0.5;

L = linspace(0,120,100);
for i = 1:length(L)
Fcr(i) = Area*(pi^2*E)./((K*L(i)/rho).^2);
end

slender_ratio = K*L/(rho);
hold on 
plot(slender_ratio,Fcr*pound2N,'--r',LineWidth=2)
xlabel('KL/r')
ylabel('F_{cr}: Critical load in N')
legend('Experimental data','Aswing Euler Critical load')
set(gca, 'FontSize', 16);
%%
Specimen_3 = readtable('Specimen_3.csv',NumHeaderLines=1);

figure(3)
plot(Specimen_3.Var3,Specimen_3.Var4*pound2N,'sk',markersize=10,MarkerFaceColor='k')
grid on 
xlim([0 130])
ylim([0 1.2*max(Specimen_3.Var4*pound2N)])
title('Specimen 3 bar')
rho = 0.181; 
E = 10.6E6;
Area = mean(Specimen_3.Var2);
K = 0.5;

L = linspace(0,120,100);
for i = 1:length(L)
Fcr(i) = Area*(pi^2*E)./((K*L(i)/rho).^2);
end

slender_ratio = K*L/(rho);
hold on 
plot(slender_ratio,Fcr*pound2N,'--r',LineWidth=2)
xlabel('KL/r')
ylabel('F_{cr}: Critical load in N')
legend('Experimental data','Aswing Euler Critical load')
set(gca, 'FontSize', 16); 
hold on

Specimen_4 = readtable('Specimen_4.csv',NumHeaderLines=1);

plot(Specimen_4.Var3,Specimen_4.Var4*pound2N,'ok',markersize=10,MarkerFaceColor='k')
grid on 
xlim([0 130])
ylim([0 1.2*max(Specimen_4.Var4*pound2N)])
title('Specimen 3&4 - Bar')
rho = 0.289; 
E = 10.6E6;
Area = mean(Specimen_4.Var2);
K = 0.5;

L = linspace(0,120,100);
for i = 1:length(L)
Fcr(i) = Area*(pi^2*E)./((K*L(i)/rho).^2);
end

slender_ratio = K*L/(rho);
hold on 
plot(slender_ratio,Fcr*pound2N,'-.r',LineWidth=2)
xlabel('KL/r')
ylabel('F_{cr}: Critical load in N')
legend('Bar 1: Experimental data','Bar 1: Aswing Euler Critical load','Bar 2: Experimental data','Bar 2: Aswing Euler Critical load')
set(gca, 'FontSize', 16);

%%
% Specimen_4 = readtable('Specimen_4.csv',NumHeaderLines=1);
% 
% figure(4)
% plot(Specimen_4.Var3,Specimen_4.Var4*pound2N,'sk',markersize=10,MarkerFaceColor='k')
% grid on 
% xlim([0 130])
% ylim([0 1.2*max(Specimen_4.Var4*pound2N)])
% title('Specimen 4 bar')
% rho = 0.289; 
% E = 10.6E6;
% Area = mean(Specimen_4.Var2);
% K = 0.5;
% 
% L = linspace(0,120,100);
% for i = 1:length(L)
% Fcr(i) = Area*(pi^2*E)./((K*L(i)/rho).^2);
% end
% 
% slender_ratio = K*L/(rho);
% hold on 
% plot(slender_ratio,Fcr*pound2N,'--r',LineWidth=2)
% xlabel('KL/r')
% ylabel('F_{cr}: Critical load in N')
% legend('Experimental data','Aswing Euler Critical load')
% set(gca, 'FontSize', 16);


%%
Specimen_5 = readtable('Specimen_5.csv',NumHeaderLines=1);

figure(5)
plot(Specimen_5.Var3,Specimen_5.Var4*pound2N,'sk',markersize=10,MarkerFaceColor='k')
grid on 
xlim([0 130])
ylim([0 1.2*max(Specimen_5.Var4*pound2N)])
title('Specimen 5 - Rod')
rho = 0.250; 
E = 10.6E6;
Area = mean(Specimen_5.Var2);
K = 0.5;

L = linspace(0,120,100);
for i = 1:length(L)
Fcr(i) = Area*(pi^2*E)./((K*L(i)/rho).^2);
end

slender_ratio = K*L/(rho);
hold on 
plot(slender_ratio,Fcr*pound2N,'--r',LineWidth=2)
xlabel('KL/r')
ylabel('F_{cr}: Critical load in N')
legend('Experimental data','Aswing Euler Critical load')

set(gca, 'FontSize', 16); % Change 12 to your desired font size
