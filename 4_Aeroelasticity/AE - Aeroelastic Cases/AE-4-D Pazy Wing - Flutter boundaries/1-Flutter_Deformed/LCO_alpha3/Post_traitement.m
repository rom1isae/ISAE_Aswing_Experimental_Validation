clear all
close all
clc



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SIMULATIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

system('sh ./V_1.sh')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lecture données
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = [];
Ry = [];
Theta = [];

for i = 1:7
    filename = "V1_"+num2str(i)+".txt";
    data_temp = readtable(filename,NumHeaderLines=3)
    t =  [t ; data_temp.Var2];
    Ry =  [Ry ; data_temp.Var3];
    Theta =  [Theta ; data_temp.Var4];
end

% load("Laminate_0_90.mat") 
% Laminate_0_90.V27.t = t;
% Laminate_0_90.V27.Ry = Ry;
% Laminate_0_90.V27.Theta = Theta;
% Laminate_0_90.V26.t = t;
% Laminate_0_90.V26.Ry = Ry;
% Laminate_0_90.V26.Theta = Theta;
% Laminate_0_90.V25.t = t;
% Laminate_0_90.V25.Ry = Ry;
% Laminate_0_90.V25.Theta = Theta;
% Laminate_0_90.V25_5.t = t;
% Laminate_0_90.V25_5.Ry = Ry;
% Laminate_0_90.V25_5.Theta = Theta;
% Laminate_0_90.V26_5.t = t;
% Laminate_0_90.V26_5.Ry = Ry;
% Laminate_0_90.V26_5.Theta = Theta;
% Laminate_0_90.V27_25.t = t;
% Laminate_0_90.V27_25.Ry = Ry;
% Laminate_0_90.V27_25.Theta = Theta;
% save("Laminate_0_90.mat","Laminate_0_90")


% load("Laminate_p15_0.mat") 
% Laminate_p15_0.V28_5.t = t;
% Laminate_p15_0.V28_5.Ry = Ry;
% Laminate_p15_0.V28_5.Theta = Theta;
% Laminate_p15_0.V29.t = t;
% Laminate_p15_0.V29.Ry = Ry;
% Laminate_p15_0.V29.Theta = Theta;
% Laminate_p15_0.V29_5.t = t;
% Laminate_p15_0.V29_5.Ry = Ry;
% % Laminate_p15_0.V29_5.Theta = Theta;
% Laminate_p15_0.V30.t = t;
% Laminate_p15_0.V30.Ry = Ry;
% Laminate_p15_0.V30.Theta = Theta;
% save("Laminate_p15_0.mat","Laminate_p15_0")


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LCO [0_3/90]


load("Laminate_0_90.mat") 

figure(1)
subplot(6,2,1)
plot(Laminate_0_90.V25.t,Laminate_0_90.V25.Ry -mean(Laminate_0_90.V25.Ry(2000:end)),'b',LineWidth=2.0)
xlabel('t in s')
ylabel('\Delta z_{tip} in m')
title('V = 25 m/s')
xlim([0.0 7.0])
ylim([-0.15 0.15])
grid on 
subplot(6,2,2)
plot(Laminate_0_90.V25.t,Laminate_0_90.V25.Theta -mean(Laminate_0_90.V25.Theta(2000:end)),'b',LineWidth=2.0)
xlabel('t in s')
ylabel('\Delta \theta in °')
title('V = 25 m/s')
xlim([0.0 7.0])
ylim([-3.5 3.5])
grid on 
subplot(6,2,3)
plot(Laminate_0_90.V25_5.t,Laminate_0_90.V25_5.Ry -mean(Laminate_0_90.V25_5.Ry(2000:end)),'b',LineWidth=2.0)
xlabel('t in s')
ylabel('\Delta z_{tip} in m')
title('V = 25.5 m/s')
xlim([0.0 7.0])
ylim([-0.15 0.15])
grid on 
subplot(6,2,4)
plot(Laminate_0_90.V25_5.t,Laminate_0_90.V25_5.Theta -mean(Laminate_0_90.V25_5.Theta(2000:end)),'b',LineWidth=2.0)
xlabel('t in s')
ylabel('\Delta \theta in °')
title('V = 25.5 m/s')
xlim([0.0 7.0])
ylim([-3.5 3.5])
grid on 
subplot(6,2,5)
plot(Laminate_0_90.V26.t,Laminate_0_90.V26.Ry -mean(Laminate_0_90.V26.Ry(2000:end)),'b',LineWidth=2.0)
xlabel('t in s')
ylabel('\Delta z_{tip} in m')
title('V = 26.0 m/s')
xlim([0.0 7.0])
ylim([-0.15 0.15])
grid on 
subplot(6,2,6)
plot(Laminate_0_90.V26.t,Laminate_0_90.V26.Theta -mean(Laminate_0_90.V26.Theta(2000:end)),'b',LineWidth=2.0)
xlabel('t in s')
ylabel('\Delta \theta in °')
title('V = 26.0 m/s')
xlim([0.0 7.0])
ylim([-3.5 3.5])
grid on 
subplot(6,2,7)
plot(Laminate_0_90.V26_5.t,Laminate_0_90.V26_5.Ry -mean(Laminate_0_90.V26_5.Ry(2000:end)),'b',LineWidth=2.0)
xlabel('t in s')
ylabel('\Delta z_{tip} in m')
title('V = 26.5 m/s')
xlim([0.0 7.0])
ylim([-0.15 0.15])
grid on 
subplot(6,2,8)
plot(Laminate_0_90.V26_5.t,Laminate_0_90.V26_5.Theta -mean(Laminate_0_90.V26_5.Theta(2000:end)),'b',LineWidth=2.0)
xlabel('t in s')
ylabel('\Delta \theta in °')
title('V = 26.5 m/s')
xlim([0.0 7.0])
ylim([-3.5 3.5])
grid on 
subplot(6,2,9)
plot(Laminate_0_90.V27.t,Laminate_0_90.V27.Ry -mean(Laminate_0_90.V27.Ry(2000:end)),'b',LineWidth=2.0)
xlabel('t in s')
ylabel('\Delta z_{tip} in m')
title('V = 27 m/s')
xlim([0.0 7.0])
ylim([-0.15 0.15])
grid on 
subplot(6,2,10)
plot(Laminate_0_90.V27.t,Laminate_0_90.V27.Theta -mean(Laminate_0_90.V27.Theta(2000:end)),'b',LineWidth=2.0)
xlabel('t in s')
ylabel('\Delta \theta in °')
title('V = 27 m/s')
xlim([0.0 7.0])
ylim([-3.5 3.5])
grid on 
subplot(6,2,11)
plot(Laminate_0_90.V27_25.t,Laminate_0_90.V27_25.Ry -mean(Laminate_0_90.V27_25.Ry(2000:end)),'b',LineWidth=2.0)
xlabel('t in s')
ylabel('\Delta z_{tip} in m')
title('V = 27.35 m/s')
xlim([0.0 7.0])
ylim([-0.15 0.15])
grid on 
subplot(6,2,12)
plot(Laminate_0_90.V27.t,Laminate_0_90.V27_25.Theta -mean(Laminate_0_90.V27_25.Theta(2000:end)),'b',LineWidth=2.0)
xlabel('t in s')
ylabel('\Delta \theta in °')
title('V = 27.35 m/s')
xlim([0.0 7.0])
ylim([-3.5 3.5])
grid on 



