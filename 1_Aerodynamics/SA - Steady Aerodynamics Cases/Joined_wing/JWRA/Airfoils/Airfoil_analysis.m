clear all ; close all ; clc


load("JWRA_Airfoil_Aswing_paramters.mat")


JWRA_Airfoil_JWR_POLAR = ...
                 readtable("JWRA_Airfoil_JWR_POLAR.txt",NumHeaderLines=11);
JWRA_Airfoil_JWJ_POLAR = ...
                 readtable("JWRA_Airfoil_JWJ_POLAR.txt",NumHeaderLines=11);
JWRA_Airfoil_JWT_POLAR = ...
                 readtable("JWRA_Airfoil_JWT_POLAR.txt",NumHeaderLines=11);
JWRA_Airfoil_JTR_POLAR = ...
                 readtable("JWRA_Airfoil_JTR_POLAR.txt",NumHeaderLines=11);
JWRA_Airfoil_JTT_POLAR = ...
                 readtable("JWRA_Airfoil_JTT_POLAR.txt",NumHeaderLines=11);


JWRA_Airfoil_JWR_alpha = JWRA_Airfoil_JWR_POLAR.Var1;
JWRA_Airfoil_JWR_CL = JWRA_Airfoil_JWR_POLAR.Var2;
JWRA_Airfoil_JWR_CD = JWRA_Airfoil_JWR_POLAR.Var3;

JWRA_Airfoil_JWJ_alpha = JWRA_Airfoil_JWJ_POLAR.Var1;
JWRA_Airfoil_JWJ_CL = JWRA_Airfoil_JWJ_POLAR.Var2;
JWRA_Airfoil_JWJ_CD = JWRA_Airfoil_JWJ_POLAR.Var3;

JWRA_Airfoil_JWT_alpha = JWRA_Airfoil_JWT_POLAR.Var1;
JWRA_Airfoil_JWT_CL = JWRA_Airfoil_JWT_POLAR.Var2;
JWRA_Airfoil_JWT_CD = JWRA_Airfoil_JWT_POLAR.Var3;

JWRA_Airfoil_JTR_alpha = JWRA_Airfoil_JTR_POLAR.Var1;
JWRA_Airfoil_JTR_CL = JWRA_Airfoil_JTR_POLAR.Var2;
JWRA_Airfoil_JTR_CD = JWRA_Airfoil_JTR_POLAR.Var3;

JWRA_Airfoil_JTT_alpha = JWRA_Airfoil_JTT_POLAR.Var1;
JWRA_Airfoil_JTT_CL = JWRA_Airfoil_JTT_POLAR.Var2;
JWRA_Airfoil_JTT_CD = JWRA_Airfoil_JTT_POLAR.Var3;

JWRA_Airfoil_JWR_Flap_derivative = ...
       readtable("JWRA_Airfoil_JWR_Flap_derivative.txt",NumHeaderLines=11);
JWRA_Airfoil_JWJ_Flap_derivative = ...
       readtable("JWRA_Airfoil_JWJ_Flap_derivative.txt",NumHeaderLines=11);
JWRA_Airfoil_JWT_Flap_derivative = ...
       readtable("JWRA_Airfoil_JWT_Flap_derivative.txt",NumHeaderLines=11);
JWRA_Airfoil_JTR_Flap_derivative = ...
       readtable("JWRA_Airfoil_JTR_Flap_derivative.txt",NumHeaderLines=11);
JWRA_Airfoil_JTT_Flap_derivative = ...
       readtable("JWRA_Airfoil_JTT_Flap_derivative.txt",NumHeaderLines=11);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Aifoil lift and drag polar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1)
subplot(3,2,1)
plot(JWRA_Airfoil_JWR_alpha,JWRA_Airfoil_JWR_CL,'rs',...
                                          MarkerFaceColor='r',MarkerSize=4)
Istart = 28;
Iend = length(JWRA_Airfoil_JWR_alpha)-32

JWRA_Airfoil_JWR.clalpha = polyfit(JWRA_Airfoil_JWR_alpha(Istart:Iend),...
                                       JWRA_Airfoil_JWR_CL(Istart:Iend),1);
hold on
plot(JWRA_Airfoil_JWR_alpha,polyval(JWRA_Airfoil_JWR.clalpha,...
                               JWRA_Airfoil_JWR_alpha),'--r',LineWidth=1.5)

hold on
xlabel('\alpha in deg')
ylabel('C_L')
ylim([-1.5 2])
legend('XFOIL data',' linear polyfit')
title('JWRA-JWR')
grid on


subplot(3,2,2)
plot(JWRA_Airfoil_JWR_alpha,JWRA_Airfoil_JWR_CD,'rs',...
                                          MarkerFaceColor='r',MarkerSize=4)
