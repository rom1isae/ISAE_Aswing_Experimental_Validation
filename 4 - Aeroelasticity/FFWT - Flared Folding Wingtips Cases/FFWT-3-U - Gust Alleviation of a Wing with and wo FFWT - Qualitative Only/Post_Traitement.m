clear all
close all
clc



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SIMULATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 
% system('sh ./Free_Sweep_10_A-10.sh')
% system('sh ./Free_Sweep_10_A-5.sh')
% system('sh ./Free_Sweep_10_A0.sh')
% system('sh ./Free_Sweep_10_A5.sh')
% system('sh ./Free_Sweep_10_A10.sh')
% 
% system('sh ./Sprung_Sweep_10_A-5.sh')
% system('sh ./Sprung_Sweep_10_A0.sh')
% system('sh ./Sprung_Sweep_10_A5.sh')
% system('sh ./Sprung_Sweep_10_A10.sh')
% 
% system('sh ./Stiff_Sweep_10_A-5.sh')
% system('sh ./Stiff_Sweep_10_A0.sh')
% system('sh ./Stiff_Sweep_10_A5.sh')
% system('sh ./Stiff_Sweep_10_A10.sh')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%ANALYSE DONNEES


Free_Sweep_10_A_m5 =  readtable("Free_Sweep_10_A-5.txt",NumHeaderLines=3);
Free_Sweep_10_A_0 =  readtable("Free_Sweep_10_A0.txt",NumHeaderLines=3);
Free_Sweep_10_A_5 =  readtable("Free_Sweep_10_A5.txt",NumHeaderLines=3);
Free_Sweep_10_A_10 =  readtable("Free_Sweep_10_A10.txt",NumHeaderLines=3);

qS = 0.5300*247.6;

Free_Sweep_10_Delta_CL_sup = [max(Free_Sweep_10_A_m5.Var5)-Free_Sweep_10_A_m5.Var5(1) ...
                              max(Free_Sweep_10_A_0.Var5)-Free_Sweep_10_A_0.Var5(1) ...
                              max(Free_Sweep_10_A_5.Var5)-Free_Sweep_10_A_5.Var5(1) ...
                              max(Free_Sweep_10_A_10.Var5)-Free_Sweep_10_A_10.Var5(1)];

Free_Sweep_10_Delta_CL_inf = [min(Free_Sweep_10_A_m5.Var5)-Free_Sweep_10_A_m5.Var5(1) ...
                              min(Free_Sweep_10_A_0.Var5)-Free_Sweep_10_A_0.Var5(1) ...
                              min(Free_Sweep_10_A_5.Var5)-Free_Sweep_10_A_5.Var5(1) ...
                              min(Free_Sweep_10_A_10.Var5)-Free_Sweep_10_A_10.Var5(1)];

Free_Sweep_10_Delta_M_sup = [max(Free_Sweep_10_A_m5.Var7)-Free_Sweep_10_A_m5.Var7(1) ...
                              max(Free_Sweep_10_A_0.Var7)-Free_Sweep_10_A_0.Var7(1) ...
                              max(Free_Sweep_10_A_5.Var7)-Free_Sweep_10_A_5.Var7(1) ...
                              max(Free_Sweep_10_A_10.Var7)-Free_Sweep_10_A_10.Var7(1)]/qS ;

Free_Sweep_10_Delta_M_inf = [min(Free_Sweep_10_A_m5.Var7)-Free_Sweep_10_A_m5.Var7(1) ...
                              min(Free_Sweep_10_A_0.Var7)-Free_Sweep_10_A_0.Var7(1) ...
                              min(Free_Sweep_10_A_5.Var7)-Free_Sweep_10_A_5.Var7(1) ...
                              min(Free_Sweep_10_A_10.Var7)-Free_Sweep_10_A_10.Var7(1)]/qS ;


Free_Sweep_10_Delta_phi_sup = [max(Free_Sweep_10_A_m5.Var8)-Free_Sweep_10_A_m5.Var8(1) ...
                              max(Free_Sweep_10_A_0.Var8)-Free_Sweep_10_A_0.Var8(1) ...
                              max(Free_Sweep_10_A_5.Var8)-Free_Sweep_10_A_5.Var8(1) ...
                              max(Free_Sweep_10_A_10.Var8)-Free_Sweep_10_A_10.Var8(1)];

