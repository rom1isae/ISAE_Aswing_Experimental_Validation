clear all
close all
clc

NACAXFOIL = readtable('naca0012Re2E6M027.txt','NumHeaderLines',12);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CASE 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all; clc
figure(1)

CASE2_ASW =  readtable('CASE2_CL.txt','NumHeaderLines',3)

CASE2_CL = readtable('CASE2_CL.csv','NumHeaderLines',2)

x = CASE2_CL.Var1(1:end-2);
y = CASE2_CL.Var2(1:end-2);
p= polyfit(x,y,1);
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
yfit = polyval(p,CASE2_CL.Var1);
plot(CASE2_CL.Var1,yfit,'--k','LineWidth',1.5)
leg1 = "$cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on

x = CASE2_CL.Var3(1:end-2);
y = CASE2_CL.Var4(1:end-2);
p_LLT= polyfit(x,y,1)
err_LLT = 100*(p_LLT(1)-p(1))/p(1);
yfit = polyval(p_LLT,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
yfit = polyval(p_LLT,CASE2_CL.Var3)
plot(CASE2_CL.Var3,yfit,'-.d','color',[0 0.5 0],'LineWidth',1.5)
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";
hold on

x = CASE2_ASW.Var3(1:end-2);
y = CASE2_ASW.Var6(1:end-2);

p_ASW= polyfit(x,y,1);
err_ASW = 100*(p_ASW(1)-p(1))/p(1);
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
yfit = polyval(p_ASW,CASE2_ASW.Var3)
plot(CASE2_ASW.Var3,yfit,'-r','LineWidth',1.5)
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on

plot(CASE2_CL.Var1, CASE2_CL.Var2,'sk','LineWidth',1.5,MarkerSize=10)
hold on 
plot([CASE2_CL.Var3 ;CASE2_CL.Var1(end-1:end)], [CASE2_CL.Var4 ;CASE2_ASW.Var6(end-1:end)],'d','color',[0 0.5 0],'LineWidth',1.5,MarkerSize=10)
hold on
plot(CASE2_CL.Var1, CASE2_ASW.Var6,'*r','LineWidth',1.5,MarkerSize=10)
grid on
xlabel('\alpha in ^\circ')
ylabel('C_L')
legend(leg1,leg2,leg3,"Exp","ASWING-ISAE","ASWING 5.96",'Interpreter','latex',Location='southoutside')


figure(2)

x = CASE2_CL.Var3(1:end-2);
y = CASE2_CL.Var4(1:end-2);

p_LLT= polyfit(x,y,1)
CASE2_CL.Var4  = polyval(p_LLT,CASE2_CL.Var1);
plot(CASE2_ASW.Var3, 100*abs(CASE2_CL.Var4 - CASE2_CL.Var2)./CASE2_CL.Var2,'-ok')
hold on 
plot(CASE2_ASW.Var3, 100*abs(CASE2_ASW.Var6 - CASE2_CL.Var2)./CASE2_CL.Var2,'-*b')
xlabel('\alpha in degree')
ylabel('\epsilon_{CL} (in %)')
legend('Chreim & al Lifting Line','ASWING LLT')
grid on

figure(3)
x = NACAXFOIL.Var1;
y = NACAXFOIL.Var3;
p = polyfit(x,y,5);
naca0012cdp = polyval(p,CASE2_CL.Var1);
CASE2_CD = readtable('CASE2_CD.csv','NumHeaderLines',2)
plot(CASE2_CD.Var1, CASE2_CD.Var2,'sk','LineWidth',1.5,MarkerSize=10)
% hold on 
% plot(CASE2_CD.Var3, CASE2_CD.Var4,'--ok','LineWidth',1)
hold on
plot(CASE2_CL.Var1, CASE2_ASW.Var7,'-*r','LineWidth',1.5,MarkerSize=10)
grid on
hold on
plot(CASE2_CL.Var1,CASE2_ASW.Var7+naca0012cdp-naca0012cdp(1),'-.d','color',[0 0.5 0],'LineWidth',1.5,MarkerSize=10)
xlabel('\alpha in ^\circ')
ylabel('C_D')
% legend('Experiments','Chreim & al Lifting Line','ASWING LLT','modifed ASWING')

legend('Experiments','ASWING 5.96','ASWING-ISAE')



figure(4)
plot(CASE2_CD.Var1, 100*abs(CASE2_CD.Var4 - CASE2_CD.Var2)./CASE2_CD.Var2,'-ok')
hold on
plot(CASE2_ASW.Var3, 100*abs(CASE2_ASW.Var7 - CASE2_CD.Var2)./CASE2_CD.Var2,'-*b')
grid on
xlabel('\alpha in degree')
ylabel('\epsilon_{CD} (in %)')

legend('Chreim & al Lifting Line','ASWING LLT')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CASE 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
close all; clc
figure(1)

CASE3_ASW =  readtable('CASE3_CL.txt','NumHeaderLines',3)

CASE3_CL = readtable('CASE3_DATA.txt','NumHeaderLines',0)

x = CASE3_CL.alpha;
y = CASE3_CL.CL
p= polyfit(x,y,1);
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'--k',LineWidth=1.5)
leg1 = "$cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on