hold on
JWRA_Airfoil_JWR_CD_polyfit = ...
                     polyfit(JWRA_Airfoil_JWR_alpha,JWRA_Airfoil_JWR_CD,4);
hold on
plot(JWRA_Airfoil_JWR_alpha,...
    polyval(JWRA_Airfoil_JWR_CD_polyfit,JWRA_Airfoil_JWR_alpha),'--r',...
    LineWidth=1.5)
xlabel('\alpha in deg')
ylabel('C_D')
legend('XFOIL data',' polyfit')
title('JWRA-JWR')
ylim([0.0 0.3])
grid on

subplot(3,2,3)
plot(JWRA_Airfoil_JWJ_alpha,JWRA_Airfoil_JWJ_CL,'rs',...
                                          MarkerFaceColor='r',MarkerSize=4)
hold on
JWRA_Airfoil_JWJ.clalpha = polyfit(JWRA_Airfoil_JWJ_alpha(Istart:Iend),...
                                       JWRA_Airfoil_JWJ_CL(Istart:Iend),1);
hold on
plot(JWRA_Airfoil_JWJ_alpha,polyval(JWRA_Airfoil_JWJ.clalpha,...
                               JWRA_Airfoil_JWJ_alpha),'--r',LineWidth=1.5)
xlabel('\alpha in deg')
ylabel('C_L')
legend('XFOIL data',' linear polyfit')
title('JWRA-JWJ')
ylim([-1.5 2])
grid on


subplot(3,2,4)
plot(JWRA_Airfoil_JWJ_alpha,JWRA_Airfoil_JWJ_CD,'rs',...
                                          MarkerFaceColor='r',MarkerSize=4)
hold on
JWRA_Airfoil_JWJ_CD_polyfit = ...
                     polyfit(JWRA_Airfoil_JWJ_alpha,JWRA_Airfoil_JWJ_CD,4);
hold on
plot(JWRA_Airfoil_JWJ_alpha,...
    polyval(JWRA_Airfoil_JWJ_CD_polyfit,JWRA_Airfoil_JWJ_alpha),'--r',...
    LineWidth=1.5)
xlabel('\alpha in deg')
ylabel('C_D')
title('JWRA-JWJ')
legend('XFOIL data',' polyfit')
ylim([0.0 0.3])
grid on

subplot(3,2,5)
plot(JWRA_Airfoil_JWT_alpha,JWRA_Airfoil_JWT_CL,'rs',...
                                          MarkerFaceColor='r',MarkerSize=4)
hold on
JWRA_Airfoil_JWT.clalpha = polyfit(JWRA_Airfoil_JWT_alpha(Istart:Iend),...
                                       JWRA_Airfoil_JWT_CL(Istart:Iend),1);
hold on
plot(JWRA_Airfoil_JWT_alpha,polyval(JWRA_Airfoil_JWT.clalpha,...
                               JWRA_Airfoil_JWT_alpha),'--r',LineWidth=1.5)
xlabel('\alpha in deg')
ylabel('C_L')
title('JWRA-JWT')
legend('XFOIL data',' linear polyfit')
ylim([-1.5 2])
grid on


subplot(3,2,6)
plot(JWRA_Airfoil_JWT_alpha,JWRA_Airfoil_JWT_CD,'rs',...
                                          MarkerFaceColor='r',MarkerSize=4)
hold on
JWRA_Airfoil_JWT_CD_polyfit = ...
                     polyfit(JWRA_Airfoil_JWT_alpha,JWRA_Airfoil_JWT_CD,4);
hold on
plot(JWRA_Airfoil_JWT_alpha,...
    polyval(JWRA_Airfoil_JWT_CD_polyfit,JWRA_Airfoil_JWT_alpha),'--r',...
    LineWidth=1.5)
xlabel('\alpha in deg')
ylabel('C_D')
title('JWRA-JWT')
legend('XFOIL data',' polyfit')

ylim([0.0 0.3])
grid on
figure(2)
subplot(2,2,1)
plot(JWRA_Airfoil_JTR_alpha,JWRA_Airfoil_JTR_CL,'rs',...
                                          MarkerFaceColor='r',MarkerSize=4)
hold on
JWRA_Airfoil_JTR.clalpha = polyfit(JWRA_Airfoil_JTR_alpha(Istart:Iend),...
                                       JWRA_Airfoil_JTR_CL(Istart:Iend),1);
hold on
plot(JWRA_Airfoil_JTR_alpha,polyval(JWRA_Airfoil_JTR.clalpha,...
                               JWRA_Airfoil_JTR_alpha),'--r',LineWidth=1.5)
