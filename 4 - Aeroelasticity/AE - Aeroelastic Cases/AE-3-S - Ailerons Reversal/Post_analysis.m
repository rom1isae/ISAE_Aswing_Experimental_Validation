clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UNIT CONVERSION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ft2m = 0.3048;
in2m = 0.0254;
lb2N = 4.448


EI_conv = lb2N*(in2m^2)
q_conv = lb2N/(ft2m^2);
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BEAM PROPERTIES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% FAC = 0.453592*0.001*9.81/0.00064516;
% GJ_EI = readtable('GJ_EI.csv','NumHeaderLines',2);
% figure(1)
% plot(GJ_EI.Var1,GJ_EI.Var2,'--bo')
% hold on
% plot(GJ_EI.Var3,GJ_EI.Var4,'--bs')
% hold on
% plot(GJ_EI.Var5,GJ_EI.Var6,'-ro')
% hold on
% plot(GJ_EI.Var7,GJ_EI.Var8,'-rs')
% grid on
% xlabel('2y/b')
% ylabel('stiffness')
% legend('Straight Wing : EI','Straight Wing : GJ','Swept Wing : EI','Swept Wing : GJ')
% xlim([0.09 1])
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AIRFOIL ANALYSIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all
% alpha0_1=readtable('airfoil_analysis/NACA63A012_alpha0_dF_Re3E5.txt','NumHeaderLines',12);
% alpha0_8=readtable('airfoil_analysis/NACA63A012_alpha0_dF_Re6P5E5.txt','NumHeaderLines',12);
% dF = -14:1:14;
% figure(1)
% plot(dF,alpha0_1.Var1,'*b')
% hold on 
% 
% x = dF;
% y = alpha0_1.Var1;
% p= polyfit(x,y,1)
% 
% yfit = polyval(p,x)
% yresid = y - yfit;
% SSresid = sum(yresid.^2);
% SStotal = (length(y)-1) * var(y);
% rsq = 1 - SSresid./SStotal
% rsq = -mean(rsq);
% hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
% plot(x,yfit,'-b','linewidth',1)
% hold on
% 
% 
% plot(dF,alpha0_8.Var1,'sr')
% hold on
% x = dF;
% y = alpha0_8.Var1;
% p= polyfit(x,y,1)
% 
% yfit = polyval(p,x)
% yresid = y - yfit;
% SSresid = sum(yresid.^2);
% SStotal = (length(y)-1) * var(y);
% rsq = 1 - SSresid./SStotal
% rsq = -mean(rsq);
% hold on
% leg4 = "$\frac{d \alpha_0}{d \delta_F}$ = " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
% plot(x,yfit,'-r','linewidth',1)
% hold on
% 
% grid on
% xlabel('\delta_F in degree')
% ylabel('\alpha_0 in degree')
% legend('Re = 3.0E5',leg2,'Re = 6.0E5',leg4,'Interpreter','latex')
% 
% 
% CM0_1=readtable('airfoil_analysis/NACA63A012_dF_CM0_Re3E5.txt','NumHeaderLines',12)
% CM0_8=readtable('airfoil_analysis/NACA63A012_dF_CM0_Re6P5E5.txt','NumHeaderLines',12);
% 
% figure(2)
% plot(dF,CM0_1.Var15,'*b')
% hold on
% x = dF;
% y = CM0_1.Var15;
% p= polyfit(x,y,1)
% 
% yfit = polyval(p,x)
% yresid = y - yfit;
% SSresid = sum(yresid.^2);
% SStotal = (length(y)-1) * var(y);
% rsq = 1 - SSresid./SStotal
% rsq = -mean(rsq);
% hold on
% leg2 = "$\frac{d CM_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
% plot(x,yfit,'-b','linewidth',1)
% hold on
% plot(dF,CM0_8.Var15,'rs')
% hold on
% x = dF;
% y = CM0_8.Var15;
% p= polyfit(x,y,1)
% 
% yfit = polyval(p,x)
% yresid = y - yfit;
% SSresid = sum(yresid.^2);
% SStotal = (length(y)-1) * var(y);
% rsq = 1 - SSresid./SStotal
% rsq = -mean(rsq);
% hold on
% leg4 = "$\frac{d CM_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
% plot(x,yfit,'-r','linewidth',1)
% hold on
% grid on
% xlabel('\delta_F in degree')
% ylabel('CM_0')
% legend('Re = 3.0E5',leg2,'Re = 6.0E5',leg4,'Interpreter','latex')

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STRAIGHT WING ANALYSIS : Wing Locked
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
ft2m = 0.0254;
rho = 1.292; 
c = 0.185/1.2192;

