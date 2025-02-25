clear all 
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run simulation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% system('sh ./Rectangular_Wing_No_Flap_hc_inf.sh')
% system('sh ./Rectangular_Wing_No_Flap_hc_2.sh')
% system('sh ./Rectangular_Wing_No_Flap_hc_05.sh')
% 
% system('sh ./Rectangular_Wing_Flap_hc_inf.sh')
% system('sh ./Rectangular_Wing_Flap_hc_2.sh')
% system('sh ./Rectangular_Wing_Flap_hc_05.sh')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Rectangular wing with no flaps 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
No_flap_rect_CL = readtable('No_flap_Rect_CL.csv',NumHeaderLines=2);
No_flap_rect_CD = readtable('No_flap_Rect_CD.csv',NumHeaderLines=2);

rect_ASWING_h_c_05 = readtable('Rectangular_Wing_No_Flap_hc_05.txt',...
                                                         NumHeaderLines=3);
rect_ASWING_h_c_05_alpha = rect_ASWING_h_c_05.Var5;
rect_ASWING_h_c_05_CL = rect_ASWING_h_c_05.Var6;
rect_ASWING_h_c_05_CD = rect_ASWING_h_c_05.Var7;
rect_ASWING_h_c_05_CDi = rect_ASWING_h_c_05.Var8;
rect_ASWING_h_c_05_CM = rect_ASWING_h_c_05.Var9;

rect_ASWING_h_c_2 = readtable('Rectangular_Wing_No_Flap_hc_2.txt',...
                                                         NumHeaderLines=3);
rect_ASWING_h_c_2_alpha = rect_ASWING_h_c_2.Var5;
rect_ASWING_h_c_2_CL = rect_ASWING_h_c_2.Var6;
rect_ASWING_h_c_2_CD = rect_ASWING_h_c_2.Var7;
rect_ASWING_h_c_2_CDi = rect_ASWING_h_c_2.Var8;
rect_ASWING_h_c_2_CM = rect_ASWING_h_c_2.Var9;

rect_ASWING_h_c_inf = readtable('Rectangular_Wing_No_Flap_hc_inf.txt',...
                                                         NumHeaderLines=3);
rect_ASWING_h_c_inf_alpha = rect_ASWING_h_c_inf.Var5;
rect_ASWING_h_c_inf_CL = rect_ASWING_h_c_inf.Var6;
rect_ASWING_h_c_inf_CD = rect_ASWING_h_c_inf.Var7;
rect_ASWING_h_c_inf_CDi = rect_ASWING_h_c_inf.Var8;
rect_ASWING_h_c_inf_CM = rect_ASWING_h_c_inf.Var9;

figure(1)
plot(No_flap_rect_CL.Var1,No_flap_rect_CL.Var2,'ko',MarkerFaceColor='k',LineWidth=1.5)
hold on
plot(No_flap_rect_CL.Var3,No_flap_rect_CL.Var4,'ks',MarkerFaceColor='k',LineWidth=1.5)
hold on
plot(No_flap_rect_CL.Var5,No_flap_rect_CL.Var6,'kd',MarkerFaceColor='k',LineWidth=1.5)

hold on 
plot(rect_ASWING_h_c_05_alpha,rect_ASWING_h_c_05_CL,'--r',LineWidth=1.5)
hold on 
plot(rect_ASWING_h_c_2_alpha,rect_ASWING_h_c_2_CL,'-r',LineWidth=1.5)
hold on 
plot(rect_ASWING_h_c_inf_alpha,rect_ASWING_h_c_inf_CL,'-.r',LineWidth=1.5)


x = No_flap_rect_CL.Var1(1:end-3);
y = No_flap_rect_CL.Var2(1:end-3);
p= polyfit(x,y,1);
exp_hc_05_clalpha = p(1)*180/pi

x = No_flap_rect_CL.Var3(1:end-3);
y = No_flap_rect_CL.Var4(1:end-3);
p= polyfit(x,y,1);
exp_hc_2_clalpha = p(1)*180/pi

x = No_flap_rect_CL.Var5(1:end-3);
y = No_flap_rect_CL.Var6(1:end-3);
p= polyfit(x,y,1);
exp_hc_inf_clalpha = p(1)*180/pi;


