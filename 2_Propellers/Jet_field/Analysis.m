clear all
close all
clear all


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANALYSE STATIQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% GAW_5_4-3 5000RPM

Exp_U = readtable('Static_GWS_5_4-3_5000RPM_U.csv',NumHeaderLines=2);
Exp_V = readtable('Static_GWS_5_4-3_5000RPM_V.csv',NumHeaderLines=2);

ft2m = 0.3048

Exp_U_X_D_0125_Y_D =Exp_U.Var1;
Exp_U_X_D_0125_U = ft2m*Exp_U.Var2;

Exp_U_X_D_05_Y_D =Exp_U.Var3;
Exp_U_X_D_05_U = ft2m*Exp_U.Var4;

Exp_U_X_D_1_Y_D = Exp_U.Var5;
Exp_U_X_D_1_U = ft2m*Exp_U.Var6;

Exp_U_X_D_2_Y_D = Exp_U.Var7;
Exp_U_X_D_2_U = ft2m*Exp_U.Var8;

Exp_U_X_D_3_Y_D = Exp_U.Var9;
Exp_U_X_D_3_U = ft2m*Exp_U.Var10;


Exp_V_X_D_0125_Y_D =Exp_V.Var1;
Exp_V_X_D_0125_V = ft2m*Exp_V.Var2;

Exp_V_X_D_05_Y_D =Exp_V.Var3;
Exp_V_X_D_05_V = ft2m*Exp_V.Var4;

Exp_V_X_D_1_Y_D = Exp_V.Var5;
Exp_V_X_D_1_V = ft2m*Exp_V.Var6;

Exp_V_X_D_2_Y_D = Exp_V.Var7;
Exp_V_X_D_2_V = ft2m*Exp_V.Var8;

Exp_V_X_D_3_Y_D = Exp_V.Var9;
Exp_V_X_D_3_V = ft2m*Exp_V.Var10;

% CALCUL MODEL

n = 5000/60;


% EXP CT AT 5000RPM
CT = 0.150794;
% EXP CP AT 5000RPM
CP = 0.0775;


Ve = 0.0; % static
J = 0.0;
rho = 1.215;

Omega = n*(2*pi);
D = 0.127;
R = D/2;
Ae = pi*R^2


Fe = rho*(n^2)*(D^4)*CT
Pe = rho*(n^3)*(D^5)*CP;
Me = -Pe/Omega;
DVe = sqrt(Ve^2+(2*Fe)/(rho*Ae))-Ve



% X/D = 0.125
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_0125_ISAE,V_XD_0125_ISAE] = Jet_field_hub(0.125*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% X/D = 0.5
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_05_ISAE,V_XD_05_ISAE] = Jet_field_hub(0.5*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% X/D = 1.0
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_1_ISAE,V_XD_1_ISAE] = Jet_field_hub(1*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% X/D = 2
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_2_ISAE,V_XD_2_ISAE] = Jet_field_hub(2*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% X/D = 3
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_3_ISAE,V_XD_3_ISAE] = Jet_field_hub(3*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% ASWING 5-96
% X/D = 0.125
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_0125,V_XD_0125] = Jet_field(0.125*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);

% X/D = 0.5
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_05,V_XD_05] = Jet_field(0.5*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);

% X/D = 1.0
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_1,V_XD_1] = Jet_field(1*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);

% X/D = 2
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_2,V_XD_2] = Jet_field(2*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);

% X/D = 3
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_3,V_XD_3] = Jet_field(3*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);





h = figure(1)

subplot(1,5,1)
plot(Exp_U_X_D_0125_U,Exp_U_X_D_0125_Y_D,'-k',LineWidth=1.5)
grid on
title('X/D = 0.125')
xlabel('V_{xe} in m/s')
ylabel('r/R')
xlim([0 10])
subplot(1,5,2)
plot(Exp_U_X_D_05_U,Exp_U_X_D_05_Y_D,'-k',LineWidth=1.5)
xlabel('V_{xe} in m/s')
xlim([0 10])
title('X/D = 0.5')
grid on
subplot(1,5,3)
plot(Exp_U_X_D_1_U,Exp_U_X_D_1_Y_D,'-k',LineWidth=1.5)
xlabel('V_{xe} in m/s')
xlim([0 10])
title('X/D = 1')
grid on
subplot(1,5,4)
plot(Exp_U_X_D_2_U,Exp_U_X_D_2_Y_D,'-k',LineWidth=1.5)
xlabel('V_{xe} in m/s')
xlim([0 10])
title('X/D = 2')
grid on
subplot(1,5,5)
plot(Exp_U_X_D_3_U,Exp_U_X_D_3_Y_D,'-k',LineWidth=1.5)
xlabel('V_{xe} in m/s')
xlim([0 10])
title('X/D = 3')
grid on
xlabel('V_{xe} in m/s')