xlabel('\alpha in deg')
ylabel('C_L')
legend('XFOIL data',' linear polyfit')
ylim([-1.5 2])
grid on
title('JWRA-JTR')


subplot(2,2,2)
plot(JWRA_Airfoil_JTR_alpha,JWRA_Airfoil_JTR_CD,'rs',...
                                          MarkerFaceColor='r',MarkerSize=4)
hold on
JWRA_Airfoil_JTR_CD_polyfit = ...
                     polyfit(JWRA_Airfoil_JTR_alpha,JWRA_Airfoil_JTR_CD,4);
hold on
plot(JWRA_Airfoil_JTR_alpha,...
    polyval(JWRA_Airfoil_JTR_CD_polyfit,JWRA_Airfoil_JTR_alpha),'--r',...
    LineWidth=1.5)
xlabel('\alpha in deg')
ylabel('C_D')
legend('XFOIL data',' polyfit')
ylim([0.0 0.3])
grid on
title('JWRA-JTR')
subplot(2,2,3)
plot(JWRA_Airfoil_JTT_alpha,JWRA_Airfoil_JTT_CL,'rs',...
                                          MarkerFaceColor='r',MarkerSize=4)
hold on
JWRA_Airfoil_JTT.clalpha = polyfit(JWRA_Airfoil_JTT_alpha(Istart:Iend),...
                                       JWRA_Airfoil_JTT_CL(Istart:Iend),1);
hold on
plot(JWRA_Airfoil_JTT_alpha,polyval(JWRA_Airfoil_JTT.clalpha,...
                               JWRA_Airfoil_JTT_alpha),'--r',LineWidth=1.5)
xlabel('\alpha in deg')
ylabel('C_L')
legend('XFOIL data',' linear polyfit')
ylim([-1.5 2])
grid on
title('JWRA-JTT')

subplot(2,2,4)
plot(JWRA_Airfoil_JTT_alpha,JWRA_Airfoil_JTT_CD,'rs',...
                                          MarkerFaceColor='r',MarkerSize=4)
hold on
JWRA_Airfoil_JTT_CD_polyfit = ...
                     polyfit(JWRA_Airfoil_JTT_alpha,JWRA_Airfoil_JTT_CD,4);
hold on
plot(JWRA_Airfoil_JTT_alpha,...
    polyval(JWRA_Airfoil_JTT_CD_polyfit,JWRA_Airfoil_JTT_alpha),'--r',...
    LineWidth=1.5)
xlabel('\alpha in deg')
legend('XFOIL data',' polyfit')
ylabel('C_D')
ylim([0.0 0.3])
grid on
title('JWRA-JTT')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ASWING parameters from XFOIL analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

JWRA_Airfoil_JWR.CLmax = max(JWRA_Airfoil_JWR_CL);
JWRA_Airfoil_JWR.CLmin = min(JWRA_Airfoil_JWR_CL);
JWRA_Airfoil_JWR.alpha0 = -2.9622;
JWRA_Airfoil_JWR.Cdp = JWRA_Airfoil_JWR_CD_polyfit(end);
JWRA_Airfoil_JWR.Cdf = JWRA_Airfoil_JWR_CD_polyfit(end);
JWRA_Airfoil_JWR.Cm0 = -0.0809;


JWRA_Airfoil_JWJ.CLmax = max(JWRA_Airfoil_JWJ_CL);
JWRA_Airfoil_JWJ.CLmin = min(JWRA_Airfoil_JWJ_CL);
JWRA_Airfoil_JWJ.alpha0 = -2.450;
JWRA_Airfoil_JWJ.Cdp = JWRA_Airfoil_JWJ_CD_polyfit(end);
JWRA_Airfoil_JWJ.Cdf = JWRA_Airfoil_JWJ_CD_polyfit(end);
JWRA_Airfoil_JWJ.Cm0 = -0.0581;

JWRA_Airfoil_JWT.CLmax = max(JWRA_Airfoil_JWT_CL);
JWRA_Airfoil_JWT.CLmin = min(JWRA_Airfoil_JWT_CL);
JWRA_Airfoil_JWT.alpha0 = -3.0105;
JWRA_Airfoil_JWT.Cdp = JWRA_Airfoil_JWT_CD_polyfit(end);
JWRA_Airfoil_JWT.Cdf = JWRA_Airfoil_JWT_CD_polyfit(end);
JWRA_Airfoil_JWT.Cm0 = -0.0802;

JWRA_Airfoil_JTR.CLmax = max(JWRA_Airfoil_JTR_CL);
JWRA_Airfoil_JTR.CLmin = min(JWRA_Airfoil_JTR_CL);
JWRA_Airfoil_JTR.alpha0 = -1.1620;
JWRA_Airfoil_JTR.Cdp = JWRA_Airfoil_JTR_CD_polyfit(end);
JWRA_Airfoil_JTR.Cdf = JWRA_Airfoil_JTR_CD_polyfit(end);
JWRA_Airfoil_JTR.Cm0 = -0.0322;

