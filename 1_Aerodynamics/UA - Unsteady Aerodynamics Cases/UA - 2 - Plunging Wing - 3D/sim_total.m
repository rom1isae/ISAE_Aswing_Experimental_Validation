clear all
close all





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PLUNGING WING ONLY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  A1  alpha = 0.0
close all
WFIG8_TEMP = readtable('Experimental Data/WFIG8_A.csv','NumHeaderLines',3);
PHI_TEMP = readtable('Experimental Data/WFIG10_A.csv','NumHeaderLines',3);
alpha = 0;
alpha = alpha*pi/180;
k = linspace(0,0.95,15);

H0 =besselj(0,k)-j*bessely(0,k);
H1 = besselj(1,k)-j*bessely(1,k);

a_c = [0.05 0.1 0.3 0.5];

cl_correction = 0.85;

Cimp = (1+2*j.*k)./(1+4*j.*k);
for i = 1:length(k)
C_Theodorsen(i) =  H1(i)/(j*H0(i)+H1(i))
end
cl_005 = a_c(1)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_01 = a_c(2)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_03 = a_c(3)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_05 = a_c(4)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
phi_aswing = 180+180*angle(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)/pi;


cl_005_T = a_c(1)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_01_T = a_c(2)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_03_T = a_c(3)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_05_T = a_c(4)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
phi_Theodersen = 180+180*angle(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)/pi;


figure(1)
plot(WFIG8_TEMP.Var1,WFIG8_TEMP.Var2,'ro','linewidth',2.0,MarkerSize=10,MarkerFaceColor='r')
hold on
plot(WFIG8_TEMP.Var3,WFIG8_TEMP.Var4,'bd','linewidth',2.0,MarkerSize=10,MarkerFaceColor='b')
hold on
plot(WFIG8_TEMP.Var5,WFIG8_TEMP.Var6,'k*','linewidth',2.0,MarkerSize=10,MarkerFaceColor='k')
hold on 
plot(WFIG8_TEMP.Var7,WFIG8_TEMP.Var8,'s','Color',[0 0.5 0],'linewidth',2.0,MarkerSize=10,MarkerFaceColor=[0 0.5 0])
hold on
plot(k,cl_005,'--r','linewidth',2.0)
hold on
plot(k,cl_01,'--b','linewidth',2.0)
hold on
plot(k,cl_03,'--k','linewidth',2.0)
hold on
plot(k,cl_05,'--','Color',[0 0.5 0],'linewidth',2.0)
hold on
plot(k,cl_005_T,'-r','linewidth',2.0)
hold on
plot(k,cl_01_T,'-b','linewidth',2.0)
hold on
plot(k,cl_03_T,'-k','linewidth',2.0)
hold on
plot(k,cl_05_T,'-','Color',[0 0.5 0],'linewidth',2.0)
grid on
xlabel('reduced frequency k')
ylabel('3D lift first harmonic amplitude')
legend('A/c = 0.05 (Exp)','A/c = 0.1 (Exp)','A/c = 0.3 (Exp)',...
    'A/c = 0.5 (Exp)','A/c = 0.05 (3D ASWING)','A/c = 0.1 (3D ASWING)',...
    'A/c = 0.3 (3D ASWING)','A/c = 0.5 (3D ASWING)',...
    'A/c = 0.05 (2D Theordorsen)','A/c = 0.1 (2D Theordorsen)',...
    'A/c = 0.3 (2D Theordorsen)','A/c = 0.5 (2D Theordorsen)','Location','southoutside','NumColumns',1)
axis square
title('\alpha = 0^\circ')
h1 = figure(1)
set(h1,'Position',[10 10 800 800])