Free_Sweep_10_Delta_phi_inf = [min(Free_Sweep_10_A_m5.Var8)-Free_Sweep_10_A_m5.Var8(1) ...
                              min(Free_Sweep_10_A_0.Var8)-Free_Sweep_10_A_0.Var8(1) ...
                              min(Free_Sweep_10_A_5.Var8)-Free_Sweep_10_A_5.Var8(1) ...
                              min(Free_Sweep_10_A_10.Var8)-Free_Sweep_10_A_10.Var8(1)];


Sprung_Sweep_10_A_m5 =  readtable("Sprung_Sweep_10_A-5.txt",NumHeaderLines=3);
Sprung_Sweep_10_A_0 =  readtable("Sprung_Sweep_10_A0.txt",NumHeaderLines=3);
Sprung_Sweep_10_A_5 =  readtable("Sprung_Sweep_10_A5.txt",NumHeaderLines=3);
Sprung_Sweep_10_A_10 =  readtable("Sprung_Sweep_10_A10.txt",NumHeaderLines=3);


Sprung_Sweep_10_Delta_CL_sup = [max(Sprung_Sweep_10_A_m5.Var5)-Sprung_Sweep_10_A_m5.Var5(1) ...
                              max(Sprung_Sweep_10_A_0.Var5)-Sprung_Sweep_10_A_0.Var5(1) ...
                              max(Sprung_Sweep_10_A_5.Var5)-Sprung_Sweep_10_A_5.Var5(1) ...
                              max(Sprung_Sweep_10_A_10.Var5)-Sprung_Sweep_10_A_10.Var5(1)];

Sprung_Sweep_10_Delta_CL_inf = [min(Sprung_Sweep_10_A_m5.Var5)-Sprung_Sweep_10_A_m5.Var5(1) ...
                              min(Sprung_Sweep_10_A_0.Var5)-Sprung_Sweep_10_A_0.Var5(1) ...
                              min(Sprung_Sweep_10_A_5.Var5)-Sprung_Sweep_10_A_5.Var5(1) ...
                              min(Sprung_Sweep_10_A_10.Var5)-Sprung_Sweep_10_A_10.Var5(1)];

Sprung_Sweep_10_Delta_M_sup = [max(Sprung_Sweep_10_A_m5.Var7)-Sprung_Sweep_10_A_m5.Var7(1) ...
                              max(Sprung_Sweep_10_A_0.Var7)-Sprung_Sweep_10_A_0.Var7(1) ...
                              max(Sprung_Sweep_10_A_5.Var7)-Sprung_Sweep_10_A_5.Var7(1) ...
                              max(Sprung_Sweep_10_A_10.Var7)-Sprung_Sweep_10_A_10.Var7(1)]/qS;

Sprung_Sweep_10_Delta_M_inf = [min(Sprung_Sweep_10_A_m5.Var7)-Sprung_Sweep_10_A_m5.Var7(1) ...
                              min(Sprung_Sweep_10_A_0.Var7)-Sprung_Sweep_10_A_0.Var7(1) ...
                              min(Sprung_Sweep_10_A_5.Var7)-Sprung_Sweep_10_A_5.Var7(1) ...
                              min(Sprung_Sweep_10_A_10.Var7)-Sprung_Sweep_10_A_10.Var7(1)]/qS;


Sprung_Sweep_10_Delta_phi_sup = [max(Sprung_Sweep_10_A_m5.Var8)-Sprung_Sweep_10_A_m5.Var8(1) ...
                              max(Sprung_Sweep_10_A_0.Var8)-Sprung_Sweep_10_A_0.Var8(1) ...
                              max(Sprung_Sweep_10_A_5.Var8)-Sprung_Sweep_10_A_5.Var8(1) ...
                              max(Sprung_Sweep_10_A_10.Var8)-Sprung_Sweep_10_A_10.Var8(1)];

Sprung_Sweep_10_Delta_phi_inf = [min(Sprung_Sweep_10_A_m5.Var8)-Sprung_Sweep_10_A_m5.Var8(1) ...
                              min(Sprung_Sweep_10_A_0.Var8)-Sprung_Sweep_10_A_0.Var8(1) ...
                              min(Sprung_Sweep_10_A_5.Var8)-Sprung_Sweep_10_A_5.Var8(1) ...
                              min(Sprung_Sweep_10_A_10.Var8)-Sprung_Sweep_10_A_10.Var8(1)];