JWRA_Airfoil_JTT.CLmax = max(JWRA_Airfoil_JTT_CL);
JWRA_Airfoil_JTT.CLmin = min(JWRA_Airfoil_JTT_CL);
JWRA_Airfoil_JTT.alpha0 = -1.1620;
JWRA_Airfoil_JTT.Cdp = JWRA_Airfoil_JTT_CD_polyfit(end);
JWRA_Airfoil_JTT.Cdf = JWRA_Airfoil_JTT_CD_polyfit(end);
JWRA_Airfoil_JTT.Cm0 = -0.0322;


save("JWRA_Airfoil_Aswing_paramters.mat",...
    "JWRA_Airfoil_JWR","JWRA_Airfoil_JWJ","JWRA_Airfoil_JWT",...
    "JWRA_Airfoil_JTR","JWRA_Airfoil_JWT");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Flaps derivatives analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

JWRA_Airfoil_JWR_deltaF = JWRA_Airfoil_JWR_Flap_derivative.Var1;
JWRA_Airfoil_JWR_alpha01 = JWRA_Airfoil_JWR_Flap_derivative.Var2;
JWRA_Airfoil_JWR_Cm01 = JWRA_Airfoil_JWR_Flap_derivative.Var3;
JWRA_Airfoil_JWR_Cd01 = JWRA_Airfoil_JWR_Flap_derivative.Var4;
JWRA_Airfoil_JWR_alpha02 = JWRA_Airfoil_JWR_Flap_derivative.Var5;
JWRA_Airfoil_JWR_Cm02 = JWRA_Airfoil_JWR_Flap_derivative.Var6;
JWRA_Airfoil_JWR_Cd02 = JWRA_Airfoil_JWR_Flap_derivative.Var7;


JWRA_Airfoil_JWJ_deltaF = JWRA_Airfoil_JWJ_Flap_derivative.Var1;
JWRA_Airfoil_JWJ_alpha01 = JWRA_Airfoil_JWJ_Flap_derivative.Var2;
JWRA_Airfoil_JWJ_Cm01 = JWRA_Airfoil_JWJ_Flap_derivative.Var3;
JWRA_Airfoil_JWJ_Cd01 = JWRA_Airfoil_JWJ_Flap_derivative.Var4;
JWRA_Airfoil_JWJ_alpha02 = JWRA_Airfoil_JWJ_Flap_derivative.Var5;
JWRA_Airfoil_JWJ_Cm02 = JWRA_Airfoil_JWJ_Flap_derivative.Var6;
JWRA_Airfoil_JWJ_Cd02 = JWRA_Airfoil_JWJ_Flap_derivative.Var7;

JWRA_Airfoil_JWT_deltaF = JWRA_Airfoil_JWT_Flap_derivative.Var1;
JWRA_Airfoil_JWT_alpha01 = JWRA_Airfoil_JWT_Flap_derivative.Var2;
JWRA_Airfoil_JWT_Cm01 = JWRA_Airfoil_JWT_Flap_derivative.Var3;
JWRA_Airfoil_JWT_Cd01 = JWRA_Airfoil_JWT_Flap_derivative.Var4;
JWRA_Airfoil_JWT_alpha02 = JWRA_Airfoil_JWT_Flap_derivative.Var5;
JWRA_Airfoil_JWT_Cm02 = JWRA_Airfoil_JWT_Flap_derivative.Var6;
JWRA_Airfoil_JWT_Cd02 = JWRA_Airfoil_JWT_Flap_derivative.Var7;

JWRA_Airfoil_JTR_deltaF = JWRA_Airfoil_JTR_Flap_derivative.Var1;
JWRA_Airfoil_JTR_alpha01 = JWRA_Airfoil_JTR_Flap_derivative.Var2;
JWRA_Airfoil_JTR_Cm01 = JWRA_Airfoil_JTR_Flap_derivative.Var3;
JWRA_Airfoil_JTR_Cd01 = JWRA_Airfoil_JTR_Flap_derivative.Var4;
JWRA_Airfoil_JTR_alpha02 = JWRA_Airfoil_JTR_Flap_derivative.Var5;
JWRA_Airfoil_JTR_Cm02 = JWRA_Airfoil_JTR_Flap_derivative.Var6;
JWRA_Airfoil_JTR_Cd02 = JWRA_Airfoil_JTR_Flap_derivative.Var7;

