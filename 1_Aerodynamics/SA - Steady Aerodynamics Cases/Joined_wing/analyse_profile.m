clear all ; close all; clc

JW_MP_IN = readtable("JW_MP_IN_POLAR.txt",NumHeaderLines=11);

JW_MP_IN.alpha = JW_MP_IN.Var1;
JW_MP_IN.CL = JW_MP_IN.Var2;
JW_MP_IN.CD = JW_MP_IN.Var3;
JW_MP_IN.CDp = JW_MP_IN.Var4;
JW_MP_IN.CDf = JW_MP_IN.CD-JW_MP_IN.CDp;
JW_MP_IN_CL_LIN_Istart = 13;
JW_MP_IN_CL_LIN_Iend = length(JW_MP_IN.CL)-20;
JW_MP_OUT = readtable("JW_MP_OUT_POLAR.txt",NumHeaderLines=11);

JW_MP_OUT.alpha = JW_MP_OUT.Var1;
JW_MP_OUT.CL = JW_MP_OUT.Var2;
JW_MP_OUT.CD = JW_MP_OUT.Var3;
JW_MP_OUT.CDp = JW_MP_OUT.Var4;
JW_MP_OUT.CDf = JW_MP_OUT.CD-JW_MP_OUT.CDp;
JW_MP_OUT_CL_LIN_Istart = 12;
JW_MP_OUT_CL_LIN_Iend = length(JW_MP_OUT.CL)-20;



figure(1)
plot(JW_MP_IN.alpha,JW_MP_IN.CL,'ro')
hold on
p1 = polyfit(JW_MP_IN.alpha(JW_MP_IN_CL_LIN_Istart:JW_MP_IN_CL_LIN_Iend),JW_MP_IN.CL(JW_MP_IN_CL_LIN_Istart:JW_MP_IN_CL_LIN_Iend),1);
plot(JW_MP_IN.alpha(JW_MP_IN_CL_LIN_Istart:JW_MP_IN_CL_LIN_Iend),polyval(p1,JW_MP_IN.alpha(JW_MP_IN_CL_LIN_Istart:JW_MP_IN_CL_LIN_Iend)),'-r',LineWidth=2.0)
leg1 = "inboard linear fit : c_{l,\alpha} " + num2str(p1(1)*180/pi);
JW_MP_IN_dcl_dalpha = p1(1)*180/pi;
hold on
plot(JW_MP_OUT.alpha,JW_MP_OUT.CL,'bs')
hold on
p2 = polyfit(JW_MP_OUT.alpha(JW_MP_OUT_CL_LIN_Istart:JW_MP_OUT_CL_LIN_Iend),JW_MP_OUT.CL(JW_MP_OUT_CL_LIN_Istart:JW_MP_OUT_CL_LIN_Iend),1);
plot(JW_MP_OUT.alpha(JW_MP_OUT_CL_LIN_Istart:JW_MP_OUT_CL_LIN_Iend),polyval(p2,JW_MP_OUT.alpha(JW_MP_OUT_CL_LIN_Istart:JW_MP_OUT_CL_LIN_Iend)),'--b',LineWidth=2.0)
leg2 = "outboard linear fit : c_{l,\alpha} " + num2str(p2(1)*180/pi);
JW_MP_OUT_dcl_dalpha = p2(1)*180/pi;
xlabel('angle of attack')
ylabel('C_L')
legend('inboard : XFOIL data',leg1,'outboard : XFOIL data',leg2)
grid on

figure(2)
plot(JW_MP_IN.CL,JW_MP_IN.CDp,'ro')
hold on
p = polyfit(JW_MP_IN.CL(JW_MP_IN_CL_LIN_Istart:JW_MP_IN_CL_LIN_Iend),JW_MP_IN.CDp(JW_MP_IN_CL_LIN_Istart:JW_MP_IN_CL_LIN_Iend),4);
plot(JW_MP_IN.CL(JW_MP_IN_CL_LIN_Istart:JW_MP_IN_CL_LIN_Iend),polyval(p,JW_MP_IN.CL(JW_MP_IN_CL_LIN_Istart:JW_MP_IN_CL_LIN_Iend)),'-r',LineWidth=2.0)
JW_MP_IN_CDp = p;
hold on
plot(JW_MP_OUT.CL,JW_MP_OUT.CDp,'bs')
hold on
p = polyfit(JW_MP_OUT.CL(JW_MP_OUT_CL_LIN_Istart:JW_MP_OUT_CL_LIN_Iend),JW_MP_OUT.CDp(JW_MP_OUT_CL_LIN_Istart:JW_MP_OUT_CL_LIN_Iend),4);
plot(JW_MP_OUT.CL(JW_MP_OUT_CL_LIN_Istart:JW_MP_OUT_CL_LIN_Iend),polyval(p,JW_MP_OUT.CL(JW_MP_OUT_CL_LIN_Istart:JW_MP_OUT_CL_LIN_Iend)),'--b',LineWidth=2.0)
JW_MP_OUT_CDp = p;
xlabel('C_L')
ylabel('C_Dp')
legend('inboard : XFOIL data','inboard : polyfit','outboard : XFOIL data','outboard : polyfit')
grid on