x = CASE3_CL.alpha;
y = CASE3_CL.CL_LLT;
p_LLT= polyfit(x,y,1)
err_LLT = 100*(p_LLT(1)-p(1))/p(1);
yfit = polyval(p_LLT,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'-.','color',[0 0.5 0],LineWidth=1.5)
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";
hold on

x = CASE3_ASW.Var3;
y = CASE3_ASW.Var6;

p_ASW= polyfit(x,y,1);
err_ASW = 100*(p_ASW(1)-p(1))/p(1);
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on

plot(x,yfit,'-r',LineWidth=1.5)
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on


plot(CASE3_CL.alpha, CASE3_CL.CL,'sk',LineWidth=1.5,MarkerSize=10)
hold on 
plot(CASE3_CL.alpha, CASE3_CL.CL_LLT,'d','color',[0 0.5 0],LineWidth=1.5,MarkerSize=10)
hold on
plot(CASE3_ASW.Var3, CASE3_ASW.Var6,'*r',LineWidth=1.5,MarkerSize=10)
grid on
xlabel('\alpha in ^\circ')
ylabel('C_L')
legend(leg1,leg2,leg3,"Exp","ASWING-ISAE","ASWING 5.96",'Interpreter','latex',Location='southoutside')


figure(2)
% CASE3_CD = readtable('CASE3_CD.csv','NumHeaderLines',2)
x = NACAXFOIL.Var1;
y = NACAXFOIL.Var3;
p = polyfit(x,y,5);
naca0012cdp = polyval(p,CASE3_ASW.Var3);
plot(CASE3_CL.alpha, CASE3_CL.CD,'sk',LineWidth=1.5,MarkerSize=10)
hold on 
% plot(CASE3_CL.alpha, CASE3_CL.CD_LLT,'--ok')
% hold on
plot(CASE3_ASW.Var3, CASE3_ASW.Var7,'-*r',LineWidth=1.5,MarkerSize=10)
hold on
plot(CASE3_ASW.Var3,CASE3_ASW.Var7+naca0012cdp-naca0012cdp(1),'-.d','color',[0 0.5 0],LineWidth=1.5,MarkerSize=10)
grid on
xlabel('\alpha in ^\circ')
ylabel('C_D')
% legend('Experiments','Chreim & al Lifting Line','ASWING 5.96','ASWING-ISAE')
legend('Experiments','ASWING 5.96','ASWING-ISAE','Interpreter','latex')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CASE 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;clc
figure(1)
CASE4_CL = readtable('CASE4_CL.csv','NumHeaderLines',2);
CASE4_ASW = readtable('CASE4.txt','NumHeaderLines',3);
CASE4_ASW_CD = readtable('CASE4_ASW_CD.txt','NumHeaderLines',3);