JWRA_Airfoil_JTT_deltaF = JWRA_Airfoil_JTT_Flap_derivative.Var1;
JWRA_Airfoil_JTT_alpha01 = JWRA_Airfoil_JTT_Flap_derivative.Var2;
JWRA_Airfoil_JTT_Cm01 = JWRA_Airfoil_JTT_Flap_derivative.Var3;
JWRA_Airfoil_JTT_Cd01 = JWRA_Airfoil_JTT_Flap_derivative.Var4;
JWRA_Airfoil_JTT_alpha02 = JWRA_Airfoil_JTT_Flap_derivative.Var5;
JWRA_Airfoil_JTT_Cm02 = JWRA_Airfoil_JTT_Flap_derivative.Var6;
JWRA_Airfoil_JTT_Cd02 = JWRA_Airfoil_JTT_Flap_derivative.Var7;


figure(3)
subplot(3,2,1)
plot(JWRA_Airfoil_JWR_deltaF,JWRA_Airfoil_JWR_alpha01,'rs',...
                                         MarkerFaceColor='r',MarkerSize=4);
hold on
JWRA_Airfoil_JWR_dalpha0_deltaF1 = ...
               polyfit(JWRA_Airfoil_JWR_deltaF,JWRA_Airfoil_JWR_alpha01,1);
plot(JWRA_Airfoil_JWR_deltaF,polyval(JWRA_Airfoil_JWR_dalpha0_deltaF1,...
      JWRA_Airfoil_JWR_deltaF),'--r')
hold on
plot(JWRA_Airfoil_JWR_deltaF,JWRA_Airfoil_JWR_alpha02,'bo',...
                                         MarkerFaceColor='b',MarkerSize=4);
hold on
JWRA_Airfoil_JWR_dalpha0_deltaF2 = ...
               polyfit(JWRA_Airfoil_JWR_deltaF,JWRA_Airfoil_JWR_alpha02,1);
plot(JWRA_Airfoil_JWR_deltaF,polyval(JWRA_Airfoil_JWR_dalpha0_deltaF2,...
      JWRA_Airfoil_JWR_deltaF),'-.b')
legend('XFOIL Re = 1E6',"linear fit Re = 1E6",...
                            "XFOIL Re = 0.625E6","linear fit Re = 0.625E6")
xlabel('\delta_F in deg (positive down flap)')
ylabel('\alpha_0 in deg')
grid on 
title('JWRA-JWR')
subplot(3,2,2)
plot(JWRA_Airfoil_JWR_deltaF,JWRA_Airfoil_JWR_Cm01,'rs',...
                                         MarkerFaceColor='r',MarkerSize=4);
hold on
JWRA_Airfoil_JWR_dCm0_deltaF1 = ...
               polyfit(JWRA_Airfoil_JWR_deltaF,JWRA_Airfoil_JWR_Cm01,1);
plot(JWRA_Airfoil_JWR_deltaF,polyval(JWRA_Airfoil_JWR_dCm0_deltaF1,...
      JWRA_Airfoil_JWR_deltaF),'--r')
hold on
plot(JWRA_Airfoil_JWR_deltaF,JWRA_Airfoil_JWR_Cm02,'bo',...
                                         MarkerFaceColor='b',MarkerSize=4);
hold on
JWRA_Airfoil_JWR_dCm0_deltaF2 = ...
               polyfit(JWRA_Airfoil_JWR_deltaF,JWRA_Airfoil_JWR_Cm02,1);
plot(JWRA_Airfoil_JWR_deltaF,polyval(JWRA_Airfoil_JWR_dCm0_deltaF2,...
      JWRA_Airfoil_JWR_deltaF),'-.b')
xlabel('\delta_F in deg (positive down flap)')
ylabel('Cm_0')
grid on 
legend('XFOIL Re = 1E6',"linear fit Re = 1E6",...
                            "XFOIL Re = 0.625E6","linear fit Re = 0.625E6")

title('JWRA-JWR')

subplot(3,2,3)
plot(JWRA_Airfoil_JWJ_deltaF,JWRA_Airfoil_JWJ_alpha01,'rs',...
                                         MarkerFaceColor='r',MarkerSize=4);
hold on
JWRA_Airfoil_JWJ_dalpha0_deltaF1 = ...
               polyfit(JWRA_Airfoil_JWJ_deltaF,JWRA_Airfoil_JWJ_alpha01,1);
plot(JWRA_Airfoil_JWJ_deltaF,polyval(JWRA_Airfoil_JWJ_dalpha0_deltaF1,...
      JWRA_Airfoil_JWJ_deltaF),'--r')
hold on
plot(JWRA_Airfoil_JWJ_deltaF,JWRA_Airfoil_JWJ_alpha02,'bo',...
                                         MarkerFaceColor='b',MarkerSize=4);