x = rect_ASWING_h_c_05_alpha(1:end-12);
y = rect_ASWING_h_c_05_CL(1:end-12);
p= polyfit(x,y,1);
aswing_hc_05_clalpha = p(1)*180/pi

x = rect_ASWING_h_c_2_alpha(1:end-8);
y = rect_ASWING_h_c_2_CL(1:end-8);
p= polyfit(x,y,1);
aswing_hc_2_clalpha = p(1)*180/pi

x = rect_ASWING_h_c_inf_alpha(1:end-8);
y = rect_ASWING_h_c_inf_CL(1:end-8);
p= polyfit(x,y,1);
aswing_hc_inf_clalpha = p(1)*180/pi

exp_deltaclalpha_hc_05 = 100*(exp_hc_05_clalpha-exp_hc_inf_clalpha)/exp_hc_inf_clalpha
exp_deltaclalpha_hc_2 = 100*(exp_hc_2_clalpha-exp_hc_inf_clalpha)/exp_hc_inf_clalpha

epsilon_clalpha_h05 = 100*(aswing_hc_05_clalpha-exp_hc_05_clalpha)/exp_hc_05_clalpha
epsilon_clalpha_h2 = 100*(aswing_hc_2_clalpha-exp_hc_2_clalpha)/exp_hc_2_clalpha
epsilon_clalpha_hinf = 100*(aswing_hc_inf_clalpha-exp_hc_inf_clalpha)/exp_hc_inf_clalpha


leg1 = "Exp h/c = 0.5, $\Delta Cl_{\alpha,\infty}$ = +" + num2str(exp_deltaclalpha_hc_05) + "  \%"
leg2 = "Exp h/c = 2, $\Delta Cl_{\alpha,\infty}$ = +" + num2str(exp_deltaclalpha_hc_2) + "  \%"
leg3 = "Exp h/c = $+\infty$, $ Cl_{\alpha,\infty}$ = " + num2str(exp_hc_inf_clalpha)
leg4 = "Aswing h/c = 0.5, $\epsilon \{Cl_{\alpha,exp}\}$ = " + num2str(epsilon_clalpha_h05) + "  \%"
leg5 = "Aswing h/c = 2, $\epsilon \{Cl_{\alpha,exp}\}$ = " + num2str(epsilon_clalpha_h2) + "  \%"
leg6 = "Aswing h/c = $+\infty$, $\epsilon \{Cl_{\alpha,exp}\}$ = " + num2str(epsilon_clalpha_hinf) + "  \%"
xlabel('angle of attack in deg')
ylabel('C_L')
grid on
legend(leg1,leg2,leg3,leg4,leg5,leg6,'interpreter','latex',Location='southoutside')



figure(2)
plot(No_flap_rect_CD.Var1,No_flap_rect_CD.Var2,'ko',MarkerFaceColor='k',LineWidth=1.5)
hold on
plot(No_flap_rect_CD.Var3,No_flap_rect_CD.Var4,'ks',MarkerFaceColor='k',LineWidth=1.5)
hold on
plot(No_flap_rect_CD.Var5,No_flap_rect_CD.Var6,'kd',MarkerFaceColor='k',LineWidth=1.5)

hold on 
plot(rect_ASWING_h_c_05_alpha,0.01+rect_ASWING_h_c_05_CDi,'--r',LineWidth=1.5)
hold on 
plot(rect_ASWING_h_c_2_alpha,rect_ASWING_h_c_2_CD,'-r',LineWidth=1.5)
hold on 
plot(rect_ASWING_h_c_inf_alpha,rect_ASWING_h_c_inf_CD,'-.r',LineWidth=1.5)

% hold on 
% plot(rect_ASWING_h_c_05_alpha,rect_ASWING_h_c_05_CDi,'--b')
% hold on 
% plot(rect_ASWING_h_c_2_alpha,rect_ASWING_h_c_2_CDi,'-b')
% hold on 
% plot(rect_ASWING_h_c_inf_alpha,rect_ASWING_h_c_inf_CDi,'-.b')

xlabel('angle of attack in deg')
ylabel('C_D')
grid on
legend('Exp : h/c = 0.5','Exp : h/c = 2','Exp : h/c = \infty','Aswing : h/c = 0.5','Aswing : h/c = 2','Aswing : h/c = \infty')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Rectangular wing with flaps 40 deg down 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


