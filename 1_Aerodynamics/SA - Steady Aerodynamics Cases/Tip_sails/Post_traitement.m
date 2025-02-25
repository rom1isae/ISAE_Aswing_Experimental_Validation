clear all ; close all; clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% run simulations
% system('./wing_alone.sh')
system('./wing_extension.sh')
system('./Louvered.sh')
% system('./TS_60_45_30.sh')
% system('./TS_80_60_40.sh')
% system('./TS_60_40_80.sh')

%% read data
wing_alone = readtable("wing_alone.txt",NumHeaderLines=3)
wing_extension = readtable("wing_extension.txt",NumHeaderLines=3);
Louvered = readtable("Louvered.txt",NumHeaderLines=3);
TS_60_45_30 = readtable("TS_60_45_30.txt",NumHeaderLines=3);
TS_80_60_40 = readtable("TS_80_60_40.txt",NumHeaderLines=3);
TS_60_40_80 = readtable("TS_60_40_80.txt",NumHeaderLines=3);


CD_CL_exp = readtable('CD_CL.csv',NumHeaderLines=2);
CL_VS_ALPHA = readtable('CL_VS_ALPHA.csv',NumHeaderLines=2);
TS_60_45_30_exp = readtable('CD_CL_tip_sail.csv',NumHeaderLines=2);



wing_alone_alpha = wing_alone.Var75;
wing_alone_CL = wing_alone.Var78;
wing_alone_CD = wing_alone.Var79;
wing_alone_CM = wing_alone.Var81;

wing_extension_alpha = wing_extension.Var75;
wing_extension_CL = wing_extension.Var78;
wing_extension_CD = wing_extension.Var79;
wing_extension_CM = wing_extension.Var81;

Louvered_alpha = Louvered.Var75;
Louvered_CL = Louvered.Var78;
Louvered_CD = Louvered.Var79;
Louvered_CM = Louvered.Var81;

TS_60_45_30_alpha = TS_60_45_30.Var75;
TS_60_45_30_CL = TS_60_45_30.Var78;
TS_60_45_30_CD = TS_60_45_30.Var79;
TS_60_45_30_CM = TS_60_45_30.Var81;

TS_80_60_40_alpha = TS_80_60_40.Var75;
TS_80_60_40_CL = TS_80_60_40.Var78;
TS_80_60_40_CD = TS_80_60_40.Var79;
TS_80_60_40_CM = TS_80_60_40.Var81;


TS_60_40_80_alpha = TS_60_40_80.Var75;
TS_60_40_80_CL = TS_60_40_80.Var78;
TS_60_40_80_CD = TS_60_40_80.Var79;
TS_60_40_80_CM = TS_60_40_80.Var81;

x = wing_alone_alpha(1:11);
y = wing_alone_CL(1:11);