Stiff_Sweep_10_A_m5 =  readtable("Stiff_Sweep_10_A-5.txt",NumHeaderLines=3);
Stiff_Sweep_10_A_0 =  readtable("Stiff_Sweep_10_A0.txt",NumHeaderLines=3);
Stiff_Sweep_10_A_5 =  readtable("Stiff_Sweep_10_A5.txt",NumHeaderLines=3);
Stiff_Sweep_10_A_10 =  readtable("Stiff_Sweep_10_A10.txt",NumHeaderLines=3);


Stiff_Sweep_10_Delta_CL_sup = [max(Stiff_Sweep_10_A_m5.Var5)-Stiff_Sweep_10_A_m5.Var5(1) ...
                              max(Stiff_Sweep_10_A_0.Var5)-Stiff_Sweep_10_A_0.Var5(1) ...
                              max(Stiff_Sweep_10_A_5.Var5)-Stiff_Sweep_10_A_5.Var5(1) ...
                              max(Stiff_Sweep_10_A_10.Var5)-Stiff_Sweep_10_A_10.Var5(1)];

Stiff_Sweep_10_Delta_CL_inf = [min(Stiff_Sweep_10_A_m5.Var5)-Stiff_Sweep_10_A_m5.Var5(1) ...
                              min(Stiff_Sweep_10_A_0.Var5)-Stiff_Sweep_10_A_0.Var5(1) ...
                              min(Stiff_Sweep_10_A_5.Var5)-Stiff_Sweep_10_A_5.Var5(1) ...
                              min(Stiff_Sweep_10_A_10.Var5)-Stiff_Sweep_10_A_10.Var5(1)];

Stiff_Sweep_10_Delta_M_sup = [max(Stiff_Sweep_10_A_m5.Var7)-Stiff_Sweep_10_A_m5.Var7(1) ...
                              max(Stiff_Sweep_10_A_0.Var7)-Stiff_Sweep_10_A_0.Var7(1) ...
                              max(Stiff_Sweep_10_A_5.Var7)-Stiff_Sweep_10_A_5.Var7(1) ...
                              max(Stiff_Sweep_10_A_10.Var7)-Stiff_Sweep_10_A_10.Var7(1)]/qS;

Stiff_Sweep_10_Delta_M_inf = [min(Stiff_Sweep_10_A_m5.Var7)-Stiff_Sweep_10_A_m5.Var7(1) ...
                              min(Stiff_Sweep_10_A_0.Var7)-Stiff_Sweep_10_A_0.Var7(1) ...
                              min(Stiff_Sweep_10_A_5.Var7)-Stiff_Sweep_10_A_5.Var7(1) ...
                              min(Stiff_Sweep_10_A_10.Var7)-Stiff_Sweep_10_A_10.Var7(1)]/qS ;


Stiff_Sweep_10_Delta_phi_sup = [max(Stiff_Sweep_10_A_m5.Var8)-Stiff_Sweep_10_A_m5.Var8(1) ...
                              max(Stiff_Sweep_10_A_0.Var8)-Stiff_Sweep_10_A_0.Var8(1) ...
                              max(Stiff_Sweep_10_A_5.Var8)-Stiff_Sweep_10_A_5.Var8(1) ...
                              max(Stiff_Sweep_10_A_10.Var8)-Stiff_Sweep_10_A_10.Var8(1)];

Stiff_Sweep_10_Delta_phi_inf = [min(Stiff_Sweep_10_A_m5.Var8)-Stiff_Sweep_10_A_m5.Var8(1) ...
                              min(Stiff_Sweep_10_A_0.Var8)-Stiff_Sweep_10_A_0.Var8(1) ...
                              min(Stiff_Sweep_10_A_5.Var8)-Stiff_Sweep_10_A_5.Var8(1) ...
                              min(Stiff_Sweep_10_A_10.Var8)-Stiff_Sweep_10_A_10.Var8(1)];

