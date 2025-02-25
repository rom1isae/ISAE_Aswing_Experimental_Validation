%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AIRFOIL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

NACA4309.alpha = 0;
NACA4309.CLmax = 1.0;
NACA4309.CLmin = -1.0;
NACA4309.dCLda = 6.0;
NACA4309.Cm = 0.0
NACA4309.Cdf = 0.00618  - 0.00192 ;
NACA4309.Cdp = 0.00192 ;
NACA4309.max_thickness = 0.09;

Wing1.airfoil = NACA4309;
Wing2.airfoil = NACA4309;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NON MOVING PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Wing1.b =1.8288;
% Wing1.b =2.55;
Wing2.b = 2.55;

Wing1.c = 0.3302;
% Wing1.c = 0.42;
Wing2.c = 0.21;

Wing1.b_ratio = 0.0;
Wing2.b_ratio = 0.0;

Wing1.X0 = 0;
Wing1.Y0 = 0;
Wing1.Z0 = 0;

Wing1.Xshift = 0.25;
Wing1.N = 80;

Wing2.Xshift = 0.25;
Wing2.N = 80;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Effect of Stagger [1.5 10.0]*c
% Gap = -0.5c
% twist1 = 2.0
% twist 2 =0.0
% Lambda1 = 0.0
% Lambda2 = 0.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Wing1.twist = 0.0;
Wing1.Lambda = 0.0;

Wing2.twist = 0.0;
Wing2.Lambda = 0.0;

Wing2.X0 = 2.0;
Wing2.Y0 = 0;
Wing2.Z0 = -0.5*Wing1.c;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WING Only
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Wing2.Status = false(1)


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Wing2.Status = false(1)
Fuselage.Status = false(1);
Xfoil_status1 = false(1);
Xfoil_status2 = false(1);
Wing1.eliptical_status = true(1);
Wing2.eliptical_status = false(1);
    Generate_Mowe(Wing1,Wing2,Fuselage);

%%
system('./Eliptical_Wing.sh');

Eliptical_Wing = readtable('Eliptical_Wing.txt','NumHeaderLines',3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%


save('Eliptical_Wing.mat','Eliptical_Wing')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
close all

CL_alpha =  readtable('Eliptical_Wing_CL.csv','NumHeaderLines',2)

CD_CL = readtable('Eliptical_Wing_CD.csv','NumHeaderLines',2)

figure(1)
plot(Eliptical_Wing.Var3,Eliptical_Wing.Var6,'-ro')
hold on
plot(CL_alpha.Var1,CL_alpha.Var2,'-bs')
grid on
figure(2)
plot(Eliptical_Wing.Var6,Eliptical_Wing.Var7,'-ro')
hold on
plot(CD_CL.Var1,CD_CL.Var2,'-bs')
xlabel('CL')
ylabel('CD')
grid on
legend('ASWING LLT with eliptical Xfoil analysis','Experimental data')

figure(3)
plot(Eliptical_Wing.Var3,Eliptical_Wing.Var7,'-ro')


figure(4)
plot(Eliptical_Wing.Var3,Eliptical_Wing.Var6./Eliptical_Wing.Var7,'-ro')

%%
Wing2.Status = false(1)
Fuselage.Status = false(1);
Xfoil_status1 = false(1);
Xfoil_status2 = false(1);
Wing1.eliptical_status = false(1);
Wing2.eliptical_status = false(1);

Generate_Mowe(Wing1,Wing2,Fuselage);

%%
[x,y] = system('./Eliptical_Wing.sh');
%%

Eliptical_Wing = readtable('Eliptical_Wing.txt','NumHeaderLines',3)

P = polyfit(CL_alpha.Var1,CL_alpha.Var2,1)
%%

clalpha = P(1);
alpha = CD_CL.Var1/clalpha-P(2)*180/pi;
figure(1)
plot(Eliptical_Wing.Var3,Eliptical_Wing.Var6,'-kd')
legend('ASWING LLT with eliptical Xfoil analysis','Experimental data','uncorrected ASWING LLT')
xlabel('\alpha')
ylabel('CL(\alpha)')
grid on
hold on

figure(3)
hold on
plot(alpha,CD_CL.Var2,'-bs');
hold on
plot(Eliptical_Wing.Var3,Eliptical_Wing.Var7+(0.00851202-0.00522832),'-kd')
legend('ASWING LLT with eliptical Xfoil analysis','Experimental data','uncorrected ASWING LLT')
xlabel('\alpha')
ylabel('CD')
grid on
figure(2)
hold on
plot(Eliptical_Wing.Var6,Eliptical_Wing.Var7,'-kd')
legend('ASWING LLT with eliptical Xfoil analysis','Experimental data','uncorrected ASWING LLT')

%%

figure(4)
plot(alpha,CD_CL.Var1./CD_CL.Var2,'-bs')
hold on
plot(Eliptical_Wing.Var3,Eliptical_Wing.Var6./Eliptical_Wing.Var7,'-kd')