clear all
close all
clc




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANCHORED COAST ANGLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ANCHORED_EXP = readtable('Exp_Data/Anchored_Coast_Angle.csv');
V = [15 20 25 30];
ASW_F10_R = -[34.7 21.7 13 7.45];
ASW_F10_L = -[36.9 27.4 21.1 17.1];
ASW_F30_R = -[15.7 8.57 4.9 2.92];
ASW_F30_L = -[16.7 10.8 7.6 5.89];

figure(1)
plot(V,ANCHORED_EXP.Var2,'ro',MarkerSize=8,LineWidth=1.5)
hold on 
plot(V,ANCHORED_EXP.Var4,'rd',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
hold on 
plot(V,ANCHORED_EXP.Var6,'bo',MarkerSize=8,LineWidth=1.5)
hold on 
plot(V,ANCHORED_EXP.Var8,'bd',MarkerFaceColor='b',MarkerSize=8,LineWidth=1.5)
hold on
plot(V,ASW_F10_R,'--r',MarkerSize=8,LineWidth=1.5)
hold on 
plot(V,ASW_F10_L,'-r',MarkerSize=8,LineWidth=1.5)
hold on
plot(V,ASW_F30_R,'--b',MarkerSize=8,LineWidth=1.5)
hold on 
plot(V,ASW_F30_L,'-b',MarkerSize=8,LineWidth=1.5)
hold on
plot(V,ANCHORED_EXP.Var10,'bo',MarkerSize=8,LineWidth=1.5)
hold on 
plot(V,ANCHORED_EXP.Var12,'bd',MarkerFaceColor='b',MarkerSize=8,LineWidth=1.5)
grid on
xlabel('Velocity in m/s')
ylabel('\theta Fold angle in deg')
legend('Exp F10 R',' Exp F10 L','Exp F30 R',' Exp F30 L','ASW','ASW','ASW','ASW','Numcolumns',2)
ylim([-40 0])
set(gca,"FontSize",14)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ROLL RATE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ASW_ROLL_FIXED_DF7 = [37.50 50.0 62.5 75.01]







%%
% system('cd FFWT_REMOVED/')
% [in1 in2] = system('sh ./FFWT_REMOVED_V15_ROLL_DF7.sh')
% % [in1 in2] = system('sh ./FFWT_REMOVED_V15_ROLL_DF7.sh')
% [in1 in2] = system('cd ..')
%%









I_removed = 1.77e-2;
ASW_M_ROLL_DF7 = [0.3872E-01 0.1276 0.2318  0.3659 ]
ASW_M_ROLL_DF14 = [0.7744E-01 0.2553   0.4638  0.7321 ]
ASW_M_ROLL_DF21 = [0.2748 0.4886 0.7634  1.099 ]


ASW_ROLL_REMOVED_DF7 = sqrt(ASW_M_ROLL_DF7/I_removed)*180/pi;
ASW_ROLL_REMOVED_DF14 = sqrt(ASW_M_ROLL_DF14/I_removed)*180/pi;
ASW_ROLL_REMOVED_DF21 = sqrt(ASW_M_ROLL_DF21/I_removed)*180/pi;


V = [15 20 25 30];


load('FFWT_REMOVED/FFWT_REMOVED.mat')
load('FFWT_FIXED/FFWT_FIXED.mat')
load('FFWT30/FFWT_30.mat')
load('FFWT10/FFWT_10.mat')

ROLL_F7_EXP = readtable('Exp_Data/Mean_Roll_Rate_delta_F7.csv',NumHeaderLines=2);
ROLL_F14_EXP = readtable('Exp_Data/Mean_Roll_Rate_delta_F14.csv',NumHeaderLines=2);
ROLL_F21_EXP = readtable('Exp_Data/Mean_Roll_Rate_delta_F21.csv',NumHeaderLines=2);


% deltaF = 7 
figure(2)
plot(V,ROLL_F7_EXP.Var2,'ro','MarkerFaceColor','r',MarkerSize=8)
hold on
plot(V,ROLL_F7_EXP.Var4,'bs','MarkerFaceColor','b',MarkerSize=8)
hold on
plot(V,ROLL_F7_EXP.Var6,'kd','MarkerFaceColor','k',MarkerSize=8)
hold on
plot(V,ROLL_F7_EXP.Var8,'*','color',[0 0.5 0.0],MarkerSize=8)
hold on
plot(V,FFWT_REMOVED_DF7,'--r',LineWidth=2.0)
hold on
plot(V,FFWT_FIXED_DF7,'-b',LineWidth=2.0)
hold on
plot(V,FFWT_10_DF7,':k',LineWidth=2.0)
hold on
plot(V,FFWT_30_DF7,'-.','color',[0 0.5 0.0],LineWidth=2.0)
xlabel('V in m/s')
ylabel('Roll rate in deg/s')
grid on
legend('Exp removed','Exp fixed','Exp free 10°','Exp free 30°','ASWING removed','ASWING fixed','ASWING free 10°','ASWING free 30°')
ylim([0 500])
set(gca,"FontSize",14)
% dF = 14
figure(3)
plot(V,ROLL_F14_EXP.Var2,'ro','MarkerFaceColor','r',MarkerSize=8)
hold on
plot(V,ROLL_F14_EXP.Var4,'bs','MarkerFaceColor','b',MarkerSize=8)
hold on
plot(V,ROLL_F14_EXP.Var6,'kd','MarkerFaceColor','k',MarkerSize=8)
hold on
plot(V,ROLL_F14_EXP.Var8,'*','color',[0 0.5 0.0],MarkerSize=8)
hold on
plot(V,FFWT_REMOVED_DF14,'--r',LineWidth=2.0)
hold on
plot(V,FFWT_FIXED_DF14,'-b',LineWidth=2.0)
hold on
plot(V,FFWT_10_DF14,':k',LineWidth=2.0)
hold on
plot(V,FFWT_30_DF14,'-.','color',[0 0.5 0.0],LineWidth=2.0)
xlabel('V in m/s')
ylabel('Roll rate in deg/s')
grid on
ylim([0 500])
set(gca,"FontSize",14)


% dF = 21
figure(4)
plot(V,ROLL_F21_EXP.Var2,'ro','MarkerFaceColor','r',MarkerSize=8)
hold on
plot(V,ROLL_F21_EXP.Var4,'bs','MarkerFaceColor','b',MarkerSize=8)
hold on
plot(V,ROLL_F21_EXP.Var6,'kd','MarkerFaceColor','k',MarkerSize=8)
hold on
plot(V,ROLL_F21_EXP.Var8,'*','color',[0 0.5 0.0],MarkerSize=8)
hold on
plot(V,FFWT_FIXED_DF21,'-b',LineWidth=2.0)
hold on
plot(V,FFWT_REMOVED_DF21,'--r',LineWidth=2.0)
hold on
plot(V,FFWT_10_DF21,':k',LineWidth=2.0)
hold on
plot(V,FFWT_30_DF21,'-.','color',[0 0.5 0.0],LineWidth=2.0)
xlabel('V in m/s')
ylabel('Roll rate in deg/s')
grid on
ylim([0 500])
set(gca,"FontSize",14)


%%


Exp_Deltap_DF14_V_30_min = [-18 -9 -5.0 -2.5]
Exp_Deltap_DF14_V_30_max = [20 10 7.5 3.0]
Exp_Deltap_DF14_V_10_min = [-18 -18 -10 -5]
Exp_Deltap_DF14_V_10_max = [21 15 10 5]
figure(5)
hold on
plot(V,FFWT_30_DFR14_P_min,'-rs',MarkerSize=8,LineWidth=1.5)
hold on
plot(V,FFWT_30_DFR21_P_min,'-.ro',MarkerSize=8,LineWidth=1.5)
hold on
hold on
plot(V,FFWT_30_DFR14_P_max,'--bs',MarkerSize=8,LineWidth=1.5)
hold on
plot(V,FFWT_30_DFR21_P_max,':bo',MarkerSize=8,LineWidth=1.5)
hold on
plot(V,Exp_Deltap_DF14_V_30_min,'rs',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
hold on
plot(V,Exp_Deltap_DF14_V_30_max,'bs',MarkerFaceColor='b',MarkerSize=8,LineWidth=1.5)
hold on
plot(20,-5,'ro',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
hold on
plot(20,5,'bo',MarkerFaceColor='b',MarkerSize=8,LineWidth=1.5)
xlabel('V in m/s')
ylabel('\Delta p in %')
ylim([-50 60])
grid on
legend('\delta_F = 14° lower ','\delta_F = 21° lower ','\delta_F = 14° upper','\delta_F = 21° upper','Markers = Exp')
set(gca,"FontSize",14)



figure(6)
plot(V,FFWT_10_DFR14_P_min,'-rs',MarkerSize=8,LineWidth=1.5)
hold on
plot(V,FFWT_10_DFR21_P_min,'-.ro',MarkerSize=8,LineWidth=1.5)
hold on
hold on
plot(V,FFWT_10_DFR14_P_max,'--bs',MarkerSize=8,LineWidth=1.5)
hold on
plot(V,FFWT_10_DFR21_P_max,':bo',MarkerSize=8,LineWidth=1.5)
hold on
plot(V,Exp_Deltap_DF14_V_10_min,'rs',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
hold on
plot(V,Exp_Deltap_DF14_V_10_max,'bs',MarkerFaceColor='b',MarkerSize=8,LineWidth=1.5)
hold on
plot(20,-9.5,'ro',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
hold on
plot(20,9,'bo',MarkerFaceColor='b',MarkerSize=8,LineWidth=1.5)
xlabel('V in m/s')
ylabel('\Delta p in %')
ylim([-50 60])
grid on
legend('\delta_F = 14° lower','\delta_F = 21° lower','\delta_F = 14° upper','\delta_F = 21° upper','Exp')
set(gca,"FontSize",14)