hold on
JWRA_Airfoil_JWJ_dalpha0_deltaF2 = ...
               polyfit(JWRA_Airfoil_JWJ_deltaF,JWRA_Airfoil_JWJ_alpha02,1);
plot(JWRA_Airfoil_JWJ_deltaF,polyval(JWRA_Airfoil_JWJ_dalpha0_deltaF2,...
      JWRA_Airfoil_JWJ_deltaF),'-.b')
legend('XFOIL Re = 1E6',"linear fit Re = 1E6",...
                            "XFOIL Re = 0.625E6","linear fit Re = 0.625E6")
xlabel('\delta_F in deg (positive down flap)')
ylabel('\alpha_0 in deg')
grid on 
title('JWRA-JWJ')
subplot(3,2,4)
plot(JWRA_Airfoil_JWJ_deltaF,JWRA_Airfoil_JWJ_Cm01,'rs',...
                                         MarkerFaceColor='r',MarkerSize=4);
hold on
JWRA_Airfoil_JWJ_dCm0_deltaF1 = ...
               polyfit(JWRA_Airfoil_JWJ_deltaF,JWRA_Airfoil_JWJ_Cm01,1);
plot(JWRA_Airfoil_JWJ_deltaF,polyval(JWRA_Airfoil_JWJ_dCm0_deltaF1,...
      JWRA_Airfoil_JWJ_deltaF),'--r')
hold on
plot(JWRA_Airfoil_JWJ_deltaF,JWRA_Airfoil_JWJ_Cm02,'bo',...
                                         MarkerFaceColor='b',MarkerSize=4);
hold on
JWRA_Airfoil_JWJ_dCm0_deltaF2 = ...
               polyfit(JWRA_Airfoil_JWJ_deltaF,JWRA_Airfoil_JWJ_Cm02,1);
plot(JWRA_Airfoil_JWJ_deltaF,polyval(JWRA_Airfoil_JWJ_dCm0_deltaF2,...
      JWRA_Airfoil_JWJ_deltaF),'-.b')
xlabel('\delta_F in deg (positive down flap)')
ylabel('Cm_0')
grid on 
legend('XFOIL Re = 1E6',"linear fit Re = 1E6",...
                            "XFOIL Re = 0.625E6","linear fit Re = 0.625E6")

title('JWRA-JWJ')

subplot(3,2,5)
plot(JWRA_Airfoil_JWT_deltaF,JWRA_Airfoil_JWT_alpha01,'rs',...
                                         MarkerFaceColor='r',MarkerSize=4);
hold on
JWRA_Airfoil_JWT_dalpha0_deltaF1 = ...
               polyfit(JWRA_Airfoil_JWT_deltaF,JWRA_Airfoil_JWT_alpha01,1);
plot(JWRA_Airfoil_JWT_deltaF,polyval(JWRA_Airfoil_JWT_dalpha0_deltaF1,...
      JWRA_Airfoil_JWT_deltaF),'--r')
hold on
plot(JWRA_Airfoil_JWT_deltaF,JWRA_Airfoil_JWT_alpha02,'bo',...
                                         MarkerFaceColor='b',MarkerSize=4);
hold on
JWRA_Airfoil_JWT_dalpha0_deltaF2 = ...
               polyfit(JWRA_Airfoil_JWT_deltaF,JWRA_Airfoil_JWT_alpha02,1);
plot(JWRA_Airfoil_JWT_deltaF,polyval(JWRA_Airfoil_JWT_dalpha0_deltaF2,...
      JWRA_Airfoil_JWT_deltaF),'-.b')
legend('XFOIL Re = 1E6',"linear fit Re = 1E6",...
                            "XFOIL Re = 0.625E6","linear fit Re = 0.625E6")
xlabel('\delta_F in deg (positive down flap)')
ylabel('\alpha_0 in deg')
grid on 
title('JWRA-JWT')
subplot(3,2,6)
plot(JWRA_Airfoil_JWT_deltaF,JWRA_Airfoil_JWT_Cm01,'rs',...
                                         MarkerFaceColor='r',MarkerSize=4);
hold on
JWRA_Airfoil_JWT_dCm0_deltaF1 = ...
               polyfit(JWRA_Airfoil_JWT_deltaF,JWRA_Airfoil_JWT_Cm01,1);
plot(JWRA_Airfoil_JWT_deltaF,polyval(JWRA_Airfoil_JWT_dCm0_deltaF1,...
      JWRA_Airfoil_JWT_deltaF),'--r')
hold on
plot(JWRA_Airfoil_JWT_deltaF,JWRA_Airfoil_JWT_Cm02,'bo',...
                                         MarkerFaceColor='b',MarkerSize=4);
hold on
JWRA_Airfoil_JWT_dCm0_deltaF2 = ...
               polyfit(JWRA_Airfoil_JWT_deltaF,JWRA_Airfoil_JWT_Cm02,1);