figure(3)
plot(JW_MP_IN.CL,JW_MP_IN.CDf,'ro')
hold on
p = polyfit(JW_MP_IN.CL(JW_MP_IN_CL_LIN_Istart:JW_MP_IN_CL_LIN_Iend),JW_MP_IN.CDf(JW_MP_IN_CL_LIN_Istart:JW_MP_IN_CL_LIN_Iend),4);
plot(JW_MP_IN.CL(JW_MP_IN_CL_LIN_Istart:JW_MP_IN_CL_LIN_Iend),polyval(p,JW_MP_IN.CL(JW_MP_IN_CL_LIN_Istart:JW_MP_IN_CL_LIN_Iend)),'-r',LineWidth=2.0)
JW_MP_IN_CDf = p;
hold on
plot(JW_MP_OUT.CL,JW_MP_OUT.CDf,'bs')

hold on
p = polyfit(JW_MP_OUT.CL(JW_MP_OUT_CL_LIN_Istart:JW_MP_OUT_CL_LIN_Iend),JW_MP_OUT.CDf(JW_MP_OUT_CL_LIN_Istart:JW_MP_OUT_CL_LIN_Iend),4);
plot(JW_MP_OUT.CL(JW_MP_OUT_CL_LIN_Istart:JW_MP_OUT_CL_LIN_Iend),polyval(p,JW_MP_OUT.CL(JW_MP_OUT_CL_LIN_Istart:JW_MP_OUT_CL_LIN_Iend)),'--b',LineWidth=2.0)
JW_MP_OUT_CDf = p;

xlabel('C_L')
legend('inboard : XFOIL data','inboard : polyfit','outboard : XFOIL data','inboard : polyfit','outboard : polyfit')
ylabel('C_Df')
grid on



JW_FW_IN = readtable("JW_FW_IN_POLAR.txt",NumHeaderLines=11);

JW_FW_IN.alpha = JW_FW_IN.Var1;
JW_FW_IN.CL = JW_FW_IN.Var2;
JW_FW_IN.CD = JW_FW_IN.Var3;
JW_FW_IN.CDp = JW_FW_IN.Var4;
JW_FW_IN.CDf = JW_FW_IN.CD-JW_FW_IN.CDp;
JW_FW_IN_CL_LIN_Istart = 25;
JW_FW_IN_CL_LIN_Iend = length(JW_FW_IN.CL)-20;
JW_FW_OUT = readtable("JW_FW_OUT_POLAR.txt",NumHeaderLines=11);

JW_FW_OUT.alpha = JW_FW_OUT.Var1;
JW_FW_OUT.CL = JW_FW_OUT.Var2;
JW_FW_OUT.CD = JW_FW_OUT.Var3;
JW_FW_OUT.CDp = JW_FW_OUT.Var4;
JW_FW_OUT.CDf = JW_FW_OUT.CD-JW_FW_OUT.CDp;
JW_FW_OUT_CL_LIN_Istart = 1;
JW_FW_OUT_CL_LIN_Iend = length(JW_FW_OUT.CL)-20;