flap_rect_CL = readtable('Flap_Rect_CL.csv',NumHeaderLines=2);
flap_rect_CD = readtable('Flap_Rect_CD.csv',NumHeaderLines=2);
rect_ASWING_h_c_05 = readtable('Rectangular_Wing_Flap_hc_05.txt',...
                                                         NumHeaderLines=3);
rect_ASWING_h_c_05_alpha = rect_ASWING_h_c_05.Var5;
rect_ASWING_h_c_05_CL = rect_ASWING_h_c_05.Var6;
rect_ASWING_h_c_05_CD = rect_ASWING_h_c_05.Var7;
rect_ASWING_h_c_05_CDi = rect_ASWING_h_c_05.Var8;
rect_ASWING_h_c_05_CM = rect_ASWING_h_c_05.Var9;

rect_ASWING_h_c_2 = readtable('Rectangular_Wing_Flap_hc_2.txt',...
                                                         NumHeaderLines=3);
rect_ASWING_h_c_2_alpha = rect_ASWING_h_c_2.Var5;
rect_ASWING_h_c_2_CL = rect_ASWING_h_c_2.Var6;
rect_ASWING_h_c_2_CD = rect_ASWING_h_c_2.Var7;
rect_ASWING_h_c_2_CDi = rect_ASWING_h_c_2.Var8;
rect_ASWING_h_c_2_CM = rect_ASWING_h_c_2.Var9;



rect_ASWING_h_c_inf = readtable('Rectangular_Wing_Flap_hc_inf.txt',...
                                                         NumHeaderLines=3);
rect_ASWING_h_c_inf_alpha = rect_ASWING_h_c_inf.Var5;
rect_ASWING_h_c_inf_CL = rect_ASWING_h_c_inf.Var6;
rect_ASWING_h_c_inf_CD = rect_ASWING_h_c_inf.Var7;
rect_ASWING_h_c_inf_CDi = rect_ASWING_h_c_inf.Var8;
rect_ASWING_h_c_inf_CM = rect_ASWING_h_c_inf.Var9;


figure(3)
plot(flap_rect_CL.Var1,flap_rect_CL.Var2,'ko',MarkerFaceColor='k',LineWidth=1.5)
hold on
plot(flap_rect_CL.Var3,flap_rect_CL.Var4,'ks',MarkerFaceColor='k',LineWidth=1.5)
hold on
plot(flap_rect_CL.Var5,flap_rect_CL.Var6,'kd',MarkerFaceColor='k',LineWidth=1.5)

hold on 
plot(rect_ASWING_h_c_05_alpha,rect_ASWING_h_c_05_CL,'--r',LineWidth=1.5)
hold on 
plot(rect_ASWING_h_c_2_alpha,rect_ASWING_h_c_2_CL,'-r',LineWidth=1.5)
hold on 
plot(rect_ASWING_h_c_inf_alpha,rect_ASWING_h_c_inf_CL,'-.r',LineWidth=1.5)



x = flap_rect_CL.Var1(1:end-7);
y = flap_rect_CL.Var2(1:end-7);
p= polyfit(x,y,1);
exp_hc_05_clalpha = p(1)*180/pi

x = flap_rect_CL.Var3(1:end-3);
y = flap_rect_CL.Var4(1:end-3);
p= polyfit(x,y,1);
exp_hc_2_clalpha = p(1)*180/pi

x = flap_rect_CL.Var5(1:end-3);
y = flap_rect_CL.Var6(1:end-3);
p= polyfit(x,y,1);
exp_hc_inf_clalpha = p(1)*180/pi;


x = rect_ASWING_h_c_05_alpha(1:end-44);
y = rect_ASWING_h_c_05_CL(1:end-44);
p= polyfit(x,y,1);
aswing_hc_05_clalpha = p(1)*180/pi

x = rect_ASWING_h_c_2_alpha(1:end-8);
y = rect_ASWING_h_c_2_CL(1:end-8);
p= polyfit(x,y,1);
aswing_hc_2_clalpha = p(1)*180/pi

x = rect_ASWING_h_c_inf_alpha(1:end-8);
y = rect_ASWING_h_c_inf_CL(1:end-8);
p= polyfit(x,y,1);
aswing_hc_inf_clalpha = p(1)*180/pi