V = [0.0 .5 1 1.5 2.0 2.35]
Theta_max = [-min(Laminate_0_90.V25.Theta(5000:end))+max(Laminate_0_90.V25.Theta(5000:end)) ; ...
         -min(Laminate_0_90.V25_5.Theta(5000:end))+max(Laminate_0_90.V25_5.Theta(5000:end)) ; ...
         -min(Laminate_0_90.V26.Theta(5000:end))+max(Laminate_0_90.V26.Theta(5000:end)) ;...
         -min(Laminate_0_90.V26_5.Theta(5000:end))+max(Laminate_0_90.V26_5.Theta(5000:end));...
         -min(Laminate_0_90.V27.Theta(5000:end))+max(Laminate_0_90.V27.Theta(5000:end));...
         -min(Laminate_0_90.V27_25.Theta(5000:end))+max(Laminate_0_90.V27_25.Theta(5000:end))]


Ry_max = [-min(Laminate_0_90.V25.Ry(5000:end))+max(Laminate_0_90.V25.Ry(5000:end)) ; ...
         -min(Laminate_0_90.V25_5.Ry(5000:end))+max(Laminate_0_90.V25_5.Ry(5000:end)) ; ...
         -min(Laminate_0_90.V26.Ry(5000:end))+max(Laminate_0_90.V26.Ry(5000:end)) ;...
         -min(Laminate_0_90.V26_5.Ry(5000:end))+max(Laminate_0_90.V26_5.Ry(5000:end));...
         -min(Laminate_0_90.V27.Ry(5000:end))+max(Laminate_0_90.V27.Ry(5000:end));...
         -min(Laminate_0_90.V27_25.Ry(5000:end))+max(Laminate_0_90.V27_25.Ry(5000:end))];


V_exp= [0.0 1.0 2.0]
Ry_exp = [0.0 0.02 0.17]
Ry_Dunn = [0.0 0.01 0.05];
Ry_Err_exp = [0.0 0.01 0.03]

Theta_exp = [1.0 2.0 7.0]
Theta_Dunn = [0.0 3.0 14];
Theta_Err_exp = [0.0 1 0.5]

figure(2)
subplot(1,2,1)
plot(V,Ry_max,'-ro')
hold on
errorbar(V_exp,Ry_exp,Ry_Err_exp,'--sk',MarkerFaceColor='k')
hold on
plot(V_exp,Ry_Dunn,'-.d','Color',[0 0.5 0.0])
grid on
% xlim([25 30])
% ylim([0 30])
xlabel('\Delta V in m/s')
ylabel('\Delta R_y in m')
subplot(1,2,2)
plot(V,Theta_max,'-rd')
hold on
errorbar(V_exp,Theta_exp,Theta_Err_exp,'--sk',MarkerFaceColor='k')
hold on
plot(V_exp,Theta_Dunn,'-.d','Color',[0 0.5 0.0])
legend('ASWING','Exp','Duun')
grid on