subplot(1,5,1)
hold on
plot(U_XD_0125,Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,2)
hold on
plot(U_XD_05,Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,3)
hold on
plot(U_XD_1,Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,4)
hold on
plot(U_XD_2,Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,5)
hold on
plot(U_XD_3,Y_XD_0125/R,'-.r',LineWidth=1.5)



subplot(1,5,1)
hold on
plot(U_XD_0125_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
legend('Exp','ASW','ASW-m')
subplot(1,5,2)
hold on
plot(U_XD_05_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,5,3)
hold on
plot(U_XD_1_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,5,4)
hold on
plot(U_XD_2_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,5,5)
hold on
plot(U_XD_3_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [20 10]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [-1.9 0 24 10]);
print(gcf, 'Static_GWS_U.pdf','-loose','-dpdf');


figure(2)
subplot(1,5,1)
plot(Exp_V_X_D_0125_V,Exp_V_X_D_0125_Y_D,'-k',LineWidth=1.5)
grid on
title('X/D = 0.125')
xlabel('V_{sw} in m/s')
ylabel('r/R')
xlim([0 4])
subplot(1,5,2)
plot(Exp_V_X_D_05_V,Exp_V_X_D_05_Y_D,'-k',LineWidth=1.5)
title('X/D = 0.5')
xlabel('V_{sw} in m/s')
xlim([0 4])
grid on
subplot(1,5,3)
plot(Exp_V_X_D_1_V,Exp_V_X_D_1_Y_D,'-k',LineWidth=1.5)
title('X/D = 1')
xlabel('V_{sw} in m/s')
xlim([0 4])
grid on
subplot(1,5,4)
plot(Exp_V_X_D_2_V,Exp_V_X_D_2_Y_D,'-k',LineWidth=1.5)
title('X/D = 2')
xlabel('V_{sw} in m/s')
xlim([0 4])
grid on
subplot(1,5,5)
plot(Exp_V_X_D_3_V,Exp_V_X_D_3_Y_D,'-k',LineWidth=1.5)
title('X/D = 3')
xlabel('V_{sw} in m/s')
xlim([0 4])
grid on

subplot(1,5,1)
hold on
plot(V_XD_0125(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,2)
hold on
plot(V_XD_05(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,3)
hold on
plot(V_XD_1(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,4)
hold on
plot(V_XD_2(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,5)
hold on
plot(V_XD_3(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)



subplot(1,5,1)
hold on
plot(V_XD_0125_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
legend('Exp','ASW','ASW-m')
subplot(1,5,2)
hold on
plot(V_XD_05_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,5,3)
hold on
plot(V_XD_1_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,5,4)
hold on
plot(V_XD_2_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,5,5)
hold on
plot(V_XD_3_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
hold on



set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [20 10]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [-1.9 0 24 10]);
print(gcf, 'Static_GWS_V.pdf','-loose','-dpdf');




%% APC_Sport_4-2_2 9000RPM

Exp_U = readtable('Static_APC_Sport_4-2_2_9000RPM_U.csv',NumHeaderLines=2);
Exp_V = readtable('Static_APC_Sport_4-2_2_9000RPM_V.csv',NumHeaderLines=2);

ft2m = 0.3048

Exp_U_X_D_0125_Y_D =Exp_U.Var1;
Exp_U_X_D_0125_U = ft2m*Exp_U.Var2;

Exp_U_X_D_05_Y_D =Exp_U.Var3;
Exp_U_X_D_05_U = ft2m*Exp_U.Var4;

Exp_U_X_D_1_Y_D = Exp_U.Var5;
Exp_U_X_D_1_U = ft2m*Exp_U.Var6;

Exp_U_X_D_2_Y_D = Exp_U.Var7;
Exp_U_X_D_2_U = ft2m*Exp_U.Var8;

Exp_U_X_D_3_Y_D = Exp_U.Var9;
Exp_U_X_D_3_U = ft2m*Exp_U.Var10;


Exp_V_X_D_0125_Y_D =Exp_V.Var1;
Exp_V_X_D_0125_V = ft2m*Exp_V.Var2;

Exp_V_X_D_05_Y_D =Exp_V.Var3;
Exp_V_X_D_05_V = ft2m*Exp_V.Var4;

Exp_V_X_D_1_Y_D = Exp_V.Var5;
Exp_V_X_D_1_V = ft2m*Exp_V.Var6;

Exp_V_X_D_2_Y_D = Exp_V.Var7;
Exp_V_X_D_2_V = ft2m*Exp_V.Var8;

Exp_V_X_D_3_Y_D = Exp_V.Var9;
Exp_V_X_D_3_V = ft2m*Exp_V.Var10;

% CALCUL MODEL

n = 9000/60;


% EXP CT AT 9000RPM
CT = 0.081539;
% EXP CP AT 9000RPM
CP = 0.042386;


Ve = 0.0; % static
J = 0.0;
rho = 1.215;

Omega = n*(2*pi);
D = 0.107;
R = D/2;
Ae = pi*R^2


Fe = rho*(n^2)*(D^4)*CT
Pe = rho*(n^3)*(D^5)*CP;
Me = -Pe/Omega;
DVe = sqrt(Ve^2+(2*Fe)/(rho*Ae))-Ve



% X/D = 0.125
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_0125_ISAE,V_XD_0125_ISAE] = Jet_field_hub(0.125*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% X/D = 0.5
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_05_ISAE,V_XD_05_ISAE] = Jet_field_hub(0.5*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% X/D = 1.0
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_1_ISAE,V_XD_1_ISAE] = Jet_field_hub(1*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% X/D = 2
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_2_ISAE,V_XD_2_ISAE] = Jet_field_hub(2*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% X/D = 3
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_3_ISAE,V_XD_3_ISAE] = Jet_field_hub(3*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% ASWING 5-96
% X/D = 0.125
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_0125,V_XD_0125] = Jet_field(0.125*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);

% X/D = 0.5
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_05,V_XD_05] = Jet_field(0.5*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);

% X/D = 1.0
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_1,V_XD_1] = Jet_field(1*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);

% X/D = 2
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_2,V_XD_2] = Jet_field(2*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);

% X/D = 3
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_3,V_XD_3] = Jet_field(3*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);





h = figure(3)

subplot(1,5,1)
plot(Exp_U_X_D_0125_U,Exp_U_X_D_0125_Y_D,'-k',LineWidth=1.5)
grid on
title('X/D = 0.125')
xlabel('V_{xe} in m/s')
ylabel('r/R')
xlim([0 10])
ylim([0 1.5])
subplot(1,5,2)
plot(Exp_U_X_D_05_U,Exp_U_X_D_05_Y_D,'-k',LineWidth=1.5)
xlabel('V_{xe} in m/s')
xlim([0 10])
ylim([0 1.5])
title('X/D = 0.5')
grid on
subplot(1,5,3)
plot(Exp_U_X_D_1_U,Exp_U_X_D_1_Y_D,'-k',LineWidth=1.5)
xlabel('V_{xe} in m/s')
xlim([0 10])
ylim([0 1.5])
title('X/D = 1')
grid on
subplot(1,5,4)
plot(Exp_U_X_D_2_U,Exp_U_X_D_2_Y_D,'-k',LineWidth=1.5)
xlabel('V_{xe} in m/s')
xlim([0 10])
ylim([0 1.5])
title('X/D = 2')
grid on
subplot(1,5,5)
plot(Exp_U_X_D_3_U,Exp_U_X_D_3_Y_D,'-k',LineWidth=1.5)
xlabel('V_{xe} in m/s')
xlim([0 10])
ylim([0 1.5])
title('X/D = 3')
grid on
xlabel('V_{x_e} in m/s')

subplot(1,5,1)
hold on
plot(U_XD_0125,Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,2)
hold on
plot(U_XD_05,Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,3)
hold on
plot(U_XD_1,Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,4)
hold on
plot(U_XD_2,Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,5)
hold on
plot(U_XD_3,Y_XD_0125/R,'-.r',LineWidth=1.5)



subplot(1,5,1)
hold on
plot(U_XD_0125_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
legend('Exp','ASW','ASW-m')
subplot(1,5,2)
hold on
plot(U_XD_05_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,5,3)
hold on
plot(U_XD_1_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,5,4)
hold on
plot(U_XD_2_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,5,5)
hold on
plot(U_XD_3_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [20 10]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [-1.9 0 24 10]);
print(gcf, 'Static_APC_U.pdf','-loose','-dpdf');


figure(4)
subplot(1,5,1)
plot(Exp_V_X_D_0125_V,Exp_V_X_D_0125_Y_D,'-k',LineWidth=1.5)
grid on
title('X/D = 0.125')
xlabel('V_{sw} in m/s')
ylabel('r/R')
xlim([0 5])
ylim([0 1.5])
subplot(1,5,2)
plot(Exp_V_X_D_05_V,Exp_V_X_D_05_Y_D,'-k',LineWidth=1.5)
title('X/D = 0.5')
xlabel('V_{sw} in m/s')
grid on
xlim([0 5])
ylim([0 1.5])
subplot(1,5,3)
plot(Exp_V_X_D_1_V,Exp_V_X_D_1_Y_D,'-k',LineWidth=1.5)
title('X/D = 1')
xlabel('V_{sw} in m/s')
xlim([0 5])
ylim([0 1.5])
grid on
subplot(1,5,4)
plot(Exp_V_X_D_2_V,Exp_V_X_D_2_Y_D,'-k',LineWidth=1.5)
title('X/D = 2')
xlabel('V_{sw} in m/s')
xlim([0 5])
ylim([0 1.5])
grid on
subplot(1,5,5)
plot(Exp_V_X_D_3_V,Exp_V_X_D_3_Y_D,'-k',LineWidth=1.5)
title('X/D = 3')
xlabel('V_{sw} in m/s')
xlim([0 5])
ylim([0 1.5])
grid on

subplot(1,5,1)
hold on
plot(V_XD_0125(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,2)
hold on
plot(V_XD_05(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,3)
hold on
plot(V_XD_1(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,4)
hold on
plot(V_XD_2(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,5,5)
hold on
plot(V_XD_3(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)



subplot(1,5,1)
hold on
plot(V_XD_0125_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
legend('Exp','ASW','ASW-m')
subplot(1,5,2)
hold on
plot(V_XD_05_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,5,3)
hold on
plot(V_XD_1_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,5,4)
hold on
plot(V_XD_2_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,5,5)
hold on
plot(V_XD_3_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
hold on



set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [20 10]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [-1.9 0 24 10]);
print(gcf, 'Static_APC_V.pdf','-loose','-dpdf');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANALYSE DYNAMIQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% DA4002 9 inches, 5000RPM, J=0.64

Exp_U = readtable('DA4002_9_5000RPM_J064_V40ft_U.csv',NumHeaderLines=2);
Exp_V = readtable('DA4002_9_5000RPM_J064_V40ft_V.csv',NumHeaderLines=2);

ft2m = 0.3048

Exp_U_X_D_0125_Y_D =Exp_U.Var1;
Exp_U_X_D_0125_U = ft2m*Exp_U.Var2;

Exp_U_X_D_05_Y_D =Exp_U.Var3;
Exp_U_X_D_05_U = ft2m*Exp_U.Var4;

Exp_U_X_D_1_Y_D = Exp_U.Var5;
Exp_U_X_D_1_U = ft2m*Exp_U.Var6;

Exp_U_X_D_2_Y_D = Exp_U.Var7;
Exp_U_X_D_2_U = ft2m*Exp_U.Var8;




Exp_V_X_D_0125_Y_D =Exp_V.Var1;
Exp_V_X_D_0125_V = ft2m*Exp_V.Var2;

Exp_V_X_D_05_Y_D =Exp_V.Var3;
Exp_V_X_D_05_V = ft2m*Exp_V.Var4;

Exp_V_X_D_1_Y_D = Exp_V.Var5;
Exp_V_X_D_1_V = ft2m*Exp_V.Var6;

Exp_V_X_D_2_Y_D = Exp_V.Var7;
Exp_V_X_D_2_V = ft2m*Exp_V.Var8;



% CALCUL MODEL

n = 5000/60;


% EXP CT AT 5000RPM
CT = 0.057435;
% EXP CP AT 5000RPM
CP = 0.052418;


Ve = 40*ft2m; % static
J = 0.64;
rho = 1.215;

Omega = n*(2*pi);
D = 0.23;
R = D/2;
Ae = pi*R^2


Fe = rho*(n^2)*(D^4)*CT
Pe = rho*(n^3)*(D^5)*CP;
Me = -Pe/Omega;
DVe = sqrt(Ve^2+(2*Fe)/(rho*Ae))-Ve



% X/D = 0.125
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_0125_ISAE,V_XD_0125_ISAE] = Jet_field_hub(0.125*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% X/D = 0.5
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_05_ISAE,V_XD_05_ISAE] = Jet_field_hub(0.5*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% X/D = 1.0
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_1_ISAE,V_XD_1_ISAE] = Jet_field_hub(1*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% X/D = 2
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_2_ISAE,V_XD_2_ISAE] = Jet_field_hub(1.5*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);



% ASWING 5-96
% X/D = 0.125
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_0125,V_XD_0125] = Jet_field(0.125*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);

% X/D = 0.5
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_05,V_XD_05] = Jet_field(0.5*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);

% X/D = 1.0
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_1,V_XD_1] = Jet_field(1*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);

% X/D = 2
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_2,V_XD_2] = Jet_field(1.5*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);



h = figure(5)

subplot(1,4,1)
plot(Exp_U_X_D_0125_U,Exp_U_X_D_0125_Y_D,'-k',LineWidth=1.5)
grid on
title('X/D = 0.125')
xlabel('V_{xe} in m/s')
ylabel('r/R')
xlim([5 15])
ylim([0 1.5])
subplot(1,4,2)
plot(Exp_U_X_D_05_U,Exp_U_X_D_05_Y_D,'-k',LineWidth=1.5)
xlabel('V_{xe} in m/s')
xlim([5 15])
ylim([0 1.5])
title('X/D = 0.5')
grid on
subplot(1,4,3)
plot(Exp_U_X_D_1_U,Exp_U_X_D_1_Y_D,'-k',LineWidth=1.5)
xlabel('V_{xe} in m/s')
xlim([5 15])
ylim([0 1.5])
title('X/D = 1')
grid on
subplot(1,4,4)
plot(Exp_U_X_D_2_U,Exp_U_X_D_2_Y_D,'-k',LineWidth=1.5)
xlabel('V_{xe} in m/s')
xlim([5 15])
ylim([0 1.5])
title('X/D = 2')
grid on

subplot(1,4,1)
hold on
plot(Ve+U_XD_0125,Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,4,2)
hold on
plot(Ve+U_XD_05,Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,4,3)
hold on
plot(Ve+U_XD_1,Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,4,4)
hold on
plot(Ve+U_XD_2,Y_XD_0125/R,'-.r',LineWidth=1.5)




subplot(1,4,1)
hold on
plot(Ve+U_XD_0125_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
legend('Exp','ASW','ASW-m')
subplot(1,4,2)
hold on
plot(Ve+U_XD_05_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,4,3)
hold on
plot(Ve+U_XD_1_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,4,4)
hold on
plot(Ve+U_XD_2_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])


set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [20 10]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [-1.9 0 24 10]);
print(gcf, 'Advance_DA4002_U.pdf','-loose','-dpdf');


h = figure(6)
subplot(1,4,1)
plot(Exp_V_X_D_0125_V,Exp_V_X_D_0125_Y_D,'-k',LineWidth=1.5)
grid on
title('X/D = 0.125')
xlabel('V_{sw} in m/s')
ylabel('r/R')
xlim([-0.6 1.3])
ylim([0 1.5])
subplot(1,4,2)
plot(Exp_V_X_D_05_V,Exp_V_X_D_05_Y_D,'-k',LineWidth=1.5)
title('X/D = 0.5')
xlabel('V_{sw} in m/s')
grid on
xlim([-0.6 1.3])
ylim([0 1.5])
subplot(1,4,3)
plot(Exp_V_X_D_1_V,Exp_V_X_D_1_Y_D,'-k',LineWidth=1.5)
title('X/D = 1')
xlabel('V_{sw} in m/s')
xlim([-0.6 1.3])
ylim([0 1.5])
grid on
subplot(1,4,4)
plot(Exp_V_X_D_2_V,Exp_V_X_D_2_Y_D,'-k',LineWidth=1.5)
title('X/D = 2')
xlabel('V_{sw} in m/s')
xlim([-0.6 1.3])
ylim([0 1.5])
grid on


subplot(1,4,1)
hold on
plot(V_XD_0125(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,4,2)
hold on
plot(V_XD_05(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,4,3)
hold on
plot(V_XD_1(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,4,4)
hold on
plot(V_XD_2(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)



subplot(1,4,1)
hold on
plot(V_XD_0125_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
legend('Exp','ASW','ASW-m')
subplot(1,4,2)
hold on
plot(V_XD_05_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,4,3)
hold on
plot(V_XD_1_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,4,4)
hold on
plot(V_XD_2_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])




set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [20 10]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [-1.9 0 24 10]);
print(gcf, 'Advance_DA4002_V.pdf','-loose','-dpdf');



%% GWS 5 inches, 5000RPM, J=0.52

Exp_U = readtable('GWS_5_4-3_5000RPM_J052_V18ft_U.csv',NumHeaderLines=2);
Exp_V = readtable('GWS_5_4-3_5000RPM_J052_V18ft_V.csv',NumHeaderLines=2);

ft2m = 0.3048

Exp_U_X_D_0125_Y_D =Exp_U.Var1;
Exp_U_X_D_0125_U = ft2m*Exp_U.Var2;

Exp_U_X_D_05_Y_D =Exp_U.Var3;
Exp_U_X_D_05_U = ft2m*Exp_U.Var4;

Exp_U_X_D_1_Y_D = Exp_U.Var5;
Exp_U_X_D_1_U = ft2m*Exp_U.Var6;

Exp_U_X_D_2_Y_D = Exp_U.Var7;
Exp_U_X_D_2_U = ft2m*Exp_U.Var8;




Exp_V_X_D_0125_Y_D =Exp_V.Var1;
Exp_V_X_D_0125_V = ft2m*Exp_V.Var2;

Exp_V_X_D_05_Y_D =Exp_V.Var3;
Exp_V_X_D_05_V = ft2m*Exp_V.Var4;

Exp_V_X_D_1_Y_D = Exp_V.Var5;
Exp_V_X_D_1_V = ft2m*Exp_V.Var6;

Exp_V_X_D_2_Y_D = Exp_V.Var7;
Exp_V_X_D_2_V = ft2m*Exp_V.Var8;



% CALCUL MODEL

n = 5000/60;


% EXP CT AT 5000RPM
CT = 0.07035;
% EXP CP AT 5000RPM
CP = 0.06018;


Ve = 18*ft2m; % static
J = 0.52;
rho = 1.215;

Omega = n*(2*pi);
D = 0.127;
R = D/2;
Ae = pi*R^2


Fe = rho*(n^2)*(D^4)*CT
Pe = rho*(n^3)*(D^5)*CP;
Me = -Pe/Omega;
DVe = sqrt(Ve^2+(2*Fe)/(rho*Ae))-Ve



% X/D = 0.125
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_0125_ISAE,V_XD_0125_ISAE] = Jet_field_hub(0.125*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% X/D = 0.5
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_05_ISAE,V_XD_05_ISAE] = Jet_field_hub(0.5*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% X/D = 1.0
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_1_ISAE,V_XD_1_ISAE] = Jet_field_hub(1*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);

% X/D = 2
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_2_ISAE,V_XD_2_ISAE] = Jet_field_hub(1.5*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho,0.15*R);



% ASWING 5-96
% X/D = 0.125
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_0125,V_XD_0125] = Jet_field(0.125*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);

% X/D = 0.5
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_05,V_XD_05] = Jet_field(0.5*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);

% X/D = 1.0
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_1,V_XD_1] = Jet_field(1*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);

% X/D = 2
Y_XD_0125 = linspace(0,1.5*R,100);
[U_XD_2,V_XD_2] = Jet_field(1.5*D,Y_XD_0125,0,Ve,DVe,Fe,Me,R,rho);



h = figure(7)

subplot(1,4,1)
plot(Exp_U_X_D_0125_U,Exp_U_X_D_0125_Y_D,'-k',LineWidth=1.5)
grid on
title('X/D = 0.125')
xlabel('V_{xe} in m/s')
ylabel('r/R')
xlim([0 7.5])
ylim([0 1.5])
subplot(1,4,2)
plot(Exp_U_X_D_05_U,Exp_U_X_D_05_Y_D,'-k',LineWidth=1.5)
xlabel('V_{xe} in m/s')
xlim([0 7.5])
ylim([0 1.5])
title('X/D = 0.5')
grid on
subplot(1,4,3)
plot(Exp_U_X_D_1_U,Exp_U_X_D_1_Y_D,'-k',LineWidth=1.5)
xlabel('V_{xe} in m/s')
xlim([0 7.5])
ylim([0 1.5])
title('X/D = 1')
grid on
subplot(1,4,4)
plot(Exp_U_X_D_2_U,Exp_U_X_D_2_Y_D,'-k',LineWidth=1.5)
xlabel('V_{xe} in m/s')
xlim([0 7.5])
ylim([0 1.5])
title('X/D = 2')
grid on

subplot(1,4,1)
hold on
plot(Ve+U_XD_0125,Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,4,2)
hold on
plot(Ve+U_XD_05,Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,4,3)
hold on
plot(Ve+U_XD_1,Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,4,4)
hold on
plot(Ve+U_XD_2,Y_XD_0125/R,'-.r',LineWidth=1.5)




subplot(1,4,1)
hold on
plot(Ve+U_XD_0125_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
legend('Exp','ASW','ASW-m')
subplot(1,4,2)
hold on
plot(Ve+U_XD_05_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,4,3)
hold on
plot(Ve+U_XD_1_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,4,4)
hold on
plot(Ve+U_XD_2_ISAE,Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])


set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [20 10]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [-1.9 0 24 10]);
print(gcf, 'Advance_GWS_U.pdf','-loose','-dpdf');