alpha = [-5 0 5 10];
figure(1)
plot(alpha,Free_Sweep_10_Delta_CL_sup,'--rd',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Sprung_Sweep_10_Delta_CL_sup,'--s','color',[0 0.5 0],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Stiff_Sweep_10_Delta_CL_sup,'--o','color',[0 0 1],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Free_Sweep_10_Delta_CL_inf,'-rd',MarkerFaceColor='r',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Sprung_Sweep_10_Delta_CL_inf,'-s','color',[0 0.5 0],MarkerFaceColor=[0 0.5 0],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Stiff_Sweep_10_Delta_CL_inf,'-o','color',[0 0 1],MarkerFaceColor='b',LineWidth=1.5,MarkerSize=8)
xlabel('\alpha in deg')
ylabel('\Delta C_L')
legend('Free :     max','Sprung : max','Stiff :      max','Free :     min','Sprung : min','Stiff :      min')
set(gca,"FontSize",14)

grid on


figure(2)
plot(alpha,Free_Sweep_10_Delta_M_sup,'--rd',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Free_Sweep_10_Delta_M_inf,'-rd',MarkerFaceColor='r',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Sprung_Sweep_10_Delta_M_sup,'--s','color',[0 0.5 0],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Sprung_Sweep_10_Delta_M_inf,'-s','color',[0 0.5 0],MarkerFaceColor=[0 0.5 0],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Stiff_Sweep_10_Delta_M_sup,'--o','color',[0 0 1],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Stiff_Sweep_10_Delta_M_inf,'-o','color',[0 0 1],MarkerFaceColor='b',LineWidth=1.5,MarkerSize=8)
xlabel('\alpha in deg')
ylabel('\Delta C_l')
ylim([-0.005 0.03])
grid on
% legend('Free :     max','Sprung : max','Stiff :      max','Free :     min','Sprung : min','Stiff :      min')
set(gca,"FontSize",14)

figure(3)
plot(alpha,Free_Sweep_10_Delta_phi_sup,'--rd',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Free_Sweep_10_Delta_phi_inf,'-rd',MarkerFaceColor='r',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Sprung_Sweep_10_Delta_phi_sup,'--s','color',[0 0.5 0],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Sprung_Sweep_10_Delta_phi_inf,'-s','color',[0 0.5 0],MarkerFaceColor=[0 0.5 0],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Stiff_Sweep_10_Delta_phi_sup,'--o','color',[0 0 1],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Stiff_Sweep_10_Delta_phi_inf,'-o','color',[0 0 1],MarkerFaceColor='b',LineWidth=1.5,MarkerSize=8)
ylim([-10 30])
xlabel('\alpha in deg')
ylabel('\Delta \theta')
grid on
% legend('Free :     max','Sprung : max','Stiff :      max','Free :     min','Sprung : min','Stiff :      min')
set(gca,"FontSize",14)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SIMULATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% system('sh ./Free_Sweep_30_A-10.sh')
% system('sh ./Free_Sweep_30_A-5.sh')
% system('sh ./Free_Sweep_30_A0.sh')
% system('sh ./Free_Sweep_30_A5.sh')
% system('sh ./Free_Sweep_30_A10.sh')
% 
% system('sh ./Sprung_Sweep_30_A-5.sh')
% system('sh ./Sprung_Sweep_30_A0.sh')
% system('sh ./Sprung_Sweep_30_A5.sh')
% system('sh ./Sprung_Sweep_30_A10.sh')
% 
% system('sh ./Stiff_Sweep_30_A-5.sh')
% system('sh ./Stiff_Sweep_30_A0.sh')
% system('sh ./Stiff_Sweep_30_A5.sh')
% system('sh ./Stiff_Sweep_30_A10.sh')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%ANALYSE DONNEES


Free_Sweep_30_A_m5 =  readtable("Free_Sweep_30_A-5.txt",NumHeaderLines=3);
Free_Sweep_30_A_0 =  readtable("Free_Sweep_30_A0.txt",NumHeaderLines=3);
Free_Sweep_30_A_5 =  readtable("Free_Sweep_30_A5.txt",NumHeaderLines=3);
Free_Sweep_30_A_10 =  readtable("Free_Sweep_30_A10.txt",NumHeaderLines=3);

qS = 0.5300*247.6;

Free_Sweep_30_Delta_CL_sup = [max(Free_Sweep_30_A_m5.Var5)-Free_Sweep_30_A_m5.Var5(1) ...
                              max(Free_Sweep_30_A_0.Var5)-Free_Sweep_30_A_0.Var5(1) ...
                              max(Free_Sweep_30_A_5.Var5)-Free_Sweep_30_A_5.Var5(1) ...
                              max(Free_Sweep_30_A_10.Var5)-Free_Sweep_30_A_10.Var5(1)];