figure(4)
plot(JW_FW_IN.alpha,JW_FW_IN.CL,'ro')
hold on
p1 = polyfit(JW_FW_IN.alpha(JW_FW_IN_CL_LIN_Istart:JW_FW_IN_CL_LIN_Iend),JW_FW_IN.CL(JW_FW_IN_CL_LIN_Istart:JW_FW_IN_CL_LIN_Iend),1);
plot(JW_FW_IN.alpha(JW_FW_IN_CL_LIN_Istart:JW_FW_IN_CL_LIN_Iend),polyval(p1,JW_FW_IN.alpha(JW_FW_IN_CL_LIN_Istart:JW_FW_IN_CL_LIN_Iend)),'-r',LineWidth=2.0)
leg1 = "inboard linear fit : c_{l,\alpha} " + num2str(p1(1)*180/pi);
JW_FW_IN_dcl_dalpha = p1(1)*180/pi;
hold on
plot(JW_FW_OUT.alpha,JW_FW_OUT.CL,'bs')
hold on
p2 = polyfit(JW_FW_OUT.alpha(JW_FW_OUT_CL_LIN_Istart:JW_FW_OUT_CL_LIN_Iend),JW_FW_OUT.CL(JW_FW_OUT_CL_LIN_Istart:JW_FW_OUT_CL_LIN_Iend),1);
plot(JW_FW_OUT.alpha(JW_FW_OUT_CL_LIN_Istart:JW_FW_OUT_CL_LIN_Iend),polyval(p2,JW_FW_OUT.alpha(JW_FW_OUT_CL_LIN_Istart:JW_FW_OUT_CL_LIN_Iend)),'--b',LineWidth=2.0)
leg2 = "outboard linear fit : c_{l,\alpha} " + num2str(p2(1)*180/pi);
JW_FW_OUT_dcl_dalpha = p2(1)*180/pi;

xlabel('angle of attack')
ylabel('C_L')
legend('inboard : XFOIL data',leg1,'outboard : XFOIL data',leg2)
grid on

figure(5)
plot(JW_FW_IN.CL,JW_FW_IN.CDp,'ro')
hold on
p = polyfit(JW_FW_IN.CL(JW_FW_IN_CL_LIN_Istart:JW_FW_IN_CL_LIN_Iend),JW_FW_IN.CDp(JW_FW_IN_CL_LIN_Istart:JW_FW_IN_CL_LIN_Iend),4);
plot(JW_FW_IN.CL(JW_FW_IN_CL_LIN_Istart:JW_FW_IN_CL_LIN_Iend),polyval(p,JW_FW_IN.CL(JW_FW_IN_CL_LIN_Istart:JW_FW_IN_CL_LIN_Iend)),'-r',LineWidth=2.0)
JW_FW_IN_CDp = p;
hold on
plot(JW_FW_OUT.CL,JW_FW_OUT.CDp,'bs')
hold on
p = polyfit(JW_FW_OUT.CL(JW_FW_OUT_CL_LIN_Istart:JW_FW_OUT_CL_LIN_Iend),JW_FW_OUT.CDp(JW_FW_OUT_CL_LIN_Istart:JW_FW_OUT_CL_LIN_Iend),4);
plot(JW_FW_OUT.CL(JW_FW_OUT_CL_LIN_Istart:JW_FW_OUT_CL_LIN_Iend),polyval(p,JW_FW_OUT.CL(JW_FW_OUT_CL_LIN_Istart:JW_FW_OUT_CL_LIN_Iend)),'--b',LineWidth=2.0)
JW_FW_OUT_CDp = p;
xlabel('C_L')
ylabel('C_Dp')
legend('inboard : XFOIL data','inboard : polyfit','outboard : XFOIL data','outboard : polyfit')
grid on

figure(6)
plot(JW_FW_IN.CL,JW_FW_IN.CDf,'ro')
hold on
p = polyfit(JW_FW_IN.CL(JW_FW_IN_CL_LIN_Istart:JW_FW_IN_CL_LIN_Iend),JW_FW_IN.CDf(JW_FW_IN_CL_LIN_Istart:JW_FW_IN_CL_LIN_Iend),4);
JW_FW_IN_CDf = p;
plot(JW_FW_IN.CL(JW_FW_IN_CL_LIN_Istart:JW_FW_IN_CL_LIN_Iend),polyval(p,JW_FW_IN.CL(JW_FW_IN_CL_LIN_Istart:JW_FW_IN_CL_LIN_Iend)),'-r',LineWidth=2.0)
hold on

plot(JW_FW_OUT.CL,JW_FW_OUT.CDf,'bs')
hold on
p = polyfit(JW_FW_OUT.CL(JW_FW_OUT_CL_LIN_Istart:JW_FW_OUT_CL_LIN_Iend),JW_FW_OUT.CDf(JW_FW_OUT_CL_LIN_Istart:JW_FW_OUT_CL_LIN_Iend),4);
JW_FW_OUT_CDf = p;
plot(JW_FW_OUT.CL(JW_FW_OUT_CL_LIN_Istart:JW_FW_OUT_CL_LIN_Iend),polyval(p,JW_FW_OUT.CL(JW_FW_OUT_CL_LIN_Istart:JW_FW_OUT_CL_LIN_Iend)),'--b',LineWidth=2.0)