x = CASE4_CL.Var1;
y = CASE4_CL.Var2;
p= polyfit(x,y,1);
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'--k',LineWidth=1.5)
leg1 = "$cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on

x = CASE4_CL.Var3(1:end-1);
y = CASE4_CL.Var4(1:end-1);
p_LLT= polyfit(x,y,1)
err_LLT = 100*(p_LLT(1)-p(1))/p(1);
yfit = polyval(p_LLT,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'-.','color',[0 0.5 0],LineWidth=1.5)
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";
hold on

x = CASE4_ASW.Var3;
y = CASE4_ASW.Var6;

p_ASW= polyfit(x,y,1);
err_ASW = 100*(p_ASW(1)-p(1))/p(1);
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'-r',LineWidth=1.5)
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on


p = polyfit(CASE4_CL.Var3(1:end-1),CASE4_CL.Var4(1:end-1),1);
CASE4_CL.Var4= polyval(p,CASE4_CL.Var1);

plot(CASE4_CL.Var1, CASE4_CL.Var2,'sk',LineWidth=1.5,MarkerSize=10)
hold on 
plot(CASE4_CL.Var1, CASE4_CL.Var4,'d','color',[0 0.5 0],LineWidth=1.5,MarkerSize=10)
hold on
plot(CASE4_ASW.Var3, CASE4_ASW.Var6,'*r',LineWidth=1.5,MarkerSize=10)
grid on
xlabel('\alpha in ^\circ')
ylabel('C_L')
legend(leg1,leg2,leg3,"Exp","ASWING-ISAE","ASWING 5.96",'Interpreter','latex',Location='southoutside')
% legend('Experiments','Chreim & al Lifting Line','ASWING LLT')


figure(2)
plot(CASE4_ASW.Var3, 100*abs(CASE4_CL.Var4 - CASE4_CL.Var2)./CASE4_CL.Var2,'-ok',MarkerSize=10)
hold on 
plot(CASE4_ASW.Var3, 100*abs(CASE4_ASW.Var6 - CASE4_CL.Var2)./CASE4_CL.Var2,'-*b',MarkerSize=10)
xlabel('\alpha in degree')
ylabel('\epsilon_{CL} (in %)')
legend('Chreim & al Lifting Line','ASWING LLT')
grid on

CASE4_CD = readtable('CASE4_CD.csv','NumHeaderLines',2);
p = polyfit(CASE4_CD.Var3,CASE4_CD.Var4,10);
CASE4_CD.Var4= polyval(p,CASE4_CD.Var1);
figure(3)
x = NACAXFOIL.Var1;
y = NACAXFOIL.Var3;
p = polyfit(x,y,5);
naca0012cdp = polyval(p,CASE4_ASW_CD.Var3);

plot(CASE4_CD.Var1, CASE4_CD.Var2,'sk',LineWidth=1.5,MarkerSize=10)
hold on 
plot(CASE4_CD.Var1, CASE4_CD.Var4,'-.d','color',[0 0.5 0],LineWidth=1.5,MarkerSize=10)
hold on
plot(CASE4_ASW_CD.Var3,   CASE4_ASW_CD.Var7,'-*r',LineWidth=1.5,MarkerSize=10)
% hold on
% plot(CASE4_ASW_CD.Var3,   CASE4_ASW_CD.Var8  ,'-db')
% hold on
% plot(CASE4_ASW_CD.Var3,CASE4_ASW_CD.Var7+naca0012cdp-naca0012cdp(1),'-d','color',[0 0.5 0])
grid on
xlabel('\alpha in ^\circ')
ylabel('C_D')
legend('Experiments','ASWING-ISAE','ASWING 5.96','Interpreter','latex')