Free_Sweep_30_Delta_CL_inf = [min(Free_Sweep_30_A_m5.Var5)-Free_Sweep_30_A_m5.Var5(1) ...
                              min(Free_Sweep_30_A_0.Var5)-Free_Sweep_30_A_0.Var5(1) ...
                              min(Free_Sweep_30_A_5.Var5)-Free_Sweep_30_A_5.Var5(1) ...
                              min(Free_Sweep_30_A_10.Var5)-Free_Sweep_30_A_10.Var5(1)];

Free_Sweep_30_Delta_M_sup = [max(Free_Sweep_30_A_m5.Var7)-Free_Sweep_30_A_m5.Var7(1) ...
                              max(Free_Sweep_30_A_0.Var7)-Free_Sweep_30_A_0.Var7(1) ...
                              max(Free_Sweep_30_A_5.Var7)-Free_Sweep_30_A_5.Var7(1) ...
                              max(Free_Sweep_30_A_10.Var7)-Free_Sweep_30_A_10.Var7(1)]/qS ;

Free_Sweep_30_Delta_M_inf = [min(Free_Sweep_30_A_m5.Var7)-Free_Sweep_30_A_m5.Var7(1) ...
                              min(Free_Sweep_30_A_0.Var7)-Free_Sweep_30_A_0.Var7(1) ...
                              min(Free_Sweep_30_A_5.Var7)-Free_Sweep_30_A_5.Var7(1) ...
                              min(Free_Sweep_30_A_10.Var7)-Free_Sweep_30_A_10.Var7(1)]/qS ;


Free_Sweep_30_Delta_phi_sup = [max(Free_Sweep_30_A_m5.Var8)-Free_Sweep_30_A_m5.Var8(1) ...
                              max(Free_Sweep_30_A_0.Var8)-Free_Sweep_30_A_0.Var8(1) ...
                              max(Free_Sweep_30_A_5.Var8)-Free_Sweep_30_A_5.Var8(1) ...
                              max(Free_Sweep_30_A_10.Var8)-Free_Sweep_30_A_10.Var8(1)];

Free_Sweep_30_Delta_phi_inf = [min(Free_Sweep_30_A_m5.Var8)-Free_Sweep_30_A_m5.Var8(1) ...
                              min(Free_Sweep_30_A_0.Var8)-Free_Sweep_30_A_0.Var8(1) ...
                              min(Free_Sweep_30_A_5.Var8)-Free_Sweep_30_A_5.Var8(1) ...
                              min(Free_Sweep_30_A_10.Var8)-Free_Sweep_30_A_10.Var8(1)];


Sprung_Sweep_30_A_m5 =  readtable("Sprung_Sweep_30_A-5.txt",NumHeaderLines=3);
Sprung_Sweep_30_A_0 =  readtable("Sprung_Sweep_30_A0.txt",NumHeaderLines=3);
Sprung_Sweep_30_A_5 =  readtable("Sprung_Sweep_30_A5.txt",NumHeaderLines=3);
Sprung_Sweep_30_A_10 =  readtable("Sprung_Sweep_30_A10.txt",NumHeaderLines=3);


Sprung_Sweep_30_Delta_CL_sup = [max(Sprung_Sweep_30_A_m5.Var5)-Sprung_Sweep_30_A_m5.Var5(1) ...
                              max(Sprung_Sweep_30_A_0.Var5)-Sprung_Sweep_30_A_0.Var5(1) ...
                              max(Sprung_Sweep_30_A_5.Var5)-Sprung_Sweep_30_A_5.Var5(1) ...
                              max(Sprung_Sweep_30_A_10.Var5)-Sprung_Sweep_30_A_10.Var5(1)];

Sprung_Sweep_30_Delta_CL_inf = [min(Sprung_Sweep_30_A_m5.Var5)-Sprung_Sweep_30_A_m5.Var5(1) ...
                              min(Sprung_Sweep_30_A_0.Var5)-Sprung_Sweep_30_A_0.Var5(1) ...
                              min(Sprung_Sweep_30_A_5.Var5)-Sprung_Sweep_30_A_5.Var5(1) ...
                              min(Sprung_Sweep_30_A_10.Var5)-Sprung_Sweep_30_A_10.Var5(1)];