dCM_d_deltaF = readtable('Straight_Wing_dCM_ddeltaF.csv','NumHeaderLines',2);
dCM_d_deltaF_ASW_20O_V = [  29.0109 41.1780 46.0222 50.4055 54.4427 58.1919 60 65];
dCM_d_deltaF_ASW_20O = [0.002021 0.001756 0.001564 0.001300 0.000894 0.000321 0.000114 -0.002120];
dCM_d_deltaF_ASW_20O_mod = [0.001866 0.001514  0.001286 0.00123 0.000894 0.000321 0.000114 -0.002120];
dCM_d_deltaF_ASW_40O_V = [   28.9318 41.1330 45.9943 50.3962 54.3608 58.1380 61.3891 64.8562];
dCM_d_deltaF_ASW_40O = [0.004617  0.004142 0.003801 0.003344  0.002673 0.001763  0.001095 -0.002358 ];
dCM_d_deltaF_ASW_40O_mod =  [0.004419   0.003814 0.003380  0.002801   0.002673 0.001763  0.001095 -0.002358 ];
dCM_d_deltaF_ASW_60O_V = [28.9731 35.57  41.1567 46.0051 50.3921 54.6010 58.1919 61.3891 64.8562];
dCM_d_deltaF_ASW_60O = [0.006833  0.006561  0.006208 0.005761 0.005165 0.004291 0.003107  0.001375 -0.002236 ];
dCM_d_deltaF_ASW_60O_mod = [0.006638  0.006340   0.005964 0.005761 0.005165 0.004291 0.003107  0.001375 -0.002236 ];
dCM_d_deltaF_ASW_80O_V = [   29.0509 35.6090 41.1567 46.0051 50.3921 54.6010 58.1919 61.3891 64.8562];
dCM_d_deltaF_ASW_80O = [0.008289 0.007980 0.007579  0.007074  0.006400 0.005415 0.004082   0.002134 -0.001917  ];
dCM_d_deltaF_ASW_80O_mod = [0.008050   0.007713  0.007579  0.007074  0.006400 0.005415 0.004082   0.002134 -0.001917  ];
dCM_d_deltaF_ASW_95O_V = [29.1447 35.6927 41.1567 46.0051 50.3921 54.6010 58.1919 61.3891 64.8562];
dCM_d_deltaF_ASW_95O = [0.008733   0.008410  0.007996 0.007471  0.006773 0.005751  0.004370   0.002354  -0.001835   ];
dCM_d_deltaF_ASW_95O_mod = [0.008477    0.008126   0.007996 0.007471  0.006773 0.005751  0.004370   0.002354  -0.001835   ];



% Reynolds numbder:
Re = sqrt(2*q_conv*dCM_d_deltaF.Var3/rho)*c/1.5111E-5