figure(2)
plot(PHI_TEMP.Var1,PHI_TEMP.Var2,'ro','linewidth',2.0,MarkerSize=10,MarkerFaceColor='r')
hold on
plot(PHI_TEMP.Var3,PHI_TEMP.Var4,'bd','linewidth',2.0,MarkerSize=10,MarkerFaceColor='b')
hold on
plot(PHI_TEMP.Var5,PHI_TEMP.Var6,'k*','linewidth',2.0,MarkerSize=10,MarkerFaceColor='k')
hold on 
plot(PHI_TEMP.Var7,PHI_TEMP.Var8,'s','Color',[0 0.5 0],'linewidth',2.0,MarkerSize=10,MarkerFaceColor=[0 0.5 0])
hold on
plot(k(2:end),phi_aswing(2:end),'--k','linewidth',2.0,MarkerSize=10)
hold on
plot(k(2:end),phi_Theodersen(2:end),'-k','linewidth',2.0,MarkerSize=10)
ylim([0 360])
grid on
legend('A/c = 0.05 (Exp)','A/c = 0.1 (Exp)','A/c = 0.3 (Exp)',...
    'A/c = 0.5 (Exp)','3D ASWING','2D Theordorsen','Location','southwest','NumColumns',3)
ylabel('3D lift phase lag in deg')
xlabel('reduced frequency k')
ylim([250 360])
h2 = figure(2)
set(h2,'Position',[10 10 800 300])
title('\alpha = 0^\circ')

%%  A1  alpha = 5.0
close all
WFIG8_TEMP = readtable('Experimental Data/WFIG8_B.csv','NumHeaderLines',3);
PHI_TEMP = readtable('Experimental Data/WFIG10_B.csv','NumHeaderLines',3);
alpha = 0;
alpha = alpha*pi/180;
k = linspace(0,0.95,15);

H0 =besselj(0,k)-j*bessely(0,k);
H1 = besselj(1,k)-j*bessely(1,k);

a_c = [0.05 0.1 0.3 0.5];

cl_correction = 0.90;

Cimp = (1+2*j.*k)./(1+4*j.*k);
for i = 1:length(k)
C_Theodorsen(i) =  H1(i)/(j*H0(i)+H1(i))
end
cl_005 = a_c(1)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_01 = a_c(2)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_03 = a_c(3)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_05 = a_c(4)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
phi_aswing = 180+180*angle(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)/pi;


cl_005_T = a_c(1)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_01_T = a_c(2)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_03_T = a_c(3)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_05_T = a_c(4)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
phi_Theodersen = 180+180*angle(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)/pi;


figure(3)
plot(WFIG8_TEMP.Var1,WFIG8_TEMP.Var2,'ro','linewidth',2.0,MarkerSize=10,MarkerFaceColor='r')
hold on
plot(WFIG8_TEMP.Var3,WFIG8_TEMP.Var4,'bd','linewidth',2.0,MarkerSize=10,MarkerFaceColor='b')
hold on
plot(WFIG8_TEMP.Var5,WFIG8_TEMP.Var6,'k*','linewidth',2.0,MarkerSize=10,MarkerFaceColor='k')
hold on 
plot(WFIG8_TEMP.Var7,WFIG8_TEMP.Var8,'s','Color',[0 0.5 0],'linewidth',2.0,MarkerSize=10,MarkerFaceColor=[0 0.5 0])
hold on
plot(k,cl_005,'--r','linewidth',2.0)
hold on
plot(k,cl_01,'--b','linewidth',2.0)
hold on
plot(k,cl_03,'--k','linewidth',2.0)
hold on
plot(k,cl_05,'--','Color',[0 0.5 0],'linewidth',2.0)
hold on
plot(k,cl_005_T,'-r','linewidth',2.0)
hold on
plot(k,cl_01_T,'-b','linewidth',2.0)
hold on
plot(k,cl_03_T,'-k','linewidth',2.0)
hold on
plot(k,cl_05_T,'-','Color',[0 0.5 0],'linewidth',2.0)
grid on
xlabel('reduced frequency k')
ylabel('3D lift first harmonic amplitude')
legend('A/c = 0.05 (Exp)','A/c = 0.1 (Exp)','A/c = 0.3 (Exp)',...
    'A/c = 0.5 (Exp)','A/c = 0.05 (3D ASWING)','A/c = 0.1 (3D ASWING)',...
    'A/c = 0.3 (3D ASWING)','A/c = 0.5 (3D ASWING)',...
    'A/c = 0.05 (2D Theordorsen)','A/c = 0.1 (2D Theordorsen)',...
    'A/c = 0.3 (2D Theordorsen)','A/c = 0.5 (2D Theordorsen)','Location','southoutside','NumColumns',1)
