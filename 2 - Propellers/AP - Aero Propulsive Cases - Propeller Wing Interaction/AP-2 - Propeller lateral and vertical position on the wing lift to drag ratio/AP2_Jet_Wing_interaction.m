clear all
close all



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Veldhuis finesse : APROPOS ALPHA 1.05 deg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear CL_CD1
clear y_p
% close all
APROPOS_ALPHA1 = readtable("Experimental_Data/Velhuis2_CL_CD2.csv",NumHeaderLines=2)

D = 0.236
R = D/2;


z_p = [-1.017 -0.508 0.0 0.508]*R;
% y_p = 0.0:0.05:1.0;
% y_p = y_p*0.64;

b = 0.64;
y_p1 = 0.0:0.01:0.20;
y_p = [APROPOS_ALPHA1.Var1*b];
x_p = -1.44*R;
%% Aswing simulation 
% for i = 1:length(z_p)
%     for j = 1:length(y_p)
%         change_ppropeller_position('Aswing_Simulation/APROPOS1.asw',x_p,y_p(j),z_p(i));
%         [out1,out2] = system('sh Aswing_Simulation/APROPOS1.sh');
%         APROPOS_TEMP4 = readtable("Aswing_Simulation/APROPOS1_temp.csv",NumHeaderLines=3);
%         CL_CD1(i,j) = APROPOS_TEMP4.Var11/APROPOS_TEMP4.Var17
%     end
% end
% save("Aswing_Simulation/APROPOS1.mat","y_p","CL_CD1")


% Plot
load("Aswing_Simulation/APROPOS1.mat")
figure(1)
plot(APROPOS_ALPHA1.Var1,APROPOS_ALPHA1.Var2,'ko',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot(APROPOS_ALPHA1.Var3,APROPOS_ALPHA1.Var4,'ks',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot(APROPOS_ALPHA1.Var5,APROPOS_ALPHA1.Var6,'k^',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot(APROPOS_ALPHA1.Var7,APROPOS_ALPHA1.Var8,'ks',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot([0 0.25],[14.44 14.44],'-db',MarkerFaceColor='b',MarkerFaceColor='k',LineWidth=5.0,MarkerSize=8)

hold on 
plot(y_p/b,CL_CD1(1,:),'-ro',LineWidth=1.5,MarkerSize=8)
hold on 
plot(y_p/b,CL_CD1(2,:),'-rs',LineWidth=1.5,MarkerSize=8)
hold on 
plot(y_p/b,CL_CD1(3,:),'-r^',LineWidth=1.5,MarkerSize=8)
hold on 
plot(y_p/b,CL_CD1(4,:),'-rs',LineWidth=1.5,MarkerSize=8)
ylim([0 16])
title("\alpha = 1.05°, Exp (black), ASWING (red)")


grid on 
xlabel('2y_p/b')
ylabel('CL/CD')
grid on 
legend('z_p / R = -1.017','z_p / R = -0.508','z_p / R = 0.0','z_p / R = 0.508','Prop off','NumColumns',2)
xlim([0.0 1.01])
% ylim([12 30])

set(gca,Fontsize=14)


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Veldhuis finesse : APROPOS ALPHA 4.2 deg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear CL_CD4
clear y_p
% close all
APROPOS_ALPHA4 = readtable("Experimental_Data/Velhuis2_CL_CD.csv",NumHeaderLines=2)

D = 0.236
R = D/2;


z_p = [-1.017 -0.508 0.0 0.508 1.017]*R;
% y_p = 0.0:0.05:1.0;
% y_p = y_p*0.64;

b = 0.64;
y_p1 = 0.0:0.01:0.20;
y_p = [APROPOS_ALPHA4.Var1*b];
x_p = -1.44*R;
%% Aswing Simulation: 
% for i = 1:length(z_p)
%     for j = 1:length(y_p)
%         change_ppropeller_position('Aswing_Simulation/APROPOS.asw',x_p,y_p(j),z_p(i));
%         [out1,out2] = system('sh Aswing_Simulation/APROPOS4.sh');
%         APROPOS_TEMP4 = readtable('Aswing_Simulation/APROPOS4_temp.csv',NumHeaderLines=3);
%         CL_CD4(i,j) = APROPOS_TEMP4.Var11/APROPOS_TEMP4.Var17;
%         CL(i,j) = APROPOS_TEMP4.Var11;
%         CD(i,j) =  APROPOS_TEMP4.Var17;
%     end
% end
% save("Aswing_Simulation/APROPOS4.mat","y_p","CL_CD4")


% Plot
load("Aswing_Simulation/APROPOS4.mat")
figure(2)
plot(APROPOS_ALPHA4.Var1,APROPOS_ALPHA4.Var2,'ko',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot(APROPOS_ALPHA4.Var3,APROPOS_ALPHA4.Var4,'ks',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot(APROPOS_ALPHA4.Var5,APROPOS_ALPHA4.Var6,'k^',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot(APROPOS_ALPHA4.Var7,APROPOS_ALPHA4.Var8,'ks',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot(APROPOS_ALPHA4.Var9,APROPOS_ALPHA4.Var10,'ko',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on
plot([0 0.25],[28.73 28.73],'-db',MarkerFaceColor='b',LineWidth=5.0,MarkerSize=8)

hold on 
plot(y_p/b,CL_CD4(1,:),'-ro',MarkerFaceColor='r',LineWidth=1.5,MarkerSize=8)
hold on 
plot(y_p/b,CL_CD4(2,:),'-rs',MarkerFaceColor='r',LineWidth=1.5,MarkerSize=8)
hold on 
plot(y_p/b,CL_CD4(3,:),'-r^',LineWidth=1.5,MarkerSize=8)
hold on 
plot(y_p/b,CL_CD4(4,:),'-rs',LineWidth=1.5,MarkerSize=8)
hold on 
plot(y_p/b,CL_CD4(5,:),'-ro',LineWidth=1.5,MarkerSize=8)
ylim([14 29])
title("\alpha = 4.2°, Exp (black), ASWING (red)")


grid on 
xlabel('2y_p/b')
ylabel('CL/CD')
grid on 
legend('z_p / R = -1.017','z_p / R = -0.508','z_p / R = 0.0','z_p / R = 0.508','z_p / R = 1.017','Prop off','NumColumns',2)
xlim([0.0 1.01])
ylim([12 30])
set(gca,Fontsize=14)