% xlim([25 30])
xlabel('\Delta V in m/s')
ylabel('\Delta \theta in °')

figure(3)

% plot(Laminate_0_90.V25.Theta(4000:end) -0.5*(min(Laminate_0_90.V25.Theta(4000:end))+max(Laminate_0_90.V25.Theta(4000:end))),-Laminate_0_90.V25.Ry(4000:end)+ 0.5*(min(Laminate_0_90.V25.Ry(4000:end))+max(Laminate_0_90.V25.Ry(4000:end))),'r')
% hold on
plot(Laminate_0_90.V25_5.Theta(4000:end) -0.5*(min(Laminate_0_90.V25_5.Theta(4000:end))+max(Laminate_0_90.V25_5.Theta(4000:end))),-Laminate_0_90.V25_5.Ry(4000:end)+ 0.5*(min(Laminate_0_90.V25_5.Ry(4000:end))+max(Laminate_0_90.V25_5.Ry(4000:end))),'r')
hold on
plot(Laminate_0_90.V26.Theta(4000:end) -0.5*(min(Laminate_0_90.V26.Theta(4000:end))+max(Laminate_0_90.V26.Theta(4000:end))),-Laminate_0_90.V26.Ry(4000:end)+ 0.5*(min(Laminate_0_90.V26.Ry(4000:end))+max(Laminate_0_90.V26.Ry(4000:end))),'b')
hold on
plot(Laminate_0_90.V26_5.Theta(2000:end) -0.5*(min(Laminate_0_90.V26_5.Theta(2000:end))+max(Laminate_0_90.V26_5.Theta(2000:end))),-Laminate_0_90.V26_5.Ry(2000:end)+0.5*(min(Laminate_0_90.V26_5.Ry(2000:end))+max(Laminate_0_90.V26_5.Ry(2000:end))),'Color',[0 0.5 0.0])
hold on
plot(Laminate_0_90.V27.Theta(2000:end) -0.5*(min(Laminate_0_90.V27.Theta(2000:end))+max(Laminate_0_90.V27.Theta(2000:end))),-Laminate_0_90.V27.Ry(2000:end)+ 0.5*(min(Laminate_0_90.V27.Ry(2000:end))+max(Laminate_0_90.V27.Ry(2000:end))),'k')
hold on
% plot(Laminate_0_90.V27_25.Theta(2000:end) -0.5*(min(Laminate_0_90.V27_25.Theta(2000:end))+max(Laminate_0_90.V27_25.Theta(2000:end))),-Laminate_0_90.V27_25.Ry(2000:end)+ 0.5*(min(Laminate_0_90.V27_25.Ry(2000:end))+max(Laminate_0_90.V27_25.Ry(2000:end))),'Color',[0 0.5 0.0])
% hold on
grid on
xlabel('\Delta \theta in °')
ylabel('\Delta R_y in m')
legend('\Delta V = +0.5 m/s','\Delta V = +1.0 m/s','\Delta V = +1.5 m/s','\Delta V = +2.0 m/s')

figure(7)
plot(Laminate_0_90.V25_5.t,Laminate_0_90.V25_5.Ry -mean(Laminate_0_90.V25_5.Ry(2000:end)),'b',LineWidth=2.0)
xlabel('t in s')
ylabel('\Delta z_{tip} in m')
title('\Delta V = +0.5 m/s')
xlim([0.0 7.0])
ylim([-0.15 0.15])
grid on 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LCO [p15/0]

load("Laminate_p15_0.mat") 