axis square
axis square
h1 = figure(3)
set(h1,'Position',[10 10 800 800])
title('\alpha = 5^\circ')



figure(4)
plot(PHI_TEMP.Var1,PHI_TEMP.Var2,'ro','linewidth',2.0,MarkerSize=10,MarkerFaceColor='r')
hold on
plot(PHI_TEMP.Var3,PHI_TEMP.Var4,'bd','linewidth',2.0,MarkerSize=10,MarkerFaceColor='b')
hold on
plot(PHI_TEMP.Var5,PHI_TEMP.Var6,'k*','linewidth',2.0,MarkerSize=10,MarkerFaceColor='k')
hold on 
plot(PHI_TEMP.Var7,PHI_TEMP.Var8,'s','Color',[0 0.5 0],'linewidth',2.0,MarkerSize=10,MarkerFaceColor=[0 0.5 0])
hold on
plot(k(2:end),phi_aswing(2:end),'--k','linewidth',2.0)
hold on
plot(k(2:end),phi_Theodersen(2:end),'-k','linewidth',2.0)
ylim([0 360])
grid on
legend('A/c = 0.05 (Exp)','A/c = 0.1 (Exp)','A/c = 0.3 (Exp)',...
    'A/c = 0.5 (Exp)','3D ASWING','2D Theordorsen','Location','southwest','NumColumns',3)
ylabel('3D lift phase lag in deg')
xlabel('reduced frequency k')
ylim([250 360])
h2 = figure(4)
set(h2,'Position',[10 10 800 300])
title('\alpha = 5^\circ')


%%  A1  alpha = 9.0
close all
WFIG8_TEMP = readtable('Experimental Data/WFIG8_C.csv','NumHeaderLines',3);
PHI_TEMP = readtable('Experimental Data/WFIG10_C.csv','NumHeaderLines',3);
alpha = 0;
alpha = alpha*pi/180;
k = linspace(0,0.95,15);

H0 =besselj(0,k)-j*bessely(0,k);
H1 = besselj(1,k)-j*bessely(1,k);

a_c = [0.05 0.1 0.3 0.5];

cl_correction = 0.90;

Cimp = (1+2*j.*k)./(1+4*j.*k);
for i = 1:length(k)
C_Theodorsen(i) =  H1(i)/(j*H0(i)+H1(i))
end
cl_005 = a_c(1)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_01 = a_c(2)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_03 = a_c(3)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_05 = a_c(4)*abs(cl_correction*2*pi.*k*1i.*Cimp-pi.*k.^2)+2*pi*alpha;
phi_aswing = 180+180*angle(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)/pi;


cl_005_T = a_c(1)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_01_T = a_c(2)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_03_T = a_c(3)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_05_T = a_c(4)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
phi_Theodersen = 180+180*angle(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)/pi;


