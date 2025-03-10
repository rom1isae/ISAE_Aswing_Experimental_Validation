% clear all
% close all
% clc
%%

% system('sh Aswing_Simulations/wing_alone/wing_alone_polar_Ma_0_70.sh')
% system('sh Aswing_Simulations/wing_alone/wing_alone_polar_Ma_0_80.sh')
% 
% 
% system('sh Aswing_Simulations/wing_extension/wing_extentsion_polar_Ma_0_70.sh')
% system('sh Aswing_Simulations/wing_extension/wing_extentsion_polar_Ma_0_80.sh')
% 
% system('sh Aswing_Simulations/Wing_tip_up/wingtip_up_polar_Ma_0_70.sh')
% system('sh Aswing_Simulations/Wing_tip_up/wingtip_up_polar_Ma_0_80.sh')
% 
% 
% system('sh Aswing_Simulations/Wing_tip_up_and_down/wingtip_up_and_down_polar_Ma_0_70.sh')
% system('sh Aswing_Simulations/Wing_tip_up_and_down/wingtip_up_and_down_polar_Ma_0_80.sh')
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
WA_MA_0_70 = readtable('Aswing_Simulations/wing_alone/wing_alone_Ma_0_70.txt',NumHeaderLines=3);
WTU_MA_0_70 = readtable('Aswing_Simulations/Wing_tip_up/wingtip_up_Ma_0_70.txt',NumHeaderLines=3);
WTE_MA_0_70 = readtable('Aswing_Simulations/wing_extension/wing_extension_Ma_0_70.txt',NumHeaderLines=3);
WTUD_MA_0_70 = readtable('Aswing_Simulations/Wing_tip_up_and_down/wingtip_up_and_down_Ma_0_70.txt',NumHeaderLines=3);

WA_MA_0_80 = readtable('Aswing_Simulations/wing_alone/wing_alone_Ma_0_80.txt',NumHeaderLines=3);
WTU_MA_0_80 = readtable('Aswing_Simulations/Wing_tip_up/wingtip_up_Ma_0_80.txt',NumHeaderLines=3);
WTE_MA_0_80 = readtable('Aswing_Simulations/wing_extension/wing_extension_Ma_0_80.txt',NumHeaderLines=3);
WTUD_MA_0_80 = readtable('Aswing_Simulations/Wing_tip_up_and_down/wingtip_up_and_down_Ma_0_80.txt',NumHeaderLines=3);

MA_070_Exp = readtable('Experimental_Data/KC135_MA070.csv',NumHeaderLines=2);
MA_080_Exp = readtable('Experimental_Data/KC135_MA080.csv',NumHeaderLines=2);

WA_MA_0_70_CL = WA_MA_0_70.Var78;
WA_MA_0_70_CD = WA_MA_0_70.Var79;
WA_MA_0_70_CDi = WA_MA_0_70.Var80;
WA_MA_0_70_CM = WA_MA_0_70.Var81;
WA_MA_0_70_alpha = WA_MA_0_70.Var75;

WTU_MA_0_70_CL = WTU_MA_0_70.Var78;
WTU_MA_0_70_CD = WTU_MA_0_70.Var79;
WTU_MA_0_70_CDi = WTU_MA_0_70.Var80;
WTU_MA_0_70_CM = WTU_MA_0_70.Var81;
WTU_MA_0_70_alpha = WTU_MA_0_70.Var75;

WTE_MA_0_70_CL = WTE_MA_0_70.Var78;
WTE_MA_0_70_CD = WTE_MA_0_70.Var79;
WTE_MA_0_70_CDi = WTE_MA_0_70.Var80;
WTE_MA_0_70_CM = WTE_MA_0_70.Var81;
WTE_MA_0_70_alpha = WTE_MA_0_70.Var75;

WTUD_MA_0_70_CL = WTUD_MA_0_70.Var78;
WTUD_MA_0_70_CD = WTUD_MA_0_70.Var79;
WTUD_MA_0_70_CDi = WTUD_MA_0_70.Var80;
WTUD_MA_0_70_CM = WTUD_MA_0_70.Var81;
WTUD_MA_0_70_alpha = WTUD_MA_0_70.Var75;

WA_MA_0_80_CL = WA_MA_0_80.Var78;
WA_MA_0_80_CD = WA_MA_0_80.Var79;
WA_MA_0_80_CDi = WA_MA_0_80.Var80;
WA_MA_0_80_CM = WA_MA_0_80.Var81;
WA_MA_0_80_alpha = WA_MA_0_80.Var75;