figure(4)
subplot(4,2,1)
plot(Laminate_p15_0.V28_5.t,Laminate_p15_0.V28_5.Ry -mean(Laminate_p15_0.V28_5.Ry(2000:end)),'b',LineWidth=1.5)
xlabel('t in s')
ylabel('\Delta z_{tip} in m')
title('\Delta V = +0.5 m/s')
xlim([0.0 7.0])
ylim([-0.2 0.2])
grid on 
subplot(4,2,2)
plot(Laminate_p15_0.V28_5.t,Laminate_p15_0.V28_5.Theta -mean(Laminate_p15_0.V28_5.Theta(2000:end)),'b',LineWidth=1.5)
xlabel('t in s')
ylabel('\Delta \theta in °')
title('\Delta V = +0.5 m/s')
xlim([0.0 7.0])
ylim([-4.5 4.5])
grid on 
subplot(4,2,3)
plot(Laminate_p15_0.V29.t,Laminate_p15_0.V29.Ry -mean(Laminate_p15_0.V29.Ry(2000:end)),'b',LineWidth=1.5)
xlabel('t in s')
ylabel('\Delta z_{tip} in m')
title('\Delta V = +1.0 m/s')
xlim([0.0 7.0])
ylim([-0.2 0.2])
grid on 
subplot(4,2,4)
plot(Laminate_p15_0.V29.t,Laminate_p15_0.V29.Theta -mean(Laminate_p15_0.V29.Theta(2000:end)),'b',LineWidth=1.5)
xlabel('t in s')
ylabel('\Delta \theta in °')
title('\Delta V = +1.0 m/s')
xlim([0.0 7.0])
ylim([-4.5 4.5])
grid on 
subplot(4,2,5)
plot(Laminate_p15_0.V29_5.t,Laminate_p15_0.V29_5.Ry -mean(Laminate_p15_0.V29_5.Ry(2000:end)),'b',LineWidth=1.5)
xlabel('t in s')
ylabel('\Delta z_{tip} in m')
title('\Delta V = +1.5 m/s')
xlim([0.0 7.0])
ylim([-0.2 0.2])
grid on 
subplot(4,2,6)
plot(Laminate_p15_0.V29_5.t,Laminate_p15_0.V29_5.Theta -mean(Laminate_p15_0.V29_5.Theta(2000:end)),'b',LineWidth=1.5)
xlabel('t in s')
ylabel('\Delta \theta in °')
title('\Delta V = +1.5 m/s')
xlim([0.0 7.0])
ylim([-4.5 4.5])
grid on 
subplot(4,2,7)
plot(Laminate_p15_0.V30.t,Laminate_p15_0.V30.Ry -mean(Laminate_p15_0.V30.Ry(2000:end)),'b',LineWidth=1.5)
xlabel('t in s')
ylabel('\Delta z_{tip} in m')
title('\Delta V = +2.0 m/s')
xlim([0.0 7.0])
ylim([-0.2 0.2])
grid on 
subplot(4,2,8)
plot(Laminate_p15_0.V30.t,Laminate_p15_0.V30.Theta -mean(Laminate_p15_0.V30.Theta(2000:end)),'b',LineWidth=1.5)
xlabel('t in s')
ylabel('\Delta \theta in °')
title('\Delta V = +2.0 m/s')
xlim([0.0 7.0])
ylim([-4.5 4.5])
grid on 

Theta_max = [-min(Laminate_p15_0.V28_5.Theta(5000:end))+max(Laminate_p15_0.V28_5.Theta(5000:end)) ; ...
         -min(Laminate_p15_0.V29.Theta(5000:end))+max(Laminate_p15_0.V29.Theta(5000:end)) ; ...
         -min(Laminate_p15_0.V29_5.Theta(5000:end))+max(Laminate_p15_0.V29_5.Theta(5000:end)) ;...
         -min(Laminate_p15_0.V30.Theta(5000:end))+max(Laminate_p15_0.V30.Theta(5000:end))]


Ry_max = [-min(Laminate_p15_0.V28_5.Ry(5000:end))+max(Laminate_p15_0.V28_5.Ry(5000:end)) ; ...
         -min(Laminate_p15_0.V29.Ry(5000:end))+max(Laminate_p15_0.V29.Ry(5000:end)) ; ...
         -min(Laminate_p15_0.V29_5.Ry(5000:end))+max(Laminate_p15_0.V29_5.Ry(5000:end)) ;...
         -min(Laminate_p15_0.V30.Ry(5000:end))+max(Laminate_p15_0.V30.Ry(5000:end))]

V = [0.5 1.0 1.5 2.0];
V_exp= [0.5 1.0 2.0]
Ry_exp = [0.0 0.03 0.05]
Ry_Err_exp = [0.0 0.01 0.01]

Theta_exp = [1.0 3.0 4.0]
Theta_Err_exp = [1.0 0.5 1.0]

figure(5)
subplot(1,2,1)
plot(V,Ry_max,'-ro')
hold on
errorbar(V_exp,Ry_exp,Ry_Err_exp,'--sk',MarkerFaceColor='k')
grid on
% xlim([25 30])
% ylim([0 30])
xlabel('\Delta V in m/s')
ylabel('\Delta R_y in m')
subplot(1,2,2)
plot(V,Theta_max,'-ro')
hold on
errorbar(V_exp,Theta_exp,Theta_Err_exp,'--sk',MarkerFaceColor='k')
legend('ASWING','Exp')
grid on

% xlim([25 30])
xlabel('\Delta V in m/s')
ylabel('\Delta \theta in °')





figure(6)