figure(5)
plot(WFIG8_TEMP.Var1,WFIG8_TEMP.Var2,'ro','linewidth',2.0,MarkerSize=10,MarkerFaceColor='r')
hold on
plot(WFIG8_TEMP.Var3,WFIG8_TEMP.Var4,'bd','linewidth',2.0,MarkerSize=10,MarkerFaceColor='b')
hold on
plot(WFIG8_TEMP.Var5,WFIG8_TEMP.Var6,'k*','linewidth',2.0,MarkerSize=10,MarkerFaceColor='k')
hold on 
plot(WFIG8_TEMP.Var7,WFIG8_TEMP.Var8,'s','Color',[0 0.5 0],'linewidth',2.0,MarkerSize=10,MarkerFaceColor=[0 0.5 0])
hold on
plot(k,cl_005,'--r','linewidth',1.5)
hold on
plot(k,cl_01,'--b','linewidth',1.5)
hold on
plot(k,cl_03,'--k','linewidth',1.5)
hold on
plot(k,cl_05,'--','Color',[0 0.5 0],'linewidth',1.5)
hold on
plot(k,cl_005_T,'-r','linewidth',1.5)
hold on
plot(k,cl_01_T,'-b','linewidth',1.5)
hold on
plot(k,cl_03_T,'-k','linewidth',1.5)
hold on
plot(k,cl_05_T,'-','Color',[0 0.5 0],'linewidth',1.5)
grid on
xlabel('reduced frequency k')
ylabel('3D lift first harmonic amplitude')
legend('A/c = 0.05 (Exp)','A/c = 0.1 (Exp)','A/c = 0.3 (Exp)',...
    'A/c = 0.5 (Exp)','A/c = 0.05 (3D ASWING)','A/c = 0.1 (3D ASWING)',...
    'A/c = 0.3 (3D ASWING)','A/c = 0.5 (3D ASWING)',...
    'A/c = 0.05 (2D Theordorsen)','A/c = 0.1 (2D Theordorsen)',...
    'A/c = 0.3 (2D Theordorsen)','A/c = 0.5 (2D Theordorsen)','Location','southoutside','NumColumns',1)
axis square
h1 = figure(5)
set(h1,'Position',[10 10 800 800])

axis square
h1 = figure(5)
set(h1,'Position',[10 10 800 800])
title('\alpha = 9^\circ')

figure(6)
plot(PHI_TEMP.Var1,PHI_TEMP.Var2,'ro','linewidth',2.0,MarkerSize=10,MarkerFaceColor='r')
hold on
plot(PHI_TEMP.Var3,PHI_TEMP.Var4,'bd','linewidth',2.0,MarkerSize=10,MarkerFaceColor='b')
hold on
plot(PHI_TEMP.Var5,PHI_TEMP.Var6,'k*','linewidth',2.0,MarkerSize=10,MarkerFaceColor='k')
hold on 
plot(PHI_TEMP.Var7,PHI_TEMP.Var8,'s','Color',[0 0.5 0],'linewidth',2.0,MarkerSize=10,MarkerFaceColor=[0 0.5 0])
hold on
plot(k(2:end),phi_aswing(2:end),'--k','linewidth',1.5)
hold on
plot(k(2:end),phi_Theodersen(2:end),'-k','linewidth',1.5)
ylim([0 360])
grid on
grid on
legend('A/c = 0.05 (Exp)','A/c = 0.1 (Exp)','A/c = 0.3 (Exp)',...
    'A/c = 0.5 (Exp)','3D ASWING','2D Theordorsen','Location','southwest','NumColumns',3)
ylabel('3D lift phase lag in deg')
xlabel('reduced frequency k')
ylim([250 360])
h2 = figure(6)
set(h2,'Position',[10 10 800 300])
title('\alpha = 9^\circ')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plunging AIRFOIL - Lift Peak to Peak and Phase Lag 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A1  alpha = 0.0
close all
WFIG8_TEMP = readtable('Experimental Data/AFIG8_A.csv','NumHeaderLines',3);
PHI_TEMP = readtable('Experimental Data/AFIG10_A.csv','NumHeaderLines',3);
alpha = 0;
alpha = alpha*pi/180;
k = linspace(0,0.95,15);

H0 =besselj(0,k)-j*bessely(0,k);
H1 = besselj(1,k)-j*bessely(1,k);

a_c = [0.05 0.1 0.3 0.5];

cl_correction = 1.0;

Cimp = (1+2*j.*k)./(1+4*j.*k);
for i = 1:length(k)
C_Theodorsen(i) =  H1(i)/(j*H0(i)+H1(i))
end
cl_005 = a_c(1)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_01 = a_c(2)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_03 = a_c(3)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_05 = a_c(4)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
phi_aswing = 180+180*angle(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)/pi;


cl_005_T = a_c(1)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_01_T = a_c(2)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_03_T = a_c(3)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_05_T = a_c(4)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
phi_Theodersen = 180+180*angle(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)/pi;