Sprung_Sweep_30_Delta_M_sup = [max(Sprung_Sweep_30_A_m5.Var7)-Sprung_Sweep_30_A_m5.Var7(1) ...
                              max(Sprung_Sweep_30_A_0.Var7)-Sprung_Sweep_30_A_0.Var7(1) ...
                              max(Sprung_Sweep_30_A_5.Var7)-Sprung_Sweep_30_A_5.Var7(1) ...
                              max(Sprung_Sweep_30_A_10.Var7)-Sprung_Sweep_30_A_10.Var7(1)]/qS;

Sprung_Sweep_30_Delta_M_inf = [min(Sprung_Sweep_30_A_m5.Var7)-Sprung_Sweep_30_A_m5.Var7(1) ...
                              min(Sprung_Sweep_30_A_0.Var7)-Sprung_Sweep_30_A_0.Var7(1) ...
                              min(Sprung_Sweep_30_A_5.Var7)-Sprung_Sweep_30_A_5.Var7(1) ...
                              min(Sprung_Sweep_30_A_10.Var7)-Sprung_Sweep_30_A_10.Var7(1)]/qS;


Sprung_Sweep_30_Delta_phi_sup = [max(Sprung_Sweep_30_A_m5.Var8)-Sprung_Sweep_30_A_m5.Var8(1) ...
                              max(Sprung_Sweep_30_A_0.Var8)-Sprung_Sweep_30_A_0.Var8(1) ...
                              max(Sprung_Sweep_30_A_5.Var8)-Sprung_Sweep_30_A_5.Var8(1) ...
                              max(Sprung_Sweep_30_A_10.Var8)-Sprung_Sweep_30_A_10.Var8(1)];

Sprung_Sweep_30_Delta_phi_inf = [min(Sprung_Sweep_30_A_m5.Var8)-Sprung_Sweep_30_A_m5.Var8(1) ...
                              min(Sprung_Sweep_30_A_0.Var8)-Sprung_Sweep_30_A_0.Var8(1) ...
                              min(Sprung_Sweep_30_A_5.Var8)-Sprung_Sweep_30_A_5.Var8(1) ...
                              min(Sprung_Sweep_30_A_10.Var8)-Sprung_Sweep_30_A_10.Var8(1)];

Stiff_Sweep_30_A_m5 =  readtable("Stiff_Sweep_30_A-5.txt",NumHeaderLines=3);
Stiff_Sweep_30_A_0 =  readtable("Stiff_Sweep_30_A0.txt",NumHeaderLines=3);
Stiff_Sweep_30_A_5 =  readtable("Stiff_Sweep_30_A5.txt",NumHeaderLines=3);
Stiff_Sweep_30_A_10 =  readtable("Stiff_Sweep_30_A10.txt",NumHeaderLines=3);


Stiff_Sweep_30_Delta_CL_sup = [max(Stiff_Sweep_30_A_m5.Var5)-Stiff_Sweep_30_A_m5.Var5(1) ...
                              max(Stiff_Sweep_30_A_0.Var5)-Stiff_Sweep_30_A_0.Var5(1) ...
                              max(Stiff_Sweep_30_A_5.Var5)-Stiff_Sweep_30_A_5.Var5(1) ...
                              max(Stiff_Sweep_30_A_10.Var5)-Stiff_Sweep_30_A_10.Var5(1)];

Stiff_Sweep_30_Delta_CL_inf = [min(Stiff_Sweep_30_A_m5.Var5)-Stiff_Sweep_30_A_m5.Var5(1) ...
                              min(Stiff_Sweep_30_A_0.Var5)-Stiff_Sweep_30_A_0.Var5(1) ...
                              min(Stiff_Sweep_30_A_5.Var5)-Stiff_Sweep_30_A_5.Var5(1) ...
                              min(Stiff_Sweep_30_A_10.Var5)-Stiff_Sweep_30_A_10.Var5(1)];

Stiff_Sweep_30_Delta_M_sup = [max(Stiff_Sweep_30_A_m5.Var7)-Stiff_Sweep_30_A_m5.Var7(1) ...
                              max(Stiff_Sweep_30_A_0.Var7)-Stiff_Sweep_30_A_0.Var7(1) ...
                              max(Stiff_Sweep_30_A_5.Var7)-Stiff_Sweep_30_A_5.Var7(1) ...
                              max(Stiff_Sweep_30_A_10.Var7)-Stiff_Sweep_30_A_10.Var7(1)]/qS;