plot(Laminate_p15_0.V28_5.Theta(4000:end) -0.5*(min(Laminate_p15_0.V28_5.Theta(4000:end))+max(Laminate_p15_0.V28_5.Theta(4000:end))),-Laminate_p15_0.V28_5.Ry(4000:end)+ 0.5*(min(Laminate_p15_0.V28_5.Ry(4000:end))+max(Laminate_p15_0.V28_5.Ry(4000:end))),'r')
hold on
plot(Laminate_p15_0.V29.Theta(4000:end) -0.5*(min(Laminate_p15_0.V29.Theta(4000:end))+max(Laminate_p15_0.V29.Theta(4000:end))),-Laminate_p15_0.V29.Ry(4000:end)+ 0.5*(min(Laminate_p15_0.V29.Ry(4000:end))+max(Laminate_p15_0.V29.Ry(4000:end))),'b')
hold on
plot(Laminate_p15_0.V29_5.Theta(4000:end) -0.5*(min(Laminate_p15_0.V29_5.Theta(4000:end))+max(Laminate_p15_0.V29_5.Theta(4000:end))),-Laminate_p15_0.V29_5.Ry(4000:end)+ 0.5*(min(Laminate_p15_0.V29_5.Ry(4000:end))+max(Laminate_p15_0.V29_5.Ry(4000:end))),'Color',[0 0.5 0.0])
hold on
plot(Laminate_p15_0.V30.Theta(2000:end) -0.5*(min(Laminate_p15_0.V30.Theta(2000:end))+max(Laminate_p15_0.V30.Theta(2000:end))),-Laminate_p15_0.V30.Ry(2000:end)+0.5*(min(Laminate_p15_0.V30.Ry(2000:end))+max(Laminate_p15_0.V30.Ry(2000:end))),'k')
hold on
grid on
xlabel('\Delta \theta in °')
ylabel('\Delta R_y in m')
legend('\Delta V = +0.5 m/s','\Delta V = +1.0 m/s','\Delta V = +1.5 m/s','\Delta V = +2.0 m/s')

%%



system('sh ./wing1_eig_analysis.sh')
%% ANALYSE MODALE [+90_/0]_S Beta = 1.0
Mode1 = [-2.9046154         26.243782
    -3.4613761         26.198252
    -4.0516738         26.134378
    -4.6805044         26.049403
    -5.3547693         25.940043
    -6.0835901         25.801829
    -6.8788431         25.628446
    -7.7560030         25.410789
    -8.7354763         25.135442
    -9.8446608         24.782095
    -11.121164         24.318839
    -12.617935         23.693105
    -14.411476         22.812812
    -16.614685         21.503263
    -19.395043         19.393979
    -22.991857         15.531165
    -27.710405         4.6222309
    -15.358371         0.0000000
    -11.110248         0.0000000
    -8.0558910         0.0000000
    -6.6205578         0.0000000
    -4.9580846         0.0000000
    -1.3160502         0.0000000
    1.9995450         0.0000000
    1.7713975         0.0000000    ];

Mode2 = [-5.5055904         119.01821    
    -6.4188527         118.18370    
    -7.3287287         117.20731   
    -8.2335872         116.08212  
    -9.1308467         114.79923  
    -10.016579         113.34781   
    -10.884954         111.71450    
    -11.727429         109.88287   
    -12.531559         107.83290  
    -13.279144         105.53997    
    -13.943324         102.97414    
    -14.483865         100.09941  
    -14.839605         96.874180   
    -14.916608         93.255325 
    -14.572208         89.212281    
    -13.604593         84.762843  
    -11.788436         80.032945   
    -9.0185806         75.256527  
    -5.4600986         70.525722    
    -1.4476710         65.357524 
    0.60107265         62.175860    
    2.5400718         58.028038    
    3.9150251         50.248551      
    3.8993535         45.326356    
    4.3114417         45.163115    ];

Mode3 = [-2.8954248         168.02198
    -3.3188773         167.95882
    -3.7301492         167.90016
    -4.1310763         167.84683
    -4.5233828         167.79911
    -4.9086463         167.75689
    -5.2882814         167.71967
    -5.6635369         167.68664
    -6.0354997         167.65661
    -6.4051113         167.62799
    -6.7731903         167.59865
    -7.1404528         167.56568
    -7.5075444         167.52492
    -7.8750833         167.47006
    -8.2437294         167.39110
    -8.6143686         167.27106
    -8.9886033         167.07909
    -9.3704259         166.75386
    -9.7731021         166.15802
    -10.257580         164.91997
    -10.619483         163.72767
    -11.305408         161.57325
    -13.949642         155.55910
    -16.855417         147.92933
    -17.200942         145.93817   ];


% %%
% Eigen = readtable("wing1_eigen.txt","NumHeaderLines",3)
figure(4)
subplot(1,3,1)
plot(Mode1(:,1),Mode1(:,2),'-rs',MarkerFaceColor='r')
hold on
plot(Mode2(:,1),Mode2(:,2),'-bs',MarkerFaceColor='b')
hold on
plot(Mode3(:,1),Mode3(:,2),'-kv',MarkerFaceColor='k')
% legend('1rst bending mode','1rst Torsion mode','2nd Bending mode')
sgrid
ylim([0.1 180])
xlabel('Re(\lambda) in rad/s')
ylabel('Im(\lambda) in rad/s')


V = [6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 25.5 26 26.5 27 27.35];

[mode1_pole mode1_damp mode1_freq ]  = damp(Mode1(:,1)+j*Mode1(:,2));
[mode2_pole mode2_damp mode2_freq ]  = damp(Mode2(:,1)+j*Mode2(:,2));
[mode3_pole mode3_damp mode3_freq ]  = damp(Mode3(:,1)+j*Mode3(:,2));
mode1_freq = sqrt(Mode1(:,1).^2+Mode1(:,2).^2)/(2*pi);
mode2_freq = sqrt(Mode2(:,1).^2+Mode2(:,2).^2)/(2*pi);
mode3_freq = sqrt(Mode3(:,1).^2+Mode3(:,2).^2)/(2*pi);