plot(JWRA_Airfoil_JWT_deltaF,polyval(JWRA_Airfoil_JWT_dCm0_deltaF2,...
      JWRA_Airfoil_JWT_deltaF),'-.b')
xlabel('\delta_F in deg (positive down flap)')
ylabel('Cm_0')
grid on 
legend('XFOIL Re = 1E6',"linear fit Re = 1E6",...
                            "XFOIL Re = 0.625E6","linear fit Re = 0.625E6")

title('JWRA-JWT')


figure(4)
subplot(3,2,1)
plot(JWRA_Airfoil_JTR_deltaF,JWRA_Airfoil_JTR_alpha01,'rs',...
                                         MarkerFaceColor='r',MarkerSize=4);
hold on
JWRA_Airfoil_JTR_dalpha0_deltaF1 = ...
               polyfit(JWRA_Airfoil_JTR_deltaF,JWRA_Airfoil_JTR_alpha01,1);
plot(JWRA_Airfoil_JTR_deltaF,polyval(JWRA_Airfoil_JTR_dalpha0_deltaF1,...
      JWRA_Airfoil_JTR_deltaF),'--r')
hold on
plot(JWRA_Airfoil_JTR_deltaF,JWRA_Airfoil_JTR_alpha02,'bo',...
                                         MarkerFaceColor='b',MarkerSize=4);
hold on
JWRA_Airfoil_JTR_dalpha0_deltaF2 = ...
               polyfit(JWRA_Airfoil_JTR_deltaF,JWRA_Airfoil_JTR_alpha02,1);
plot(JWRA_Airfoil_JTR_deltaF,polyval(JWRA_Airfoil_JTR_dalpha0_deltaF2,...
      JWRA_Airfoil_JTR_deltaF),'-.b')
legend('XFOIL Re = 1E6',"linear fit Re = 1E6",...
                            "XFOIL Re = 0.625E6","linear fit Re = 0.625E6")
xlabel('\delta_F in deg (positive down flap)')
ylabel('\alpha_0 in deg')
grid on 
title('JWRA-JTR')
subplot(3,2,2)
plot(JWRA_Airfoil_JTR_deltaF,JWRA_Airfoil_JTR_Cm01,'rs',...
                                         MarkerFaceColor='r',MarkerSize=4);
hold on
JWRA_Airfoil_JTR_dCm0_deltaF1 = ...
               polyfit(JWRA_Airfoil_JTR_deltaF,JWRA_Airfoil_JTR_Cm01,1);
plot(JWRA_Airfoil_JTR_deltaF,polyval(JWRA_Airfoil_JTR_dCm0_deltaF1,...
      JWRA_Airfoil_JTR_deltaF),'--r')
hold on
plot(JWRA_Airfoil_JTR_deltaF,JWRA_Airfoil_JTR_Cm02,'bo',...
                                         MarkerFaceColor='b',MarkerSize=4);
hold on
JWRA_Airfoil_JTR_dCm0_deltaF2 = ...
               polyfit(JWRA_Airfoil_JTR_deltaF,JWRA_Airfoil_JTR_Cm02,1);
plot(JWRA_Airfoil_JTR_deltaF,polyval(JWRA_Airfoil_JTR_dCm0_deltaF2,...
      JWRA_Airfoil_JTR_deltaF),'-.b')
xlabel('\delta_F in deg (positive down flap)')
ylabel('Cm_0')
grid on 
legend('XFOIL Re = 1E6',"linear fit Re = 1E6",...
                            "XFOIL Re = 0.625E6","linear fit Re = 0.625E6")

title('JWRA-JTR')

subplot(2,2,3)
plot(JWRA_Airfoil_JTT_deltaF,JWRA_Airfoil_JTT_alpha01,'rs',...
                                         MarkerFaceColor='r',MarkerSize=4);
hold on
JWRA_Airfoil_JTT_dalpha0_deltaF1 = ...
               polyfit(JWRA_Airfoil_JTT_deltaF,JWRA_Airfoil_JTT_alpha01,1);
plot(JWRA_Airfoil_JTT_deltaF,polyval(JWRA_Airfoil_JTT_dalpha0_deltaF1,...
      JWRA_Airfoil_JTT_deltaF),'--r')
hold on
plot(JWRA_Airfoil_JTT_deltaF,JWRA_Airfoil_JTT_alpha02,'bo',...
                                         MarkerFaceColor='b',MarkerSize=4);
hold on
JWRA_Airfoil_JTT_dalpha0_deltaF2 = ...
               polyfit(JWRA_Airfoil_JTT_deltaF,JWRA_Airfoil_JTT_alpha02,1);