figure(4)
plot(CASE4_CD.Var1, 100*abs(CASE4_CD.Var4 - CASE4_CD.Var2)./CASE4_CD.Var2,'-ok')
hold on
plot(CASE4_ASW_CD.Var3, 100*abs(CASE4_ASW_CD.Var7 - CASE4_CD.Var2)./CASE4_CD.Var2,'-*b')
grid on
xlabel('\alpha in degree')
ylabel('\epsilon_{CD} (in %)')

legend('Chreim & al Lifting Line','ASWING LLT')

figure(5)
x = NACAXFOIL.Var1
y = NACAXFOIL.Var3
p = polyfit(x,y,5);
naca0012cdp = polyval(p,CASE4_ASW_CD.Var3)
NACAXFOIL = readtable('naca0012Re2E6M027.txt','NumHeaderLines',12);
delta_cd = CASE4_ASW_CD.Var7(1)+naca0012cdp(1) - CASE4_CD.Var2(1);
plot(CASE4_ASW_CD.Var3, CASE4_ASW_CD.Var7+naca0012cdp-delta_cd,'-db')
hold on
plot(CASE4_ASW_CD.Var3, CASE4_ASW_CD.Var7,'-*b')
hold on
plot(CASE4_CD.Var1, CASE4_CD.Var2,'sr')
grid on
xlabel('\alpha in degree')
ylabel('\epsilon_{CD}')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CASE 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;clc
figure(1)
CASE5_CL = readtable('CASE5_CL.csv','NumHeaderLines',2)
CASE5_ASW = readtable('CASE5.txt','NumHeaderLines',3)

% p = polyfit(CASE5_CL.Var3(end-1),CASE5_CL.Var4(end-1),1)
% CASE5_CL.Var4= polyval(p,CASE5_CL.Var1);
err = 0.001*ones(size(CASE5_CL.Var1));

x = CASE5_CL.Var1;
y = CASE5_CL.Var2;
p= polyfit(x,y,1);
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'--k')
leg1 = "$cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on

x = CASE5_CL.Var3(1:end-1);
y = CASE5_CL.Var4(1:end-1);
p_LLT= polyfit(x,y,1)
err_LLT = 100*(p_LLT(1)-p(1))/p(1);
yfit = polyval(p_LLT,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'-.','color',[0 0.5 0])
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";
hold on

x = CASE5_ASW.Var3;
y = CASE5_ASW.Var6;

p_ASW= polyfit(x,y,1);
err_ASW = 100*(p_ASW(1)-p(1))/p(1);
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'-r')
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on


% p = polyfit(CASE5_CL.Var3(1:end-1),CASE5_CL.Var4(1:end-1),1);
% CASE5_CL.Var4= polyval(p,CASE5_CL.Var3);

plot(CASE5_CL.Var1, CASE5_CL.Var2,'sk','LineWidth',1.5,MarkerSize=10)
hold on 
plot(CASE5_CL.Var3, CASE5_CL.Var4,'d','color',[0 0.5 0],'LineWidth',1.5,MarkerSize=10)
hold on
plot(CASE5_ASW.Var3, CASE5_ASW.Var6,'*r','LineWidth',1.5,MarkerSize=10)
grid on
xlabel('\alpha in ^\circ')
ylabel('C_L')
legend(leg1,leg2,leg3,"Exp","ASWING-ISAE","ASWING 5.96",'Interpreter','latex',Location='southoutside')