subplot(1,3,2)
plot(V,mode1_damp,'-ro',MarkerFaceColor='r',MarkerSize=10)
hold on
plot(V,mode2_damp,'-bs',MarkerFaceColor='b',MarkerSize=10)
hold on
plot(V,mode3_damp,'-kv',MarkerFaceColor='k',MarkerSize=10)
plot([0 30],[0.0 0.0],'--r','LineWidth',2.0)
ylim([-0.3 1.0])
xlim([6 30])
legend('1rst bending','1rst Torsion','2nd bending ')
grid on 
xlabel('V in m/s')
ylabel('\zeta_\lambda')

subplot(1,3,3)
plot(V,mode1_freq,'-ro',MarkerFaceColor='r',MarkerSize=10)
hold on
plot(V,mode2_freq,'-bs',MarkerFaceColor='b',MarkerSize=10)
hold on
plot(V,mode3_freq,'-kv',MarkerFaceColor='k',MarkerSize=10)
xlim([6 30])
% legend('1rst bending mode','1rst Torsion mode','2nd Bending mode')
grid on 
xlabel('V in m/s')
ylabel('f_\lambda in Hz')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANALYSE MODAL [+15_2/0]_S Beta = 0.0

V1 = 16:1.0:36;
V2 = 40:10:90;
V3 = 91:1:100;

V = [V1 V2 V3];

Mode1 = [-10.200026         31.518488
    -11.125235         32.615256
    -12.128417         33.813192
    -13.226699         35.123770
    -14.442894         36.561246
    -15.808337         38.143251
    -17.367608         39.891140
    -19.186726         41.829295
    -24.073639         46.348554
    -27.560900         48.859408
    -32.152922         51.210755
    -37.934967         52.736826
    -44.369555         52.850967
    -50.790017         51.598080
    -56.928684         49.274980
    -62.771133         46.051664
    -68.372104         41.925409
    -73.792765         36.712251
    -79.087760         29.915232
    -84.305460         20.003731
    -59.985073         0.0000000
    -49.846939         0.0000000
    -48.411053         0.0000000
    -49.018772         0.0000000
    -50.478870         0.0000000
    -52.364658         0.0000000
    -52.567322         0.0000000
    -52.771812         0.0000000
    -52.977962         0.0000000
    -53.185608         0.0000000
    -53.394596         0.0000000
    -53.604778         0.0000000
    -53.815998         0.0000000
    -54.028107         0.0000000
    -54.240959         0.0000000
    -54.454414         0.0000000   
     -54.64414         0.0000000 ];

Mode2 = [ -10.228639         135.95875
    -10.988541         134.19178
    -11.715807         132.19780
    -12.388174         129.95658
    -12.978265         127.44579
    -13.451081         124.63985
    -13.759412         121.50889
    -13.835637         118.01884
    -13.577082         114.13528
    -12.820890         109.84036
    -11.311576         105.19029
    -8.7273160         100.46507
    -4.9850464         96.301777
    -0.62508294         93.249584
    3.6824502         91.213343
    7.6656089         89.826496
    11.304828         88.817669
    14.648438         88.032041
    17.749621         87.383271
    20.652798         86.821285
    23.392816         86.315515
    33.182492         84.546718
    53.276299         80.078267
    70.515421         74.283248
    86.408097         66.418871
    101.53775         55.474350
    116.18617         38.819775
    117.63111         36.559858
    119.07292         34.114789
    120.51170         31.441285   
    121.94755         28.474853
    123.38055         25.111801
    124.81081         21.163628
    126.23838         16.208052
    127.66337         8.6597949
    139.82053         0.0000000
    148.05528         0.0000000     ];


Mode3 = [  -11.674732         164.13156
    -12.091006         163.94944
    -12.486128         163.80889
    -12.866812         163.71117
    -13.239192         163.65603
    -13.608521         163.64215
    -13.979068         163.66750
    -14.354152         163.72972
    -14.736257         163.82638
    -15.127189         163.95514
    -15.528219         164.11387
    -15.940225         164.30066
    -16.363803         164.51389
    -16.799351         164.75217
    -17.247141         165.01437
    -17.707361         165.29955
    -18.180166         165.60697
    -18.665687         165.93605
    -19.164065         166.28637
    -19.675458         166.65764
    -20.200051         167.04966
    -22.435509         168.82499
    -29.148251         174.80956
    -38.256378         183.50354
    -52.259506         195.79798
    -77.811313         209.48562
    -114.56681         211.07814
    -118.24157         210.41703
    -121.88140         209.64553
    -125.48466         208.77214
    -129.05077         207.80436
    -132.57981         206.74870
    -136.07238         205.61081
    -139.52947         204.39554
    -142.95221         203.10702
    -146.34195         201.74877
    -149.70003         200.32376    ];