WTU_MA_0_80_CL = WTU_MA_0_80.Var78;
WTU_MA_0_80_CD = WTU_MA_0_80.Var79;
WTU_MA_0_80_CDi = WTU_MA_0_80.Var80;
WTU_MA_0_80_CM = WTU_MA_0_80.Var81;
WTU_MA_0_80_alpha = WTU_MA_0_80.Var75;

WTE_MA_0_80_CL = WTE_MA_0_80.Var78;
WTE_MA_0_80_CD = WTE_MA_0_80.Var79;
WTE_MA_0_80_CDi = WTE_MA_0_80.Var80;
WTE_MA_0_80_CM = WTE_MA_0_80.Var81;
WTE_MA_0_80_alpha = WTE_MA_0_80.Var75;

WTUD_MA_0_80_CL = WTUD_MA_0_80.Var78;
WTUD_MA_0_80_CD = WTUD_MA_0_80.Var79;
WTUD_MA_0_80_CDi = WTUD_MA_0_80.Var80;
WTUD_MA_0_80_CM = WTUD_MA_0_80.Var81;
WTUD_MA_0_80_alpha = WTUD_MA_0_80.Var75;


figure(1)
lambda07 = sqrt(1-0.7^2)
lambda07 = 1

plot(lambda07*WA_MA_0_70_CL, 0.0064 +WA_MA_0_70_CD,'-b',LineWidth=1.5)


hold on

plot(lambda07*WTU_MA_0_70_CL, 0.0064 + WTU_MA_0_70_CD,'--r',LineWidth=1.5)






hold on
plot(lambda07*WTE_MA_0_70_CL,0.0064 + WTE_MA_0_70_CD,':k',LineWidth=1.5)





hold on
plot(lambda07*WTUD_MA_0_70_CL,0.0064 + WTUD_MA_0_70_CD,'-.','Color',[0 0.5 0.0],LineWidth=1.5)
hold on
plot(MA_070_Exp.Var1, MA_070_Exp.Var2,'sb','MarkerFaceColor','b')
hold on
plot(MA_070_Exp.Var3,MA_070_Exp.Var4,'or','MarkerFaceColor','r')
hold on
plot(MA_070_Exp.Var7,MA_070_Exp.Var8,'dk','MarkerFaceColor','k')
hold on
plot(MA_070_Exp.Var5,MA_070_Exp.Var6,'v','Color',[0 0.5 0.0],'MarkerFaceColor',[0 0.5 0.0])
legend('W-A : ASW-5.96','WT-U : ASW-5.96','W-E : ASW-5.96','WT-U&D : ASW-5.96','W-A Exp','WT-U Exp','W-E Exp','WT-U&D Exp')
grid on
xlabel('C_L')
ylabel('C_D')
title('Ma = 0.7')
ylim([0.01 0.065])
xlim([0.2 0.9])

figure(2)
lambda08 = sqrt(1-0.8^2)
lambda08 = 1;
plot(lambda08*WA_MA_0_80_CL, 0.0075 + WA_MA_0_80_CD,'-b',LineWidth=1.5)
hold on
plot(lambda08*WTU_MA_0_80_CL, 0.0075 + WTU_MA_0_80_CD,'--r',LineWidth=1.5)
hold on
plot(lambda08*WTE_MA_0_80_CL, 0.0075 + WTE_MA_0_80_CD,':k',LineWidth=1.5)
hold on
plot(lambda08*WTUD_MA_0_80_CL, 0.0075 + WTUD_MA_0_80_CD,'-.','Color',[0 0.5 0.0],LineWidth=1.5)
hold on
plot(MA_080_Exp.Var1, MA_080_Exp.Var2,'sb','MarkerFaceColor','b')
hold on
plot(MA_080_Exp.Var3,MA_080_Exp.Var4,'or','MarkerFaceColor','r')
hold on
plot(MA_080_Exp.Var7,MA_080_Exp.Var8,'dk','MarkerFaceColor','k')
hold on
plot(MA_080_Exp.Var5,MA_080_Exp.Var6,'v','Color',[0 0.5 0.0],'MarkerFaceColor',[0 0.5 0.0])
% hold on
% plot(WTE_MA_0_70_CL,WTE_MA_0_70_CL./WTE_MA_0_70_CDi,'--k')
legend('W-A : ASW-5.96','WT-U : ASW-5.96','W-E : ASW-5.96','WT-U&D : ASW-5.96','W-A Exp','WT-U Exp','W-E Exp','WT-U&D Exp')
grid on
xlabel('C_L')
ylabel('C_D')
ylim([0.01 0.065])
xlim([0.2 0.9])