% 
% error_ASWING = max(100*abs(CASE5_ASW.Var6 - CASE5_CL.Var2+err(1))./ ...
%     (CASE5_CL.Var2+err(1)),100*abs(CASE5_ASW.Var6 -...
%     CASE5_CL.Var2-err(1))./(CASE5_CL.Var2-err(1)))
% error_LLT = max(100*abs(CASE5_CL.Var4 - CASE5_CL.Var2+err(1))./ ...
%     (CASE5_CL.Var2+err(1)),100*abs(CASE5_CL.Var4 - ...
%     CASE5_CL.Var2-err(1))./(CASE5_CL.Var2-err(1)))
% figure(2)
% errorbar(CASE5_ASW.Var3, 100*abs(CASE5_CL.Var4 - ...
%     CASE5_CL.Var2)./CASE5_CL.Var2,error_LLT,'-ok','LineWidth',1)
% hold on 
% errorbar(CASE5_ASW.Var3, 100*abs(CASE5_ASW.Var6 - ...
%     CASE5_CL.Var2)./CASE5_CL.Var2,error_ASWING,'-*b','LineWidth',1)
% plot(CASE5_ASW.Var3, 100*abs(CASE5_CL.Var4 - ...
%     CASE5_CL.Var2)./CASE5_CL.Var2,'-ok','LineWidth',1)
% hold on 
% plot(CASE5_ASW.Var3, 100*abs(CASE5_ASW.Var6 - ...
%     CASE5_CL.Var2)./CASE5_CL.Var2,'-*b','LineWidth',1)
% grid on 
% xlabel('\alpha in degree')
% ylabel('\epsilon_{CL} in (%)')
% legend('Chreim & al Lifting Line','ASWING LLT')



CASE5_ASW = readtable('CASE5_ASW_CD.txt','NumHeaderLines',3)

figure(3)
CASE5_CD = readtable('CASE5_CD.csv','NumHeaderLines',2)
plot(CASE5_CD.Var1, CASE5_CD.Var2,'sr','LineWidth',1,MarkerSize=10)
hold on 
plot(CASE5_CD.Var3, CASE5_CD.Var4,'--ok','LineWidth',1,MarkerSize=10)
hold on
plot(CASE5_ASW.Var3,  CASE5_ASW.Var7,'-*b','LineWidth',1,MarkerSize=10)
grid on
ylim([0.01 0.05])
xlabel('\alpha in degree')
ylabel('CD')

legend('Experiments','Chreim & al Lifting Line','ASWING LLT')
figure(4)
plot(CASE5_ASW.Var3, 100*abs(CASE5_CD.Var4 - CASE5_CD.Var2)./CASE5_CD.Var2,'-ok','LineWidth',1)
hold on 
plot(CASE5_ASW.Var3, 100*abs( CASE5_ASW.Var7 - CASE5_CD.Var2)./CASE5_CD.Var2,'-*b','LineWidth',1)
grid on 
xlabel('\alpha in degree')
ylabel('\epsilon_{CD} in (%)')
legend('Chreim & al Lifting Line','ASWING LLT')


figure(5)
x = NACAXFOIL.Var1;
y = NACAXFOIL.Var3;
p = polyfit(x,y,5);
naca0012cdp = polyval(p,CASE5_CD.Var3);

delta_cd = CASE5_ASW.Var7(1)+naca0012cdp(1) - CASE5_CD.Var2(1);
plot(CASE5_ASW.Var3, CASE5_ASW.Var7+naca0012cdp-delta_cd,'-.d','color',[0 0.5 0],'LineWidth',1.5,MarkerSize=10)
hold on
plot(CASE5_ASW.Var3, CASE5_ASW.Var7,'-*r','LineWidth',1.5,MarkerSize=10)
hold on
plot(CASE5_CD.Var1, CASE5_CD.Var2,'sk','LineWidth',1.5,MarkerSize=10)
% hold on 
% plot(CASE5_CD.Var3, CASE5_CD.Var4,'--ok','LineWidth',1.5)
grid on
legend('ASWING-ISAE','ASWING 5.96','Experimental data','Chreim LLT','Interpreter','latex')
xlabel('\alpha in ^\circ')
ylabel('C_D')