figure(3)
plot(q_conv*dCM_d_deltaF.Var1,dCM_d_deltaF.Var2,'ko',MarkerSize=10,MarkerFaceColor='k')
hold on 
plot(q_conv*dCM_d_deltaF.Var3,dCM_d_deltaF.Var4,'k^',MarkerSize=10,MarkerFaceColor='k')
hold on 
plot(q_conv*dCM_d_deltaF.Var5,dCM_d_deltaF.Var6,'ks',MarkerSize=10,MarkerFaceColor='k')
hold on
plot(q_conv*dCM_d_deltaF.Var7,dCM_d_deltaF.Var8,'kd',MarkerSize=10,MarkerFaceColor='k')
hold on
plot(q_conv*dCM_d_deltaF.Var9,dCM_d_deltaF.Var10,'kv',MarkerSize=10,MarkerFaceColor='k')
hold on
plot(0.5*rho*dCM_d_deltaF_ASW_20O_V(1:5).^2,dCM_d_deltaF_ASW_20O(1:5),'--ro',MarkerSize=8,LineWidth=1.5)
hold on
plot(0.5*rho*dCM_d_deltaF_ASW_40O_V(1:6).^2,dCM_d_deltaF_ASW_40O(1:6),'--r^',MarkerSize=8,LineWidth=1.5)
hold on
plot(0.5*rho*dCM_d_deltaF_ASW_60O_V(1:3).^2,dCM_d_deltaF_ASW_60O(1:3),'--rs',MarkerSize=8,LineWidth=1.5)
hold on
plot(0.5*rho*dCM_d_deltaF_ASW_80O_V(1:2).^2,dCM_d_deltaF_ASW_80O(1:2),'--rd',MarkerSize=8,LineWidth=1.5)
hold on
plot(0.5*rho*dCM_d_deltaF_ASW_95O_V(1:2).^2,dCM_d_deltaF_ASW_95O(1:2),'--rv',MarkerSize=8,LineWidth=1.5)
hold on
plot(0.5*rho*dCM_d_deltaF_ASW_20O_V(1:5).^2,dCM_d_deltaF_ASW_20O_mod(1:5),'-.o','color',[0 0.5 0],MarkerSize=8,LineWidth=1.5)
hold on
plot(0.5*rho*dCM_d_deltaF_ASW_40O_V(1:6).^2,dCM_d_deltaF_ASW_40O_mod(1:6),'-.^','color',[0 0.5 0],MarkerSize=8,LineWidth=1.5)
hold on
plot(0.5*rho*dCM_d_deltaF_ASW_60O_V(1:3).^2,dCM_d_deltaF_ASW_60O_mod(1:3),'-.s','color',[0 0.5 0],MarkerSize=8,LineWidth=1.5)
hold on
plot(0.5*rho*dCM_d_deltaF_ASW_80O_V(1:2).^2,dCM_d_deltaF_ASW_80O_mod(1:2),'-.d','color',[0 0.5 0],MarkerSize=8,LineWidth=1.5)
hold on
plot(0.5*rho*dCM_d_deltaF_ASW_95O_V(1:2).^2,dCM_d_deltaF_ASW_95O_mod(1:2),'-.v','color',[0 0.5 0],MarkerSize=8,LineWidth=1.5)
grid on
xlabel('Dynamic pressure in Pa')
ylabel('$\frac{dC_l}{d\delta A}$ in 1/deg',Interpreter='latex')
axis square
ylim([-0.001 10E-3])
legend('20% Exp','40% Exp','60% Exp','80% Exp','95% Exp','Location','northeast')
set(gca,"FontSize",14)


%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STRAIGHT WING ANALYSIS : Wing Un-Locked -> Helix angle measurements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dhelix_dF = readtable('Helix_Angle_VS_dF.csv','NumHeaderLines',2)
V20O = sqrt(2*q_conv*dhelix_dF.Var1(1:end-1)/rho)
% Modified version of Aswing data
p20O = [ 9.507   9.898  9.039  7.623 5.826 -0.5932] 
q20O = q_conv*dhelix_dF.Var1(1:end-1);
helix_20O = 0.5*p20O'*b./V20O;

V40O = sqrt(2*q_conv*dhelix_dF.Var3(1:end-1)/rho)
q40O = q_conv*dhelix_dF.Var3(1:end-1);
% Modified version of Aswing data
p40O = [21.90 23.10  21.42 18.48  14.69 9.814]; 
helix_40O = 0.5*p40O'*b./V40O;

V60O = sqrt(2*q_conv*dhelix_dF.Var5(1:end-2)/rho)
q60O = q_conv*dhelix_dF.Var5(1:end-2);
% Modified version of Aswing data
p60O = [ 32.62 35.67 33.91 30.42 25.60]; 
helix_60O = 0.5*p60O'*b./V60O;

V80O = sqrt(2*q_conv*dhelix_dF.Var7(1:end-2)/rho)
q80O = q_conv*dhelix_dF.Var7(1:end-2);
% Modified version of Aswing data
p80O = [39.73  43.48  41.39 37.51 31.90]; 
helix_80O = 0.5*p80O'*b./V80O;


V95O = sqrt(2*q_conv*dhelix_dF.Var9(1:end-2)/rho)
q95O = q_conv*dhelix_dF.Var9(1:end-2)
% Modified version of Aswing data
p95O = [41.73 45.87 43.66 39.58 33.83]; 
helix_95O = 0.5*p95O'*b./V95O;    