title('Ma = 0.8')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lift analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


CL_Alpha_MA07 = readtable('Experimental_Data/Ma07_CL_alpha.csv',NumHeaderLines=3);
CL_Alpha_MA08 = readtable('Experimental_Data/Ma08_CL_alpha.csv',NumHeaderLines=3);


figure(3)
lambda07 = 1/sqrt(1-0.7^2)
lambda07 = 1

x = CL_Alpha_MA07.Var2
y = CL_Alpha_MA07.Var1
p5= polyfit(x,y,1)
dCl_ddF(5) = p5(1);
yfit = polyval(p5,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg5 = "$C_{L,\alpha}$  =  " +num2str(180*p5(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+")$";

x = CL_Alpha_MA07.Var2
y = CL_Alpha_MA07.Var1
p6= polyfit(x,y,1)
dCl_ddF(6) = p6(1);
yfit = polyval(p6,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg6 = "$C_{L,\alpha}$  =  " +num2str(180*p6(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+")$";

x = CL_Alpha_MA07.Var2
y = CL_Alpha_MA07.Var1
p7= polyfit(x,y,1)
dCl_ddF(7) = p7(1);
yfit = polyval(p7,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg7 = "$C_{L,\alpha}$  =  " +num2str(180*p7(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+")$";

x = CL_Alpha_MA07.Var2
y = CL_Alpha_MA07.Var1
p8= polyfit(x,y,1)
dCl_ddF(8) = p8(1);
yfit = polyval(p8,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg8 = "$C_{L,\alpha}$  =  " +num2str(180*p8(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+")$";


x = WA_MA_0_70_alpha;
y = WA_MA_0_70_CL;
p1= polyfit(x,y,1)
dCl_ddF(1) = p1(1);
yfit = polyval(p1,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg1 = "$C_{L,\alpha}$  =  " +num2str(180*p1(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+"), "+ "\epsilon = " + num2str(100*(p1(1)-p5(1))/p5(1),'%1.1f')+ " \% $";


x = WTU_MA_0_70_alpha;
y = WTU_MA_0_70_CL;
p2= polyfit(x,y,1)
dCl_ddF(2) = p2(1);
yfit = polyval(p2,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg2 = "$C_{L,\alpha}$  =  " +num2str(180*p2(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+"), "+ "\epsilon = " + num2str(100*(p2(1)-p6(1))/p6(1),'%1.1f')+ " \% $";


x = WTE_MA_0_70_alpha;
y = WTE_MA_0_70_CL;
p3= polyfit(x,y,1)
dCl_ddF(3) = p3(1);
yfit = polyval(p3,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg3 = "$C_{L,\alpha}$  =  " +num2str(180*p3(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+"), "+ "\epsilon = " + num2str(100*(p3(1)-p7(1))/p7(1),'%1.1f')+ " \% $";


x = WTUD_MA_0_70_alpha;
y = WTUD_MA_0_70_CL;
p4= polyfit(x,y,1)
dCl_ddF(4) = p4(1);
yfit = polyval(p4,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg4 = "$C_{L,\alpha}$  =  " +num2str(180*p4(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+"), "+ "\epsilon = " + num2str(100*(p4(1)-p8(1))/p8(1),'%1.1f')+ " \% $";




plot(WA_MA_0_70_alpha,lambda07*WA_MA_0_70_CL,'-b',LineWidth=1.5)
hold on
plot(WTU_MA_0_70_alpha,lambda07*WTU_MA_0_70_CL,'--r',LineWidth=1.5)
hold on
plot(WTE_MA_0_70_alpha,lambda07*WTE_MA_0_70_CL,':k',LineWidth=1.5)
hold on
plot(WTUD_MA_0_70_alpha,lambda07*WTUD_MA_0_70_CL,'-.','Color',[0 0.5 0.0],LineWidth=1.5)
hold on
plot(CL_Alpha_MA07.Var2,CL_Alpha_MA07.Var1,'sb',MarkerFaceColor='b')
hold on
plot(CL_Alpha_MA07.Var4,CL_Alpha_MA07.Var3,'or',MarkerFaceColor='r')
hold on
plot(CL_Alpha_MA07.Var6,CL_Alpha_MA07.Var5,'dk',MarkerFaceColor='k')
hold on
plot(CL_Alpha_MA07.Var8,CL_Alpha_MA07.Var7,'v','Color',[0 0.5 0.0],MarkerFaceColor=[0 0.5 0.0])
xlabel('\alpha in ^\circ')
ylabel('C_L')
legend(leg1,leg2,leg3,leg4,leg5,leg6,leg7,leg8,'interpreter','latex','Location','southoutside')
grid on
xlim([0 8])
ylim([0 0.9])

title("Ma = 0.7")



x = CL_Alpha_MA07.Var2
y = CL_Alpha_MA07.Var1
p5= polyfit(x,y,1)
dCl_ddF(5) = p5(1);
yfit = polyval(p5,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg5 = "$C_{L,\alpha}$  =  " +num2str(180*p5(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+")$";

x = CL_Alpha_MA07.Var2
y = CL_Alpha_MA07.Var1
p6= polyfit(x,y,1)
dCl_ddF(6) = p6(1);
yfit = polyval(p6,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg6 = "$C_{L,\alpha}$  =  " +num2str(180*p6(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+")$";

x = CL_Alpha_MA07.Var2
y = CL_Alpha_MA07.Var1
p7= polyfit(x,y,1)
dCl_ddF(7) = p7(1);
yfit = polyval(p7,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg7 = "$C_{L,\alpha}$  =  " +num2str(180*p7(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+")$";

x = CL_Alpha_MA07.Var2
y = CL_Alpha_MA07.Var1
p8= polyfit(x,y,1)
dCl_ddF(8) = p8(1);
yfit = polyval(p8,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg8 = "$C_{L,\alpha}$  =  " +num2str(180*p8(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+")$";


x = WA_MA_0_80_alpha;
y = WA_MA_0_80_CL;
p1= polyfit(x,y,1)
dCl_ddF(1) = p1(1);
yfit = polyval(p1,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg1 = "$C_{L,\alpha}$  =  " +num2str(180*p1(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+"), "+ "\epsilon = " + num2str(100*(p1(1)-p5(1))/p5(1),'%1.1f')+ " \% $";


x = WTU_MA_0_80_alpha;
y = WTU_MA_0_80_CL;
p2= polyfit(x,y,1)
dCl_ddF(2) = p2(1);
yfit = polyval(p2,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg2 = "$C_{L,\alpha}$  =  " +num2str(180*p2(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+"), "+ "\epsilon = " + num2str(100*(p2(1)-p6(1))/p6(1),'%1.1f')+ " \% $";


x = WTE_MA_0_80_alpha;
y = WTE_MA_0_80_CL;
p3= polyfit(x,y,1)
dCl_ddF(3) = p3(1);
yfit = polyval(p3,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg3 = "$C_{L,\alpha}$  =  " +num2str(180*p3(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+"), "+ "\epsilon = " + num2str(100*(p3(1)-p7(1))/p7(1),'%1.1f')+ " \% $";


x = WTUD_MA_0_80_alpha;
y = WTUD_MA_0_80_CL;
p4= polyfit(x,y,1)
dCl_ddF(4) = p4(1);
yfit = polyval(p4,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg4 = "$C_{L,\alpha}$  =  " +num2str(180*p4(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+"), "+ "\epsilon = " + num2str(100*(p4(1)-p8(1))/p8(1),'%1.1f')+ " \% $";



figure(4)
plot(WA_MA_0_80_alpha,lambda07*WA_MA_0_80_CL,'-b',LineWidth=1.5)
hold on
plot(WTU_MA_0_80_alpha,lambda07*WTU_MA_0_80_CL,'--r',LineWidth=1.5)
hold on
plot(WTE_MA_0_80_alpha,lambda07*WTE_MA_0_80_CL,':k',LineWidth=1.5)
hold on
plot(WTUD_MA_0_80_alpha,lambda07*WTUD_MA_0_80_CL,'-.','Color',[0 0.5 0.0],LineWidth=1.5)
hold on
plot(CL_Alpha_MA08.Var2,CL_Alpha_MA08.Var1,'sb',MarkerFaceColor='b')
hold on
plot(CL_Alpha_MA08.Var4,CL_Alpha_MA08.Var3,'or',MarkerFaceColor='r')
hold on
plot(CL_Alpha_MA08.Var6,CL_Alpha_MA08.Var5,'dk',MarkerFaceColor='k')
hold on
plot(CL_Alpha_MA08.Var8,CL_Alpha_MA08.Var7,'v','Color',[0 0.5 0.0],MarkerFaceColor=[0 0.5 0.0])
xlabel('\alpha in ^\circ')
ylabel('C_L')
legend(leg1,leg2,leg3,leg4,leg5,leg6,leg7,leg8,'interpreter','latex','Location','southoutside')
grid on
xlim([0 8])
ylim([0 0.9])
title("Ma = 0.8")