figure(6)
plot(CASE5_ASW.Var3, 100*abs(CASE5_CD.Var4 - CASE5_CD.Var2)./CASE5_CD.Var2,'-ok','LineWidth',1)
hold on 
plot(CASE5_ASW.Var3, 100*abs( CASE5_ASW.Var7 - CASE5_CD.Var2)./CASE5_CD.Var2,'-*b','LineWidth',1)
grid on 
plot(CASE5_ASW.Var3, 100*abs(CASE5_ASW.Var7+naca0012cdp-delta_cd- CASE5_CD.Var2)./CASE5_CD.Var2,'-d','color',[0 0.5 0])
hold on 
legend('Chreim LLT','ASWING 5.96','modified ASWING')
xlabel('\alpha in degree')
ylabel('\epsilon_{CD} in (%)')
% legend('Chreim & al Lifting Line','ASWING LLT')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CASE 6 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

close all;clc
figure(1)

CASE6_CCM = readtable('CASE6_CCM.csv','NumHeaderLines',2)
CASE6 = readtable('CASE6.txt','NumHeaderLines',3)

x = CASE6_CCM.Var1;
y = CASE6_CCM.Var2;
p= polyfit(x,y,1);
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
plot(x,yfit,'--k','Linewidth',1)
leg1 = "$cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on


x = CASE6.Var3;
y = 0.5*sqrt(2)*CASE6.Var6;
p_LLT= polyfit(x,y,1);
err_LLT = 100*(p_LLT(1)-p(1))/p(1);
yfit = polyval(p_LLT,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'-r','Linewidth',1)
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";
hold on

plot(CASE6_CCM.Var1,CASE6_CCM.Var2,'sk','Linewidth',1.5,MarkerSize=10)
hold on
plot(CASE6.Var3,0.5*sqrt(2)*CASE6.Var6,'*r','Linewidth',1.5,MarkerSize=10)
hold on
plot(CASE6.Var3,CASE6.Var6,'-.*b','Linewidth',1.5,MarkerSize=10)
xlabel('\alpha in ^\circ')
ylabel('C_L')
grid on

legend(leg1,leg2,"StarCCM+","corrected ASWING LLT",'uncorrected ASWING LLT','Interpreter','latex',Location='southoutside')


figure(2)
err_CL = 100*(CASE6_CCM.Var2-0.5*sqrt(2)*CASE6.Var6(3:end))./CASE6_CCM.Var2;

plot(CASE6_CCM.Var1,err_CL,'-*b','Linewidth',1)
xlabel('\alpha in degree')
ylabel('\epsilon_{CL} in %')
grid on

figure(3)
x = NACAXFOIL.Var1;
y = NACAXFOIL.Var3;
p = polyfit(x,y,5);

naca0012cdp = polyval(p,CASE6.Var3);
plot([CASE6_CCM.Var1(1:end-3); 14; 16; 18],[CASE6_CCM.Var3(1:end-3); 0.063; 0.078; 0.095],'sk','Linewidth',1,MarkerSize=10)
hold on
plot(CASE6.Var3,CASE6.Var7,'--*r','Linewidth',1,MarkerSize=10)
hold on
plot(CASE6.Var3,CASE6.Var7+naca0012cdp-naca0012cdp(1),'-.d','color',[0 0.5 0],'Linewidth',1,MarkerSize=10)
xlabel('\alpha in ^\circ')
ylabel('C_D')
grid on
legend('StarCCM+','ASWING 5.96','ASWING-ISAE','Interpreter','latex')


figure(4)
err_CD = abs(100*(CASE6_CCM.Var3-CASE6.Var7(3:end))./CASE6_CCM.Var3);
err_CD_modif =  abs(100*(CASE6_CCM.Var3-(CASE6.Var7(3:end)+naca0012cdp(3:end)-naca0012cdp(1)))./CASE6_CCM.Var3);
plot(CASE6_CCM.Var1,err_CD,'-*b','Linewidth',1)
hold on
plot(CASE6_CCM.Var1,err_CD_modif,'-d','color',[0 0.5 0],'Linewidth',1)
xlabel('\alpha in degree')
ylabel('|\epsilon_{CD}| in %')
grid on



figure(5)
plot(CASE6.Var3,CASE6.Var9,'-*b')