Mode4 = [  -8.5072979         400.45851
    -8.9708492         400.14325
    -9.4269394         399.81268
    -10.317273         399.10521
    -10.751766         398.72790
    -11.179288         398.33452
    -11.599930         397.92473
    -12.013765         397.49813
    -12.420849         397.05429
    -12.821217         396.59270
    -13.214881         396.11283
    -13.601836         395.61408
    -13.982049         395.09580
    -14.355461         394.55732
    -14.721992         393.99790
    -15.081527         393.41676
    -15.081527         393.41676  
    -15.779026         392.18599
    -16.116614         391.53457
    -16.446455         390.85787
    -17.682216         387.87754
    -20.009441         378.08655
    -20.434652         363.76194
    -16.391721         343.25092
    -1.0936508         318.18874
    25.270475         301.69811
    27.903401         300.66510
    30.501233         299.70422
    33.062404         298.80668
    35.586372         297.96463
    38.073264         297.17122
    40.523735         296.42045
    42.938743         295.70704
    45.319489         295.02646
    47.667288         294.37470
    49.983501         293.74832  
    49.983501         293.74832  ];


figure(5)
subplot(1,3,1)
plot(Mode1(:,1),Mode1(:,2),'-ro',MarkerFaceColor='r')
hold on
plot(Mode2(:,1),Mode2(:,2),'-bs',MarkerFaceColor='b')
hold on
plot(Mode3(:,1),Mode3(:,2),'-kv',MarkerFaceColor='k')
hold on
plot(Mode4(:,1),Mode4(:,2),'-d','color',[0.0 0.5 0.0],MarkerFaceColor=[0.0 0.5 0.0])
% legend('1rst bending mode','1rst Torsion mode','2nd Bending mode')
sgrid
% ylim([0.1 180])
xlim([-150 150])
xlabel('Re(\lambda) in rad/s')
ylabel('Im(\lambda) in rad/s')



[mode1_pole mode1_damp mode1_freq ]  = damp(Mode1(:,1)+j*Mode1(:,2));
[mode2_pole mode2_damp mode2_freq ]  = damp(Mode2(:,1)+j*Mode2(:,2));
[mode3_pole mode3_damp mode3_freq ]  = damp(Mode3(:,1)+j*Mode3(:,2));
[mode4_pole mode4_damp mode3_freq ]  = damp(Mode4(:,1)+j*Mode4(:,2));

mode1_freq = sqrt(Mode1(:,1).^2+Mode1(:,2).^2)/(2*pi);
mode2_freq = sqrt(Mode2(:,1).^2+Mode2(:,2).^2)/(2*pi);
mode3_freq = sqrt(Mode3(:,1).^2+Mode3(:,2).^2)/(2*pi);
mode4_freq = sqrt(Mode4(:,1).^2+Mode4(:,2).^2)/(2*pi);

subplot(1,3,2)
plot(V,mode1_damp,'-ro',MarkerFaceColor='r')
hold on
plot(V,mode2_damp,'-bs',MarkerFaceColor='b')
hold on
plot(V,mode3_damp,'-kv',MarkerFaceColor='k')
hold on
plot(V,mode4_damp,'-d','Color',[0.0 0.5 0.0],MarkerFaceColor=[0 0.5 0.0])
plot([0 100],[0.0 0.0],'--r','LineWidth',2.0)
% ylim([-0.3 1.0])
% xlim([6 30])

grid on 
xlabel('V in m/s')
ylabel('\zeta_\lambda')

subplot(1,3,3)
plot(V,mode1_freq,'-ro',MarkerFaceColor='r')
hold on
plot(V,mode2_freq,'-bs',MarkerFaceColor='b')
hold on
plot(V,mode3_freq,'-kv',MarkerFaceColor='k')
hold on
plot(V,mode4_freq,'-d','Color',[0.0 0.5 0.0],MarkerFaceColor=[0 0.5 0.0])
legend('1rst bending','1rst Torsion','2nd bending','3rd torsion')
% xlim([6 30])
% legend('1rst bending mode','1rst Torsion mode','2nd Bending mode')
grid on 
xlabel('V in m/s')
ylabel('f_\lambda in Hz')


%% ANALYSE MODAL [-15_2/0]_S Beta = 0.0

V1 = 7:1.0:15;
V2 = 15.25:0.25:16.75;
V3 = 17:1:27;

V = [V1 V2 V3];

Mode1 = [-2.8310344         21.640585
    -3.2859841         20.888406
    -3.7570682         19.980631
    -4.2462825         18.888359
    -4.7561153         17.568721
    -5.2894782         15.954161
    -5.8496980         13.927207
    -6.4405426         11.244906
    -7.0662722         7.1679195
    -7.2287080         5.5992985
    -7.3937052         3.2859764
    -4.3524451         0.0000000
    -2.0797088         0.0000000
    -0.54551941         0.0000000
    0.69153237         0.0000000
    1.7574139         0.0000000
    2.7091908         0.0000000
    5.8567405         0.0000000
    8.4290371         0.0000000
    10.695039         0.0000000
    12.771001         0.0000000
    14.719353         0.0000000
    16.578093         0.0000000
    18.372379         0.0000000
    20.119913         0.0000000
    21.833757         0.0000000
    23.523935         0.0000000    ];

