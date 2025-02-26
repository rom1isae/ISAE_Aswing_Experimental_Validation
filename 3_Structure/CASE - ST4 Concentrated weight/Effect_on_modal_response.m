clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Effect of concentrated weights on the modal response of a straigth wing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script is only for illustration purpose. For rigourous comparison
% with experiments please refer to the csv file Eigen_data_save.csv


% Weight I data :
I_yb = [0.17 0.23 0.35 0.96 1];
I_fb1e = [6.2 6.1 5.9 3.1 2.8];
I_fb1A = [6.6 6.5 6.2 3.1 3.0];

I_fte = [27 22.7 19.7 17.6 NaN];
I_ftA = [26.5 23.2 19.2 17 NaN];

% Weight I data :
IV_yb = [0.23 0.44 0.56 0.69];
IV_fb1e = [6.1 5.4 4.8 4.2];
IV_fb1A = [6.5 5.8 5.1 4.4];

IV_fte = [33.2 26.9 25.6 22.4];
IV_ftA = [31.9 26.8 23.5 21.4];

O_fb1e = 6.25;
O_fb1A = 6.6;
O_fte = 44.6;
O_ftA = 48.8;



figure(1)
plot([0],O_fb1e,'dk',MarkerFaceColor='k',MarkerSize=8,LineWidth=1.5)
hold on
plot([0],O_fb1A,'dr',MarkerSize=8,LineWidth=1.5)
hold on 
plot(I_yb,I_fb1e,'sk',MarkerFaceColor='k',MarkerSize=8,LineWidth=1.5)
hold on 
plot(I_yb,I_fb1A,'--sr',MarkerSize=8,LineWidth=1.5)
hold on 
plot(IV_yb,2*IV_fb1e,'ok',MarkerFaceColor='k',MarkerSize=8,LineWidth=1.5)
hold on 
plot(IV_yb,2*IV_fb1A,'-.or',MarkerSize=8,LineWidth=1.5)
xlabel('2y/b')
ylabel('fb_1 in Hz')
ylim([0 15])
xlim([0 1.25])

grid on
legend('W_0 : EXP','W_0 : ASW','W_I : f_b EXP',...
    'W_I : f_b ASW','W_{IV} : 2f_b Exp','W_{IV} : 2f_b ASW')


set(gca,"FontSize",14)
saveas(gcf,"first_bending",'epsc')

figure(2)
plot([0],O_fte,'dk',MarkerFaceColor='k',MarkerSize=8,LineWidth=1.5)
hold on
plot([0],O_ftA,'dr',MarkerSize=8,LineWidth=1.5)
hold on 
plot(I_yb,I_fte,'sk',MarkerFaceColor='k',MarkerSize=8,LineWidth=1.5)
hold on 
plot(I_yb,I_ftA,'--sr',MarkerSize=8,LineWidth=1.5)
hold on 
plot(IV_yb,2*IV_fte,'ok',MarkerFaceColor='k',MarkerSize=8,LineWidth=1.5)
hold on 
plot(IV_yb,2*IV_ftA,'-.or',MarkerSize=8,LineWidth=1.5)
xlabel('2y/b')
ylabel('ft in Hz')
% ylim([0 15])
xlim([0 1.25])
grid on
legend('W_0 : EXP','W_0 : ASW','W_I : f_t EXP',...
    'W_I : f_t ASW','W_{IV} : 2f_t Exp','W_{IV} : 2f_t ASW')

set(gca,"FontSize",14)
saveas(gcf,"torsion_mode",'epsc')