figure(1)
plot(WFIG8_TEMP.Var1,WFIG8_TEMP.Var2,'ro','linewidth',2.0,MarkerSize=10)
hold on
plot(WFIG8_TEMP.Var3,WFIG8_TEMP.Var4,'bd','linewidth',2.0,MarkerSize=10)
hold on
plot(WFIG8_TEMP.Var5,WFIG8_TEMP.Var6,'k*','linewidth',2.0,MarkerSize=10)
hold on 
plot(WFIG8_TEMP.Var7,WFIG8_TEMP.Var8,'s','Color',[0 0.5 0],'linewidth',2.0,MarkerSize=10)
hold on
plot(k,cl_005,'--r','linewidth',2.0)
hold on
plot(k,cl_01,'--b','linewidth',2.0)
hold on
plot(k,cl_03,'--k','linewidth',2.0)
hold on
plot(k,cl_05,'--','Color',[0 0.5 0],'linewidth',2.0)
hold on
plot(k,cl_005_T,'-r','linewidth',2.0)
hold on
plot(k,cl_01_T,'-b','linewidth',2.0)
hold on
plot(k,cl_03_T,'-k','linewidth',2.0)
hold on
plot(k,cl_05_T,'-','Color',[0 0.5 0],'linewidth',2.0)
grid on
xlabel('reduced frequency k')
ylabel('2D lift first harmonic amplitude')
legend('A/c = 0.05 (Exp)','A/c = 0.1 (Exp)','A/c = 0.3 (Exp)',...
    'A/c = 0.5 (Exp)','A/c = 0.05 (2D ASWING)','A/c = 0.1 (2D ASWING)',...
    'A/c = 0.3 (2D ASWING)','A/c = 0.5 (2D ASWING)',...
    'A/c = 0.05 (2D Theordorsen)','A/c = 0.1 (2D Theordorsen)',...
    'A/c = 0.3 (2D Theordorsen)','A/c = 0.5 (2D Theordorsen)','Location','southoutside','NumColumns',1)
axis square
h1 = figure(1)
set(h1,'Position',[10 10 800 800])

figure(2)
plot(PHI_TEMP.Var1,PHI_TEMP.Var2,'ro','linewidth',2.0,MarkerSize=10)
hold on
plot(PHI_TEMP.Var3,PHI_TEMP.Var4,'bd','linewidth',2.0,MarkerSize=10)
hold on
plot(PHI_TEMP.Var5,PHI_TEMP.Var6,'k*','linewidth',2.0,MarkerSize=10)
hold on 
plot(PHI_TEMP.Var7,PHI_TEMP.Var8,'s','Color',[0 0.5 0],'linewidth',2.0,MarkerSize=10)
hold on
plot(k(2:end),phi_aswing(2:end),'--k','linewidth',2.0)
hold on
plot(k(2:end),phi_Theodersen(2:end),'-k','linewidth',2.0)
ylim([0 360])
grid on
legend('A/c = 0.05 (Exp)','A/c = 0.1 (Exp)','A/c = 0.3 (Exp)',...
    'A/c = 0.5 (Exp)','2D ASWING','2D Theordorsen','Location','southwest','NumColumns',3)
ylabel('2D lift phase lag in deg')
xlabel('reduced frequency k')
ylim([250 360])
h2 = figure(2)
set(h2,'Position',[10 10 800 300])

%  A1  alpha = 5.0
WFIG8_TEMP = readtable('AFIG8_B.csv','NumHeaderLines',3);
PHI_TEMP = readtable('AFIG10_B.csv','NumHeaderLines',3);
alpha = 0;
alpha = alpha*pi/180;
k = linspace(0,0.95,15);

H0 =besselj(0,k)-j*bessely(0,k);
H1 = besselj(1,k)-j*bessely(1,k);

a_c = [0.05 0.1 0.3 0.5];

cl_correction = 1.0;

Cimp = (1+2*j.*k)./(1+4*j.*k);
for i = 1:length(k)
C_Theodorsen(i) =  H1(i)/(j*H0(i)+H1(i))
end
cl_005 = a_c(1)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_01 = a_c(2)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_03 = a_c(3)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_05 = a_c(4)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
phi_aswing = 180+180*angle(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)/pi;


