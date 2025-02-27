clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SA-7 Tandem 1 - Wake interference - lift and Drag
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% RUN Aswing SIMULATION

% system('Aswing_Simulations/Tandem_GAW2_L163_G05.sh')
% %%
% system('Aswing_Simulations/Tandem_GAW2_L163_G05_Fore_Only.sh')

%% Airframe impact
T2 = readtable('Aswing_Simulations/Tandem_GAW2_L163_G05_Fore_Only.txt','NumHeaderLines',3);
T1 = readtable('Aswing_Simulations/Tandem_GAW2_L163_G05.txt','NumHeaderLines',3);
T = readtable('Experimental_Data/NASA-LANGLEYLS10413.csv','NumHeaderLines',2);
T3 = readtable('Experimental_Data/NASA_Tandem_l163_g05.csv','NumHeaderLines',2);



figure(1)

x = T.Var5;
y = T.Var6;
p= polyfit(x,y,1);
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'--k',LineWidth=1)
leg1 = "$cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on


x = T1.Var3(1:end-11);
y = T1.Var6(1:end-11);
p_ASW= polyfit(x,y,1);
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'-r',LineWidth=1)
err_ASW = 100*(p_ASW(1)-p(1))/p(1);
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on

x = T.Var1(1:end-5)
y = T.Var2(1:end-5);
p_LLT= polyfit(x,y,1);
yfit = polyval(p_LLT,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,':b',LineWidth=1)
err_LLT= 100*(p_LLT(1)-p(1))/p(1);
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";
hold on

x = T.Var3(1:end-5)
y = T.Var4(1:end-5);
p_CFD= polyfit(x,y,1);
yfit = polyval(p_CFD,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'Color',[0 0.5 0],LineWidth=1,LineStyle='-.')
err_CFD = 100*(p_CFD(1)-p(1))/p(1);
leg4 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_CFD)+ "\%)$";
hold on



plot(T.Var5,T.Var6,'ks',LineWidth=1,MarkerSize=10)
hold on
plot(T1.Var3,T1.Var6,'r*',LineWidth=1,MarkerSize=10)
hold on
plot(T.Var1,T.Var2,'bd',LineWidth=1,MarkerSize=10)
hold on 
plot(T.Var3,T.Var4,'o','Color',[0 0.5 0],LineWidth=1,MarkerSize=10)
hold on 
grid on


xlim([-7.5 12.5])
ylim([-0.2 1.8])
legend(leg1,leg2,leg3,leg4,"Exp","ASWING 5.96","Cheng & Wang's LLT","Cheng & Wang's CFD",'Interpreter','latex',Location='southoutside')
xlabel("\alpha in deg")
ylabel("C_L")

%%



figure(2)

x = T3.Var3(1:end-14);
y = T3.Var4(1:end-14);
p= polyfit(x,y,1);
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'--k',LineWidth=1)
leg1 = "$cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on



x = T2.Var3(1:end-12);
y = T2.Var6(1:end-12);
p_ASW= polyfit(x,y,1);
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'-r',LineWidth=1)
err_ASW = 100*(p_ASW(1)-p(1))/p(1);
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on

x = T.Var7(1:end-5);
y = T.Var8(1:end-5);
p_LLT= polyfit(x,y,1);
yfit = polyval(p_LLT,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,':b',LineWidth=1)
err_LLT= 100*(p_LLT(1)-p(1))/p(1);
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";
hold on

x = T.Var9(1:end-5)
y = T.Var10(1:end-5);
p_CFD= polyfit(x,y,1);
yfit = polyval(p_CFD,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'Color',[0 0.5 0],LineWidth=1,LineStyle='-.')
err_CFD = 100*(p_CFD(1)-p(1))/p(1);
leg4 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_CFD)+ "\%)$";
hold on



plot(T3.Var3,T3.Var4,'ks',MarkerSize=10)
hold on
plot(T2.Var3,T2.Var6,'r*',MarkerSize=10)
hold on
plot(T.Var7,T.Var8,'bd',MarkerSize=10)
hold on 
plot(T.Var9,T.Var10,'o','Color',[0 0.5 0],LineWidth=1,MarkerSize=10)
hold on 
% xlim([-7.5 12.5])
% ylim([-0.2 1.8])
legend(leg1,leg2,leg3,leg4,"Exp","ASWING 5.96","Cheng & Wang's LLT","Cheng & Wang's CFD ",'Interpreter','latex',Location='southoutside')
grid on
xlabel("\alpha in deg")
ylabel("C_L")
%%

figure(3)
x = T.Var17;
y = T.Var18;
p= polyfit(x,y,1);
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'--k',LineWidth=1)
leg1 = "$cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on


x = T1.Var3(1:end-11);
y = T1.Var6(1:end-11)-T2.Var6(1:end-11);
p_ASW= polyfit(x,y,1);
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'-r',LineWidth=1)
err_ASW = 100*(p_ASW(1)-p(1))/p(1);
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on
% 
x = T.Var13(1:end-5);
y = T.Var14(1:end-5);
p_LLT= polyfit(x,y,1);
yfit = polyval(p_LLT,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,':b',LineWidth=1)
err_LLT= 100*(p_LLT(1)-p(1))/p(1);
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";
hold on
% 
x = T.Var15(1:end-5)
y = T.Var16(1:end-5);
p_CFD= polyfit(x,y,1);
yfit = polyval(p_CFD,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'Color',[0 0.5 0],LineWidth=1,LineStyle='-.')
err_CFD = 100*(p_CFD(1)-p(1))/p(1);
leg4 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_CFD)+ "\%)$";
hold on



hold on
plot(T.Var17,T.Var18,'ks',MarkerSize=10)
hold on
plot(T1.Var3(1:end-11),T1.Var6(1:end-11)-T2.Var6(1:end-11),'r*',MarkerSize=10)
hold on
plot(T.Var13,T.Var14,'bd',MarkerSize=10)
hold on 
plot(T.Var15,T.Var16,'o','Color',[0 0.5 0],LineWidth=1,MarkerSize=10)
hold on 

grid on


% xlim([-7.5 12.5])
% ylim([-0.2 1.8])
legend(leg1,leg2,leg3,leg4,"Exp","ASWING 5.96","Cheng & Wang's LLT","Cheng & Wang's CFD ",'Interpreter','latex',Location='southoutside')
xlabel("\alpha in deg")
ylabel("C_L")
% title("CL VS \alpha for NASA/Langley airfoil")


%% CD_VS_CL

T = readtable('Experimental_Data/NASA_Tandem_CD_VS_CL_l163_g05.csv','NumHeaderLines',2);
figure(4)
plot(T.Var4,T.Var1,'bs',MarkerSize=10)
hold on
plot(T.Var2,T.Var3,'ks',MarkerSize=10)
hold on
plot(T1.Var7(2:end-11),T1.Var6(2:end-11),'-r*',MarkerSize=10)
grid on
xlabel('C_D')
ylabel('C_L')
legend('Experiment : Uncorrected', 'Experiment : Corrected','ASWING 5.96')