figure(6)
plot(q20O,(180/pi)*dhelix_dF.Var2(1:end-1),'ko',MarkerSize=8,MarkerFaceColor='k')
x = q20O;
y = (180/pi)*dhelix_dF.Var2(1:end-1);
p= polyfit(x,y,1)

yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg1 = "Exp 20%";
Exp20O_slope = p(1);
hold on
% plot(V20O,helix_20O_un,'-bo')
% hold on
plot(q40O,(180/pi)*dhelix_dF.Var4(1:end-1),'k^',MarkerSize=8,MarkerFaceColor='k')
x = q40O;
y = (180/pi)*dhelix_dF.Var4(1:end-1);
p= polyfit(x,y,1)
leg2 = "Exp 40%";
Exp40O_slope = p(1);
hold on
plot(q60O,(180/pi)*dhelix_dF.Var6(1:end-2),'ks',MarkerSize=8,MarkerFaceColor='k')
x = q60O;
y = (180/pi)*dhelix_dF.Var6(1:end-2);
p= polyfit(x,y,1)
leg3 = "Exp 60O%";
Exp60O_slope = p(1);

hold on
plot(q80O,(180/pi)*dhelix_dF.Var8(1:end-2),'kd',MarkerSize=8,MarkerFaceColor='k')
x = q80O;
y = (180/pi)*dhelix_dF.Var8(1:end-2);
p= polyfit(x,y,1)
leg4 = "Exp 80O%";
Exp80O_slope = p(1);
hold on
plot(q95O,(180/pi)*dhelix_dF.Var10(1:end-2),'kv',MarkerSize=8,MarkerFaceColor='k')
x = q80O;
y = (180/pi)*dhelix_dF.Var10(1:end-2);
p= polyfit(x,y,1)
leg5 = "Exp 95O%";
Exp95O_slope = p(1);
hold on
plot(q20O,helix_20O,'-.o','color',[0 0.5 0],MarkerSize=8,LineWidth=1.5)
x = q20O;
y = helix_20O;
p= polyfit(x,y,1)
ASW20O_slope = p(1);
err_20O = 100*abs((Exp20O_slope-ASW20O_slope)/Exp20O_slope);
leg6 = "20%, \epsilon = " + num2str(err_20O,2) + "%";
hold on
plot(q40O,helix_40O,'-.^','color',[0 0.5 0],MarkerSize=8,LineWidth=1.5)
x = q40O;
y = helix_40O;
p= polyfit(x,y,1)
ASW40O_slope = p(1);
err_40O = 100*abs((Exp40O_slope-ASW40O_slope)/Exp40O_slope);
leg7 = "40%, \epsilon = " + num2str(err_40O,2) + "%";
hold on
plot(q60O,helix_60O,'-.s','color',[0 0.5 0],MarkerSize=8,LineWidth=1.5)
x = q60O;
y = helix_60O;
p= polyfit(x,y,1)
ASW60O_slope = p(1);
err_60O = 100*abs((Exp60O_slope-ASW60O_slope)/Exp60O_slope);
leg8 = "60%, \epsilon = " + num2str(err_60O,2) + "%";
hold on
plot(q80O,helix_80O,'-.d','color',[0 0.5 0],MarkerSize=8,LineWidth=1.5)
x = q80O;
y = helix_80O;
p= polyfit(x,y,1)
ASW80O_slope = p(1);
err_80O = 100*abs((Exp80O_slope-ASW80O_slope)/Exp80O_slope);
leg9 = "80%, \epsilon = " + num2str(err_80O,2) + "%";
hold on
plot(q95O,helix_95O,'-.v','color',[0 0.5 0],MarkerSize=8,LineWidth=1.5)
x = q95O;
y = helix_95O;
p= polyfit(x,y,1)
ASW95O_slope = p(1);
err_95O = 100*abs((Exp95O_slope-ASW95O_slope)/Exp95O_slope);
leg10 = "95%, \epsilon = " + num2str(err_95O,2) + "%";
grid on 
xlabel('Dynamic pressure in Pa')
ylabel('$\frac{d pb/2V}{d \delta_A}$',Interpreter='latex',FontSize=20)
legend('','','','','',leg6,leg7,leg8,leg9,leg10,'Location','northeast')
set(gca,"FontSize",14)

axis square 