exp_deltaclalpha_hc_05 = 100*(exp_hc_05_clalpha-exp_hc_inf_clalpha)/exp_hc_inf_clalpha
exp_deltaclalpha_hc_2 = 100*(exp_hc_2_clalpha-exp_hc_inf_clalpha)/exp_hc_inf_clalpha

epsilon_clalpha_h05 = 100*(aswing_hc_05_clalpha-exp_hc_05_clalpha)/exp_hc_05_clalpha
epsilon_clalpha_h2 = 100*(aswing_hc_2_clalpha-exp_hc_2_clalpha)/exp_hc_2_clalpha
epsilon_clalpha_hinf = 100*(aswing_hc_inf_clalpha-exp_hc_inf_clalpha)/exp_hc_inf_clalpha


leg1 = "Exp h/c = 0.5, $\Delta Cl_{\alpha,\infty}$ = " + num2str(exp_deltaclalpha_hc_05) + "  \%"
leg2 = "Exp h/c = 2, $\Delta Cl_{\alpha,\infty}$ = " + num2str(exp_deltaclalpha_hc_2) + "  \%"
leg3 = "Exp h/c = $+\infty$, $ Cl_{\alpha,\infty}$ = " + num2str(exp_hc_inf_clalpha)
leg4 = "Aswing h/c = 0.5, $\epsilon \{Cl_{\alpha,exp}\}$ = " + num2str(epsilon_clalpha_h05) + "  \%"
leg5 = "Aswing h/c = 2, $\epsilon \{Cl_{\alpha,exp}\}$ = " + num2str(epsilon_clalpha_h2) + "  \%"
leg6 = "Aswing h/c = $+\infty$, $\epsilon \{Cl_{\alpha,exp}\}$ = " + num2str(epsilon_clalpha_hinf) + "  \%"
xlabel('angle of attack in deg')
ylabel('C_L')
grid on
legend(leg1,leg2,leg3,leg4,leg5,leg6,'interpreter','latex',Location='southoutside')





figure(4)
plot(flap_rect_CD.Var1,flap_rect_CD.Var2,'ko',MarkerFaceColor='k',LineWidth=1.5)
hold on
plot(flap_rect_CD.Var3,flap_rect_CD.Var4,'ks',MarkerFaceColor='k',LineWidth=1.5)
hold on
plot(flap_rect_CD.Var5,flap_rect_CD.Var6,'kd',MarkerFaceColor='k',LineWidth=1.5)

hold on 
plot(rect_ASWING_h_c_05_alpha,rect_ASWING_h_c_05_CD,'--r',LineWidth=1.5)
hold on 
plot(rect_ASWING_h_c_2_alpha,rect_ASWING_h_c_2_CD,'-r',LineWidth=1.5)
hold on 
plot(rect_ASWING_h_c_inf_alpha,rect_ASWING_h_c_inf_CD,'-.r',LineWidth=1.5)
hold on 
% plot(rect_ASWING_h_c_05_alpha,rect_ASWING_h_c_05_CDi,'--b')
% hold on 
% plot(rect_ASWING_h_c_2_alpha,rect_ASWING_h_c_2_CDi,'-b')
% hold on 
% plot(rect_ASWING_h_c_inf_alpha,rect_ASWING_h_c_inf_CDi,'-.b')
xlabel('angle of attack in deg')
ylabel('C_D')
grid on
legend('Exp : h/c = 0.5','Exp : h/c = 2','Exp : h/c = \infty','Aswing : h/c = 0.5','Aswing : h/c = 2','Aswing : h/c = \infty')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NACA23012 xfoil analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



Data_temp = readtable('xf-naca23012-il-1000000-n5',NumHeaderLines=12);
NACA23012_alpha = Data_temp.Var1;
NACA23012_CL = Data_temp.Var2;
NACA23012_CD = Data_temp.Var3;

Clmin = min(NACA23012_CL)
Clmax = max(NACA23012_CL)

%cl = 0.0
dif = abs(NACA23012_CL);
match = dif == min(abs(NACA23012_CL));
idx = find(match == 1);
alpha0 = NACA23012_alpha(idx)

Cd = NACA23012_CD(idx)