x = CL_VS_ALPHA.Var1(1:7);
y = CL_VS_ALPHA.Var2(1:7);
p4= polyfit(x,y,1)
dCl_ddF(4) = p4(1);
yfit = polyval(p4,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg4 = "$C_{L,\alpha}$  =  " +num2str(180*p4(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+")$";

x = CL_VS_ALPHA.Var3(1:8);
y = CL_VS_ALPHA.Var4(1:8);
p5= polyfit(x,y,1)
dCl_ddF(4) = p5(1);
yfit = polyval(p5,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg5 = "$C_{L,\alpha}$  =  " +num2str(180*p5(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+")$";


x = CL_VS_ALPHA.Var5(1:10);
y = CL_VS_ALPHA.Var6(1:10);
p6= polyfit(x,y,1)
dCl_ddF(4) = p6(1);
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg6 = "$C_{L,\alpha}$  =  " +num2str(180*p6(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+")$";


x = wing_alone_alpha(1:11);
y = wing_alone_CL(1:11);
p1= polyfit(x,y,1)
dCl_ddF(4) = p1(1);
yfit = polyval(p1,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg1 = "$C_{L,\alpha}$  =  " +num2str(180*p1(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+"), "+ "\epsilon = " + num2str(100*(p1(1)-p4(1))/p4(1),'%1.1f')+ " \% $";

x = wing_extension_alpha(1:10);
y = wing_extension_CL(1:10);
p2= polyfit(x,y,1)
dCl_ddF(4) = p2(1);
yfit = polyval(p2,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg2 = "$C_{L,\alpha}$  =  " +num2str(180*p2(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%0.3f')+"), "+ "\epsilon = " + num2str(100*(p2(1)-p5(1))/p5(1),'%1.1f')+ " \% $";

x = Louvered_alpha(1:10);
y = Louvered_CL(1:10);
p3= polyfit(x,y,1)
dCl_ddF(4) = p3(1);
yfit = polyval(p3,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg3 = "$C_{L,\alpha}$  =  " +num2str(180*p3(1)/pi,'%0.2f') + "$\ (r^2 = "+num2str(rsq,'%1.2f')+"), "+ "\epsilon = " + num2str(100*(p3(1)-p6(1))/p6(1),'%1.1f')+ "\% $";


figure(1)
subplot(1,2,1)
plot(wing_alone_alpha,wing_alone_CL,'-b',LineWidth=1.5)
hold on
plot(wing_extension_alpha,wing_extension_CL,'-.r',LineWidth=1.5)
hold on
plot(Louvered_alpha,Louvered_CL,'--k',LineWidth=1.5)
hold on
plot(CL_VS_ALPHA.Var1,CL_VS_ALPHA.Var2,'sb',MarkerSize=8,MarkerFaceColor='b')
hold on
plot(CL_VS_ALPHA.Var3,CL_VS_ALPHA.Var4,'or',MarkerSize=8,MarkerFaceColor='r')
hold on
plot(CL_VS_ALPHA.Var5,CL_VS_ALPHA.Var6,'dk',MarkerSize=8,MarkerFaceColor='k')
hold on
grid on
legend('Baseline-ASWING','Extension-ASWING','Louvered','Baseline-ASWING','Extension: Exp', 'Louvered: Exp')
xlabel('angle of attack in deg')
ylabel('C_L')
subplot(1,2,2)
plot(wing_alone_alpha,wing_alone_CL,'-b',LineWidth=1.5)
hold on
plot(wing_extension_alpha,wing_extension_CL,'-.r',LineWidth=1.5)
hold on
plot(Louvered_alpha,Louvered_CL,'--k',LineWidth=1.5)
hold on
plot(CL_VS_ALPHA.Var1,CL_VS_ALPHA.Var2,'sb',MarkerSize=8,MarkerFaceColor='b')
hold on
plot(CL_VS_ALPHA.Var3,CL_VS_ALPHA.Var4,'or',MarkerSize=8,MarkerFaceColor='r')
hold on
plot(CL_VS_ALPHA.Var5,CL_VS_ALPHA.Var6,'dk',MarkerSize=8,MarkerFaceColor='k')
hold on
grid on
legend(leg1,leg2,leg3,leg4,leg5,leg6,'interpreter','latex')
xlabel('angle of attack in deg')
ylabel('C_L')
title('zoom')

figure(2)
subplot(1,2,1)
plot(wing_alone_CL,wing_alone_CD,'-b',LineWidth=1.5)
hold on
plot(wing_extension_CL,wing_extension_CD,'-.r',LineWidth=1.5)
hold on
plot(Louvered_CL,Louvered_CD,'--k',LineWidth=1.5)
hold on
plot(TS_60_45_30_CL,TS_60_45_30_CD,'-','color',[0 0.5 0],LineWidth=1.5)
hold on
plot(CD_CL_exp.Var2,CD_CL_exp.Var1,'sb',MarkerSize=8,MarkerFaceColor='b')
hold on
plot(CD_CL_exp.Var4,CD_CL_exp.Var3,'or',MarkerSize=8,MarkerFaceColor='r')
hold on
plot(CD_CL_exp.Var6,CD_CL_exp.Var5,'dk',MarkerSize=8,MarkerFaceColor='k')
hold on
plot(TS_60_45_30_exp.Var1,TS_60_45_30_exp.Var2,'v','color',[0 0.5 0],MarkerSize=8,MarkerFaceColor=[0 0.5 0])

grid on
legend('Baseline: ASWING','Extension: ASWING','Louvered: ASWING','Baseline: ASWING','Tip sails: ASWING','Extension: Exp', 'Louvered: Exp','Tip sails: Exp')
xlabel('C_L')
ylabel('C_D')
subplot(1,2,2)
plot(wing_alone_CL,wing_alone_CD,'-b',LineWidth=1.5)
hold on
plot(wing_extension_CL,wing_extension_CD,'-.r',LineWidth=1.5)
hold on
plot(Louvered_CL,Louvered_CD,'--k',LineWidth=1.5)
hold on
plot(TS_60_45_30_CL,TS_60_45_30_CD,'-','color',[0 0.5 0],LineWidth=1.5)
hold on
plot(CD_CL_exp.Var2,CD_CL_exp.Var1,'sb',MarkerSize=8,MarkerFaceColor='b')
hold on
plot(CD_CL_exp.Var4,CD_CL_exp.Var3,'or',MarkerSize=8,MarkerFaceColor='r')
hold on
plot(CD_CL_exp.Var6,CD_CL_exp.Var5,'dk',MarkerSize=8,MarkerFaceColor='k')
hold on
plot(TS_60_45_30_exp.Var1,TS_60_45_30_exp.Var2,'v','color',[0 0.5 0],MarkerSize=8,MarkerFaceColor=[0 0.5 0])
title('zoom')
grid on
legend('Baseline','Extension','Louvered')
xlabel('C_L')
ylabel('C_D')