h = figure(8)
subplot(1,4,1)
plot(Exp_V_X_D_0125_V,Exp_V_X_D_0125_Y_D,'-k',LineWidth=1.5)
grid on
title('X/D = 0.125')
xlabel('V_{sw} in m/s')
ylabel('r/R')
xlim([-0.35 0.8])
ylim([0 1.5])
subplot(1,4,2)
plot(Exp_V_X_D_05_V,Exp_V_X_D_05_Y_D,'-k',LineWidth=1.5)
title('X/D = 0.5')
xlabel('V_{sw} in m/s')
grid on
xlim([-0.35 0.8])
ylim([0 1.5])
subplot(1,4,3)
plot(Exp_V_X_D_1_V,Exp_V_X_D_1_Y_D,'-k',LineWidth=1.5)
title('X/D = 1')
xlabel('V_{sw} in m/s')
xlim([-0.35 0.8])
ylim([0 1.5])
grid on
subplot(1,4,4)
plot(Exp_V_X_D_2_V,Exp_V_X_D_2_Y_D,'-k',LineWidth=1.5)
title('X/D = 2')
xlabel('V_{sw} in m/s')
xlim([-0.35 0.8])
ylim([0 1.5])
grid on


subplot(1,4,1)
hold on
plot(V_XD_0125(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,4,2)
hold on
plot(V_XD_05(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,4,3)
hold on
plot(V_XD_1(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)
subplot(1,4,4)
hold on
plot(V_XD_2(:,:,3),Y_XD_0125/R,'-.r',LineWidth=1.5)



subplot(1,4,1)
hold on
plot(V_XD_0125_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
legend('Exp','ASW','ASW-m')
subplot(1,4,2)
hold on
plot(V_XD_05_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,4,3)
hold on
plot(V_XD_1_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])
subplot(1,4,4)
hold on
plot(V_XD_2_ISAE(:,:,3),Y_XD_0125/R,'--',LineWidth=1.5,Color=[0 0.5 0])




set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [20 10]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [-1.9 0 24 10]);
print(gcf, 'Advance_GWS_V.pdf','-loose','-dpdf');