cl_005_T = a_c(1)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_01_T = a_c(2)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_03_T = a_c(3)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_05_T = a_c(4)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
phi_Theodersen = 180+180*angle(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)/pi;


figure(3)
plot(WFIG8_TEMP.Var1,WFIG8_TEMP.Var2,'ro','linewidth',2.0,MarkerSize=10)
hold on
plot(WFIG8_TEMP.Var3,WFIG8_TEMP.Var4,'bd','linewidth',2.0,MarkerSize=10)
hold on
plot(WFIG8_TEMP.Var5,WFIG8_TEMP.Var6,'k*','linewidth',2.0,MarkerSize=10)
hold on 
plot(WFIG8_TEMP.Var7,WFIG8_TEMP.Var8,'s','Color',[0 0.5 0],'linewidth',2.0,MarkerSize=10)
hold on
plot(k,cl_005,'--r','linewidth',2.0)
hold on
plot(k,cl_01,'--b','linewidth',2.0)
hold on
plot(k,cl_03,'--k','linewidth',2.0)
hold on
plot(k,cl_05,'--','Color',[0 0.5 0],'linewidth',2.0)
hold on
plot(k,cl_005_T,'-r','linewidth',2.0)
hold on
plot(k,cl_01_T,'-b','linewidth',2.0)
hold on
plot(k,cl_03_T,'-k','linewidth',2.0)
hold on
plot(k,cl_05_T,'-','Color',[0 0.5 0],'linewidth',2.0)
grid on
xlabel('reduced frequency k')
ylabel('2D lift first harmonic amplitude')
legend('A/c = 0.05 (Exp)','A/c = 0.1 (Exp)','A/c = 0.3 (Exp)',...
    'A/c = 0.5 (Exp)','A/c = 0.05 (2D ASWING)','A/c = 0.1 (2D ASWING)',...
    'A/c = 0.3 (2D ASWING)','A/c = 0.5 (2D ASWING)',...
    'A/c = 0.05 (2D Theordorsen)','A/c = 0.1 (2D Theordorsen)',...
    'A/c = 0.3 (2D Theordorsen)','A/c = 0.5 (2D Theordorsen)','Location','southoutside','NumColumns',1)
axis square
h1 = figure(1)
set(h1,'Position',[10 10 800 800])

figure(4)
plot(PHI_TEMP.Var1,PHI_TEMP.Var2,'ro','linewidth',2.0,MarkerSize=10)
hold on
plot(PHI_TEMP.Var3,PHI_TEMP.Var4,'bd','linewidth',2.0,MarkerSize=10)
hold on
plot(PHI_TEMP.Var5,PHI_TEMP.Var6,'k*','linewidth',2.0,MarkerSize=10)
hold on 
plot(PHI_TEMP.Var7,PHI_TEMP.Var8,'s','Color',[0 0.5 0],'linewidth',2.0,MarkerSize=10)
hold on
plot(k(2:end),phi_aswing(2:end),'--k','linewidth',2.0)
hold on
plot(k(2:end),phi_Theodersen(2:end),'-k','linewidth',2.0)
ylim([0 360])
grid on
legend('A/c = 0.05 (Exp)','A/c = 0.1 (Exp)','A/c = 0.3 (Exp)',...
    'A/c = 0.5 (Exp)','2D ASWING','2D Theordorsen','Location','southwest','NumColumns',3)
ylabel('2D lift phase lag in deg')
xlabel('reduced frequency k')
ylim([250 360])
h2 = figure(2)
set(h2,'Position',[10 10 800 300])
%  A1  alpha = 9.0
WFIG8_TEMP = readtable('AFIG8_C.csv','NumHeaderLines',3);
PHI_TEMP = readtable('AFIG10_C.csv','NumHeaderLines',3);
alpha = 0;
alpha = alpha*pi/180;
k = linspace(0,0.95,15);

H0 =besselj(0,k)-j*bessely(0,k);
H1 = besselj(1,k)-j*bessely(1,k);

a_c = [0.05 0.1 0.3 0.5];