xlabel('C_L')
legend('inboard : XFOIL data','inboard : polyfit','outboard : XFOIL data','inboard : polyfit','outboard : polyfit')
ylabel('C_Df')
grid on


JW_RW_IN = readtable("JW_RW_IN_POLAR.txt",NumHeaderLines=11); 

JW_RW_IN.alpha = JW_RW_IN.Var1;
JW_RW_IN.CL = JW_RW_IN.Var2;
JW_RW_IN.CD = JW_RW_IN.Var3;
JW_RW_IN.CDp = JW_RW_IN.Var4;
JW_RW_IN.CDf = JW_RW_IN.CD-JW_RW_IN.CDp;
JW_RW_IN_CL_LIN_Istart = 25;
JW_RW_IN_CL_LIN_Iend = length(JW_RW_IN.CL)-25;
JW_RW_OUT = readtable("JW_RW_OUT_POLAR.txt",NumHeaderLines=11); 

JW_RW_OUT.alpha = JW_RW_OUT.Var1;
JW_RW_OUT.CL = JW_RW_OUT.Var2;
JW_RW_OUT.CD = JW_RW_OUT.Var3;
JW_RW_OUT.CDp = JW_RW_OUT.Var4;
JW_RW_OUT.CDf = JW_RW_OUT.CD-JW_RW_OUT.CDp;
JW_RW_OUT_CL_LIN_Istart = 25;
JW_RW_OUT_CL_LIN_Iend = length(JW_RW_OUT.CL)-25;



figure(7)
plot(JW_RW_IN.alpha,JW_RW_IN.CL,'ro')
hold on
p1 = polyfit(JW_RW_IN.alpha(JW_RW_IN_CL_LIN_Istart:JW_RW_IN_CL_LIN_Iend),JW_RW_IN.CL(JW_RW_IN_CL_LIN_Istart:JW_RW_IN_CL_LIN_Iend),1);
plot(JW_RW_IN.alpha(JW_RW_IN_CL_LIN_Istart:JW_RW_IN_CL_LIN_Iend),polyval(p1,JW_RW_IN.alpha(JW_RW_IN_CL_LIN_Istart:JW_RW_IN_CL_LIN_Iend)),'-r',LineWidth=2.0)
leg1 = "inboard linear fit : c_{l,\alpha} " + num2str(p1(1)*180/pi);
JW_RW_IN_dcl_dalpha = p1(1)*180/pi;
hold on
plot(JW_RW_OUT.alpha,JW_RW_OUT.CL,'bs')
hold on
p2 = polyfit(JW_RW_OUT.alpha(JW_RW_OUT_CL_LIN_Istart:JW_RW_OUT_CL_LIN_Iend),JW_RW_OUT.CL(JW_RW_OUT_CL_LIN_Istart:JW_RW_OUT_CL_LIN_Iend),1);
plot(JW_RW_OUT.alpha(JW_RW_OUT_CL_LIN_Istart:JW_RW_OUT_CL_LIN_Iend),polyval(p2,JW_RW_OUT.alpha(JW_RW_OUT_CL_LIN_Istart:JW_RW_OUT_CL_LIN_Iend)),'--b',LineWidth=2.0)
leg2 = "outboard linear fit : c_{l,\alpha} " + num2str(p2(1)*180/pi);
JW_RW_OUT_dcl_dalpha = p2(1)*180/pi;


xlabel('angle of attack')
ylabel('C_L')
legend('inboard : XFOIL data',leg1,'outboard : XFOIL data',leg2)
grid on

figure(8)
plot(JW_RW_IN.CL,JW_RW_IN.CDp,'ro')
hold on
p = polyfit(JW_RW_IN.CL(JW_RW_IN_CL_LIN_Istart:JW_RW_IN_CL_LIN_Iend),JW_RW_IN.CDp(JW_RW_IN_CL_LIN_Istart:JW_RW_IN_CL_LIN_Iend),4);
JW_RW_IN_CDp = p;
plot(JW_RW_IN.CL(JW_RW_IN_CL_LIN_Istart:JW_RW_IN_CL_LIN_Iend),polyval(p,JW_RW_IN.CL(JW_RW_IN_CL_LIN_Istart:JW_RW_IN_CL_LIN_Iend)),'-r',LineWidth=2.0)