Stiff_Sweep_30_Delta_M_inf = [min(Stiff_Sweep_30_A_m5.Var7)-Stiff_Sweep_30_A_m5.Var7(1) ...
                              min(Stiff_Sweep_30_A_0.Var7)-Stiff_Sweep_30_A_0.Var7(1) ...
                              min(Stiff_Sweep_30_A_5.Var7)-Stiff_Sweep_30_A_5.Var7(1) ...
                              min(Stiff_Sweep_30_A_10.Var7)-Stiff_Sweep_30_A_10.Var7(1)]/qS ;


Stiff_Sweep_30_Delta_phi_sup = [max(Stiff_Sweep_30_A_m5.Var8)-Stiff_Sweep_30_A_m5.Var8(1) ...
                              max(Stiff_Sweep_30_A_0.Var8)-Stiff_Sweep_30_A_0.Var8(1) ...
                              max(Stiff_Sweep_30_A_5.Var8)-Stiff_Sweep_30_A_5.Var8(1) ...
                              max(Stiff_Sweep_30_A_10.Var8)-Stiff_Sweep_30_A_10.Var8(1)];

Stiff_Sweep_30_Delta_phi_inf = [min(Stiff_Sweep_30_A_m5.Var8)-Stiff_Sweep_30_A_m5.Var8(1) ...
                              min(Stiff_Sweep_30_A_0.Var8)-Stiff_Sweep_30_A_0.Var8(1) ...
                              min(Stiff_Sweep_30_A_5.Var8)-Stiff_Sweep_30_A_5.Var8(1) ...
                              min(Stiff_Sweep_30_A_10.Var8)-Stiff_Sweep_30_A_10.Var8(1)];

alpha = [-5 0 5 10];
figure(4)
plot(alpha,Free_Sweep_30_Delta_CL_sup,'--rd',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Sprung_Sweep_30_Delta_CL_sup,'--s','color',[0 0.5 0],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Stiff_Sweep_30_Delta_CL_sup,'--o','color',[0 0 1],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Free_Sweep_30_Delta_CL_inf,'-rd',MarkerFaceColor='r',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Sprung_Sweep_30_Delta_CL_inf,'-s','color',[0 0.5 0],MarkerFaceColor=[0 0.5 0],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Stiff_Sweep_30_Delta_CL_inf,'-o','color',[0 0 1],MarkerFaceColor='b',LineWidth=1.5,MarkerSize=8)
% xlim([0 10])
ylim([-0.02 0.14])
xlabel('\alpha in deg')
ylabel('\Delta C_L')
grid on
legend('Free :     max','Sprung : max','Stiff :      max','Free :     min','Sprung : min','Stiff :      min')
set(gca,"FontSize",14)

figure(5)
plot(alpha,Free_Sweep_30_Delta_M_sup,'--rd',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Free_Sweep_30_Delta_M_inf,'-rd',MarkerFaceColor='r',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Sprung_Sweep_30_Delta_M_sup,'--s','color',[0 0.5 0],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Sprung_Sweep_30_Delta_M_inf,'-s','color',[0 0.5 0],MarkerFaceColor=[0 0.5 0],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Stiff_Sweep_30_Delta_M_sup,'--o','color',[0 0 1],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Stiff_Sweep_30_Delta_M_inf,'-o','color',[0 0 1],MarkerFaceColor='b',LineWidth=1.5,MarkerSize=8)
xlabel('\alpha in deg')
ylabel('\Delta C_l')
% xlim([0 10])
ylim([-0.005 0.03])

grid on
set(gca,"FontSize",14)

figure(6)
plot(alpha,Free_Sweep_30_Delta_phi_sup,'--rd',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Free_Sweep_30_Delta_phi_inf,'-rd',MarkerFaceColor='r',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Sprung_Sweep_30_Delta_phi_sup,'--s','color',[0 0.5 0],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Sprung_Sweep_30_Delta_phi_inf,'-s','color',[0 0.5 0],MarkerFaceColor=[0 0.5 0],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Stiff_Sweep_30_Delta_phi_sup,'--o','color',[0 0 1],LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha,Stiff_Sweep_30_Delta_phi_inf,'-o','color',[0 0 1],MarkerFaceColor='b',LineWidth=1.5,MarkerSize=8)
ylim([-10 30])
xlabel('\alpha in deg')
ylabel('\Delta \theta')
% xlim([0 10])
grid on
set(gca,"FontSize",14)