cl_correction = 1.0;

Cimp = (1+2*j.*k)./(1+4*j.*k);
for i = 1:length(k)
C_Theodorsen(i) =  H1(i)/(j*H0(i)+H1(i))
end
cl_005 = a_c(1)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_01 = a_c(2)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_03 = a_c(3)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
cl_05 = a_c(4)*abs(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)+2*pi*alpha;
phi_aswing = 180+180*angle(cl_correction*2*pi.*k*j.*Cimp-pi.*k.^2)/pi;


cl_005_T = a_c(1)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_01_T = a_c(2)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_03_T = a_c(3)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
cl_05_T = a_c(4)*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)+2*pi*alpha;
phi_Theodersen = 180+180*angle(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)/pi;


h1=figure(5); 
plot(WFIG8_TEMP.Var1,WFIG8_TEMP.Var2,'ro','linewidth',2.0,MarkerSize=10)
hold on
plot(WFIG8_TEMP.Var3,WFIG8_TEMP.Var4,'bd','linewidth',2.0,MarkerSize=10)
hold on
plot(WFIG8_TEMP.Var5,WFIG8_TEMP.Var6,'k*','linewidth',2.0,MarkerSize=10)
hold on 
plot(WFIG8_TEMP.Var7,WFIG8_TEMP.Var8,'s','Color',[0 0.5 0],'linewidth',2.0,MarkerSize=10)
hold on
plot(k,cl_005,'--r','linewidth',2.0)
hold on
plot(k,cl_01,'--b','linewidth',2.0)
hold on
plot(k,cl_03,'--k','linewidth',2.0)
hold on
plot(k,cl_05,'--','Color',[0 0.5 0],'linewidth',2.0)
hold on
plot(k,cl_005_T,'-r','linewidth',2.0)
hold on
plot(k,cl_01_T,'-b','linewidth',2.0)
hold on
plot(k,cl_03_T,'-k','linewidth',2.0)
hold on
plot(k,cl_05_T,'-','Color',[0 0.5 0],'linewidth',2.0)
grid on
xlabel('reduced frequency k')
ylabel('2D lift first harmonic amplitude')
legend('A/c = 0.05 (Exp)','A/c = 0.1 (Exp)','A/c = 0.3 (Exp)',...
    'A/c = 0.5 (Exp)','A/c = 0.05 (2D ASWING)','A/c = 0.1 (2D ASWING)',...
    'A/c = 0.3 (2D ASWING)','A/c = 0.5 (2D ASWING)',...
    'A/c = 0.05 (2D Theordorsen)','A/c = 0.1 (2D Theordorsen)',...
    'A/c = 0.3 (2D Theordorsen)','A/c = 0.5 (2D Theordorsen)','Location','southoutside','NumColumns',1)
axis square
h1 = figure(5)
set(h1,'Position',[10 10 800 800])


h2 = figure(6)
plot(PHI_TEMP.Var1,PHI_TEMP.Var2,'ro','linewidth',2.0,MarkerSize=10)
hold on
plot(PHI_TEMP.Var3,PHI_TEMP.Var4,'bd','linewidth',2.0,MarkerSize=10)
hold on
plot(PHI_TEMP.Var5,PHI_TEMP.Var6,'k*','linewidth',2.0,MarkerSize=10)
hold on 
plot(PHI_TEMP.Var7,PHI_TEMP.Var8,'s','Color',[0 0.5 0],'linewidth',2.0,MarkerSize=10)
hold on
plot(k(2:end),phi_aswing(2:end),'--k','linewidth',2.0)
hold on
plot(k(2:end),phi_Theodersen(2:end),'-k','linewidth',2.0)
grid on
legend('A/c = 0.05 (Exp)','A/c = 0.1 (Exp)','A/c = 0.3 (Exp)',...
    'A/c = 0.5 (Exp)','2D ASWING','2D Theordorsen','Location','southwest','NumColumns',3)
ylabel('2D lift phase lag in deg')
xlabel('reduced frequency k')
ylim([250 360])
h2 = figure(2)
set(h2,'Position',[10 10 800 300])