hold on
plot(JW_RW_OUT.CL,JW_RW_OUT.CDp,'bs')
hold on
p = polyfit(JW_RW_OUT.CL(JW_RW_OUT_CL_LIN_Istart:JW_RW_OUT_CL_LIN_Iend),JW_RW_OUT.CDp(JW_RW_OUT_CL_LIN_Istart:JW_RW_OUT_CL_LIN_Iend),4);
JW_RW_OUT_CDp = p;
plot(JW_RW_OUT.CL(JW_RW_OUT_CL_LIN_Istart:JW_RW_OUT_CL_LIN_Iend),polyval(p,JW_RW_OUT.CL(JW_RW_OUT_CL_LIN_Istart:JW_RW_OUT_CL_LIN_Iend)),'--b',LineWidth=2.0)
xlabel('C_L')
ylabel('C_Dp')
legend('inboard : XFOIL data','inboard : polyfit','outboard : XFOIL data','outboard : polyfit')
grid on

figure(9)
plot(JW_RW_IN.CL,JW_RW_IN.CDf,'ro')
hold on
p = polyfit(JW_RW_IN.CL(JW_RW_IN_CL_LIN_Istart:JW_RW_IN_CL_LIN_Iend),JW_RW_IN.CDf(JW_RW_IN_CL_LIN_Istart:JW_RW_IN_CL_LIN_Iend),4);
JW_RW_IN_CDf = p;
plot(JW_RW_IN.CL(JW_RW_IN_CL_LIN_Istart:JW_RW_IN_CL_LIN_Iend),polyval(p,JW_RW_IN.CL(JW_RW_IN_CL_LIN_Istart:JW_RW_IN_CL_LIN_Iend)),'-r',LineWidth=2.0)
hold on
plot(JW_RW_OUT.CL,JW_RW_OUT.CDf,'bs')
hold on
p = polyfit(JW_RW_OUT.CL(JW_RW_OUT_CL_LIN_Istart:JW_RW_OUT_CL_LIN_Iend),JW_RW_OUT.CDf(JW_RW_OUT_CL_LIN_Istart:JW_RW_OUT_CL_LIN_Iend),4);
JW_RW_OUT_CDf = p;
plot(JW_RW_OUT.CL(JW_RW_OUT_CL_LIN_Istart:JW_RW_OUT_CL_LIN_Iend),polyval(p,JW_RW_OUT.CL(JW_RW_OUT_CL_LIN_Istart:JW_RW_OUT_CL_LIN_Iend)),'--b',LineWidth=2.0)

xlabel('C_L')
legend('inboard : XFOIL data','inboard : polyfit','outboard : XFOIL data','inboard : polyfit','outboard : polyfit')
ylabel('C_Df')
grid on

save("profile_analysis.mat","JW_MP_IN_dcl_dalpha","JW_MP_OUT_dcl_dalpha","JW_MP_IN_CDf","JW_MP_IN_CDp","JW_MP_OUT_CDf","JW_MP_OUT_CDp",...
    "JW_RW_IN_dcl_dalpha","JW_RW_OUT_dcl_dalpha","JW_RW_IN_CDf","JW_RW_IN_CDp","JW_RW_OUT_CDf","JW_RW_OUT_CDp",...
    "JW_FW_IN_dcl_dalpha","JW_FW_OUT_dcl_dalpha","JW_FW_IN_CDf","JW_FW_IN_CDp","JW_FW_OUT_CDf","JW_FW_OUT_CDp")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load("profile_analysis.mat")

JW_MP_IN_dcl_dalpha
JW_MP_OUT_dcl_dalpha
JW_MP_IN_CDf 
JW_MP_IN_CDp
JW_MP_OUT_CDf 
JW_MP_OUT_CDp


JW_FW_IN_dcl_dalpha
JW_FW_OUT_dcl_dalpha
JW_FW_IN_CDf 
JW_FW_IN_CDp
JW_FW_OUT_CDf 
JW_FW_OUT_CDp


JW_RW_IN_dcl_dalpha
JW_RW_OUT_dcl_dalpha
JW_RW_IN_CDf 
JW_RW_IN_CDp
JW_RW_OUT_CDf 
JW_RW_OUT_CDp


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fuselage drag polyfit for drag correction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha = [
-6.25
-3.25
-0.25
2.75
5.75
8.75
11.75];

CD = [0.027
0.0249
0.0235
0.0236
0.0254
0.0287
0.0346];

p_fuse = polyfit(alpha,CD,3)

alpha_cont = linspace(alpha(1),alpha(end),100)
figure (10)
plot(alpha,CD,'rs')
hold on
plot(alpha_cont,polyval(p_fuse,alpha_cont),'--r',LineWidth=2.0)
xlabel('angle of attack in deg')
ylabel('C_D')
grid on
legend('Exp','Polyfit')