plot(JWRA_Airfoil_JTT_deltaF,polyval(JWRA_Airfoil_JTT_dalpha0_deltaF2,...
      JWRA_Airfoil_JTT_deltaF),'-.b')
legend('XFOIL Re = 1E6',"linear fit Re = 1E6",...
                            "XFOIL Re = 0.625E6","linear fit Re = 0.625E6")
xlabel('\delta_F in deg (positive down flap)')
ylabel('\alpha_0 in deg')
grid on 
title('JWRA-JTT')
subplot(2,2,4)
plot(JWRA_Airfoil_JTT_deltaF,JWRA_Airfoil_JTT_Cm01,'rs',...
                                         MarkerFaceColor='r',MarkerSize=4);
hold on
JWRA_Airfoil_JTT_dCm0_deltaF1 = ...
               polyfit(JWRA_Airfoil_JTT_deltaF,JWRA_Airfoil_JTT_Cm01,1);
plot(JWRA_Airfoil_JTT_deltaF,polyval(JWRA_Airfoil_JTT_dCm0_deltaF1,...
      JWRA_Airfoil_JTT_deltaF),'--r')
hold on
plot(JWRA_Airfoil_JTT_deltaF,JWRA_Airfoil_JTT_Cm02,'bo',...
                                         MarkerFaceColor='b',MarkerSize=4);
hold on
JWRA_Airfoil_JTT_dCm0_deltaF2 = ...
               polyfit(JWRA_Airfoil_JTT_deltaF,JWRA_Airfoil_JTT_Cm02,1);
plot(JWRA_Airfoil_JTT_deltaF,polyval(JWRA_Airfoil_JTT_dCm0_deltaF2,...
      JWRA_Airfoil_JTT_deltaF),'-.b')
xlabel('\delta_F in deg (positive down flap)')
ylabel('Cm_0')
grid on 
legend('XFOIL Re = 1E6',"linear fit Re = 1E6",...
                            "XFOIL Re = 0.625E6","linear fit Re = 0.625E6")

title('JWRA-JTT')


JWRA_Airfoil_JWR.dalpha0_ddeltaF=mean([JWRA_Airfoil_JWR_dalpha0_deltaF1(1)...
                                        JWRA_Airfoil_JWR_dalpha0_deltaF2(1)]);

JWRA_Airfoil_JWJ.dalpha0_ddeltaF=mean([JWRA_Airfoil_JWJ_dalpha0_deltaF1(1)...
                                        JWRA_Airfoil_JWJ_dalpha0_deltaF2(1)]);

JWRA_Airfoil_JWT.dalpha0_ddeltaF=mean([JWRA_Airfoil_JWT_dalpha0_deltaF1(1)...
                                        JWRA_Airfoil_JWT_dalpha0_deltaF2(1)]);

JWRA_Airfoil_JTR.dalpha0_ddeltaF=mean([JWRA_Airfoil_JTR_dalpha0_deltaF1(1)...
                                        JWRA_Airfoil_JTR_dalpha0_deltaF2(1)]);

JWRA_Airfoil_JTT.dalpha0_ddeltaF=mean([JWRA_Airfoil_JTT_dalpha0_deltaF1(1)...
                                        JWRA_Airfoil_JTT_dalpha0_deltaF2(1)]);


JWRA_Airfoil_JWR.dCm0_ddeltaF=mean([JWRA_Airfoil_JWR_dCm0_deltaF1(1)...
                                        JWRA_Airfoil_JWR_dCm0_deltaF2(1)]);

JWRA_Airfoil_JWJ.dCm0_ddeltaF=mean([JWRA_Airfoil_JWJ_dCm0_deltaF1(1)...
                                        JWRA_Airfoil_JWJ_dCm0_deltaF2(1)]);

JWRA_Airfoil_JWT.dCm0_ddeltaF=mean([JWRA_Airfoil_JWT_dCm0_deltaF1(1)...
                                        JWRA_Airfoil_JWT_dCm0_deltaF2(1)]);

JWRA_Airfoil_JTR.dCm0_ddeltaF=mean([JWRA_Airfoil_JTR_dCm0_deltaF1(1)...
                                        JWRA_Airfoil_JTR_dCm0_deltaF2(1)]);

JWRA_Airfoil_JTT.dCm0_ddeltaF=mean([JWRA_Airfoil_JTT_dCm0_deltaF1...
                                        JWRA_Airfoil_JTT_dCm0_deltaF2(1)]);

save("JWRA_Airfoil_Aswing_paramters.mat",...
    "JWRA_Airfoil_JWR","JWRA_Airfoil_JWJ","JWRA_Airfoil_JWT",...
    "JWRA_Airfoil_JTR","JWRA_Airfoil_JWT");