Mode2 = [  -5.0047538         145.49989
    -5.7404521         145.52397
    -6.5131461         145.58183
    -7.3431751         145.68031
    -8.2605212         145.82494
    -9.3115055         146.01411
    -10.565618         146.22069
    -12.097995         146.35006
    -13.894716         146.22863
    -14.367663         146.14249
    -14.843815         146.03318
    -15.320477         145.90151
    -15.795448         145.74868
    -16.267034         145.57611
    -16.733991         145.38527
    -17.195465         145.17756
    -17.650879         144.95429
    -19.406995         143.92692
    -21.056973         142.72091
    -22.604657         141.36595
    -24.053131         139.87792
    -25.402214         138.26573
    -26.648253         136.53501
    -27.784371         134.69029
    -28.800819         132.73648
    -29.685316         130.68013
    -30.423622         128.53056    ];


Mode3 = [  -4.3340339         166.19998
    -4.8573232         165.40000
    -5.3298135         164.47454
    -5.7323387         163.41562
    -6.0355705         162.21594
    -6.1932483         160.87482
    -6.1353221         159.41669
    -5.7854217         157.93317
    -5.1555623         156.59464
    -4.9716003         156.29885
    -4.7832403         156.01936
    -4.5931319         155.75530
    -4.4034222         155.50540
    -4.2157453         155.26821
    -4.0312776         155.04219
    -3.8508193         154.82588
    -3.6748703         154.61792
    -3.0196118         153.84722
    -2.4391982         153.13551
    -1.9234437         152.44984
    -1.4617192         151.77140
    -1.0453042         151.08889
    -0.66745451         150.39519
    -0.32301987         149.68549
    -0.80658929E-02     148.95643
    0.28044301         148.20555
    0.54485339         147.43096   ];



figure(6)
subplot(1,3,1)
plot(Mode1(:,1),Mode1(:,2),'-ro',MarkerFaceColor='r',LineWidth=1.0)
hold on
plot(Mode2(:,1),Mode2(:,2),'-bs',MarkerFaceColor='b',LineWidth=1.0)
hold on
plot(Mode3(:,1),Mode3(:,2),'-k',MarkerFaceColor='k',LineWidth=1.0)
% hold on
% plot(Mode4(:,1),Mode4(:,2),'-d','color',[0.0 0.5 0.0],MarkerFaceColor=[0.0 0.5 0.0])
% legend('1rst bending mode','1rst Torsion mode','2nd Bending mode')
sgrid
% ylim([0.1 180])
xlim([-30 5])
xlabel('Re(\lambda) in rad/s')
ylabel('Im(\lambda) in rad/s')



[mode1_pole mode1_damp mode1_freq ]  = damp(Mode1(:,1)+j*Mode1(:,2));
[mode2_pole mode2_damp mode2_freq ]  = damp(Mode2(:,1)+j*Mode2(:,2));
[mode3_pole mode3_damp mode3_freq ]  = damp(Mode3(:,1)+j*Mode3(:,2));
% [mode4_pole mode4_damp mode3_freq ]  = damp(Mode4(:,1)+j*Mode4(:,2));

mode1_freq = sqrt(Mode1(:,1).^2+Mode1(:,2).^2)/(2*pi);
mode2_freq = sqrt(Mode2(:,1).^2+Mode2(:,2).^2)/(2*pi);
mode3_freq = sqrt(Mode3(:,1).^2+Mode3(:,2).^2)/(2*pi);
% mode4_freq = sqrt(Mode4(:,1).^2+Mode4(:,2).^2)/(2*pi);

subplot(1,3,2)
plot(V,mode1_damp,'-ro',MarkerFaceColor='r',LineWidth=1.0)
hold on
plot(V,mode2_damp,'-bs',MarkerFaceColor='b',LineWidth=1.0)
hold on
plot(V,mode3_damp,'-kv',MarkerFaceColor='k',LineWidth=1.0)
% hold on
% plot(V,mode4_damp,'-d','Color',[0.0 0.5 0.0],MarkerFaceColor=[0 0.5 0.0])
plot([7 27],[0.0 0.0],'--r','LineWidth',2.0)
% ylim([-0.3 1.0])
% xlim([6 30])

grid on 
xlabel('V in m/s')
ylabel('\zeta_\lambda')

subplot(1,3,3)
plot(V,mode1_freq,'-ro',MarkerFaceColor='r',LineWidth=1.0)
hold on
plot(V,mode2_freq,'-bs',MarkerFaceColor='b',LineWidth=1.0)
hold on
plot(V,mode3_freq,'-kv',MarkerFaceColor='k',LineWidth=1.0)
% hold on
% plot(V,mode4_freq,'-d','Color',[0.0 0.5 0.0],MarkerFaceColor=[0 0.5 0.0])
legend('1rst bending','2nd mode','3rd mode')
% xlim([6 30])
% legend('1rst bending mode','1rst Torsion mode','2nd Bending mode')
grid on 
xlabel('V in m/s')
ylabel('f_\lambda in Hz')
