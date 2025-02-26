
%% RUN SIMULATION

% system('Aswing_Simulations/Tandem_Airframe_NACA4309.sh')
% system('Aswing_Simulations/Tandem_Airframe_NACA4309_Fore_Only.sh')

%% Airframe impact
T = readtable('Experimental_Data/Airframe_impact.csv','NumHeaderLines',2);
T1 = readtable('Aswing_Simulations/Tandem_Airframe_NACA4309.txt','NumHeaderLines',3)
T2 = readtable('Aswing_Simulations/Tandem_Airframe_NACA4309_Fore_Only.txt','NumHeaderLines',3)
close all




figure(1)

x = T.Var15(2:end-2);
y = T.Var16(2:end-2);
p_CFD= polyfit(x,y,1);
yfit = polyval(p_CFD,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'--k')
leg1 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on

x = T2.Var3(3:end-4);
y = T2.Var6(3:end-4);
p_ASW= polyfit(x,y,1)
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'-r')
err_ASW = 100*(p_ASW(1)-p_CFD(1))/p_CFD(1);
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on

x = T.Var7(2:end-2);
y = T.Var8(2:end-2);
p_LLT= polyfit(x,y,1);
yfit = polyval(p_LLT,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'-.b')
err_LLT = 100*(p_LLT(1)-p_CFD(1))/p_CFD(1);
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";


hold on
plot(T.Var15,T.Var16,'ks',MarkerSize=10)
hold on
plot(T2.Var3,T2.Var6,'r*',MarkerSize=10)
hold on
plot(T.Var7,T.Var8,'bo',MarkerSize=10)
legend(leg1,leg2,leg3,"Cheng & al's CFD","ASWING 5.96","Cheng & al's LLT",'Interpreter','latex',Location='southoutside')
grid on
xlabel("\alpha in deg")
ylabel("Lift Coefficient")
title("Foward wing")

figure(2)

x = T.Var17(2:end-1);
y = T.Var18(2:end-1);
p_CFD= polyfit(x,y,1);
yfit = polyval(p_CFD,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'--k')
leg1 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on

x = T2.Var3(3:end-4);
y = T1.Var6(3:end-4)-T2.Var6(3:end-4);
p_ASW= polyfit(x,y,1)
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'-r')
err_ASW = 100*(p_ASW(1)-p_CFD(1))/p_CFD(1);
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on

x = T.Var9(2:end-2);
y = T.Var10(2:end-2);
p_LLT= polyfit(x,y,1);
yfit = polyval(p_LLT,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'-.b')
err_LLT = 100*(p_LLT(1)-p_CFD(1))/p_CFD(1);
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";

plot(T.Var17,T.Var18,'ks',MarkerSize=10)
hold on
plot(T2.Var3,T1.Var6-T2.Var6,'r*',MarkerSize=10)
hold on
plot(T.Var9,T.Var10,'bo',MarkerSize=10)
legend(leg1,leg2,leg3,"Cheng & al's CFD","Aswing 5.96","Cheng & al's LLT",'Interpreter','latex',Location='southoutside')
grid on
xlabel("\alpha in deg")
ylabel("Lift Coefficient")
title("Backward wing")

figure(3)

x = T.Var13(2:end-2);
y = T.Var14(2:end-2);
p_CFD= polyfit(x,y,1);
yfit = polyval(p_CFD,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'--k')
leg1 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on

x = T1.Var3(3:end-4);
y = T1.Var6(3:end-4);
p_ASW= polyfit(x,y,1)
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'-r')
err_ASW = 100*(p_ASW(1)-p_CFD(1))/p_CFD(1);
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on

x =T.Var11(2:end-2);
y = T.Var12(2:end-2);
p_LLT= polyfit(x,y,1);
yfit = polyval(p_LLT,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'-.b')
err_LLT = 100*(p_LLT(1)-p_CFD(1))/p_CFD(1);
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";

plot(T.Var13,T.Var14,'ks',MarkerSize=10)
hold on
plot(T1.Var3,T1.Var6,'r*',MarkerSize=10)
hold on 
plot(T.Var11,T.Var12,'bo',MarkerSize=10)

legend(leg1,leg2,leg3,"Cheng & al's CFD","ASWING 5.96","Cheng & al's LLT",'Interpreter','latex',Location='southoutside')
grid on
xlabel("\alpha in deg")
ylabel("Lift Coefficient")
title('Total')
% 

