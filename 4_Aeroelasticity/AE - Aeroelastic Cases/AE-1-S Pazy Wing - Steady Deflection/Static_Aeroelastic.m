clear all
close all
clc

tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ALPHA = 5.0 deg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
% Aswing simulation : 
system('sh ./alpha5.sh');

%%

DZ_exp = readtable("03_Experimental/static_aeroelastic_sweep_aoa5_skin1_disp_exp.txt");
DZ_twist = readtable("03_Experimental/static_aeroelastic_sweep_aoa5_skin1_rot_exp.txt");
DZ_UM_NAST = readtable("02_Beam/static_aeroelastic_sweep_aoa5_skin1_disp_UVLM.txt")
Twist_UM_NAST = readtable("02_Beam/static_aeroelastic_sweep_aoa5_skin1_rot_UVLM.txt")
ASWING_data = readtable("aswing_alpha_05.txt",NumHeaderLines=3);
ASWING_DZ = ASWING_data.Var7-ASWING_data.Var7(1);
ASWING_theta1 = ASWING_data.Var8;
ASWING_theta2 = 180*atan((ASWING_data.Var4-ASWING_data.Var6)/((ASWING_data.Var3-ASWING_data.Var5)))/pi;
fig = figure(1);
left_color = [0 0 0];
right_color = [0 .5 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
yyaxis left
plot(DZ_exp.Var1,0.55*DZ_exp.Var2/100,'ks',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(DZ_exp.Var1,ASWING_DZ,'-r',LineWidth=1.5)
hold on
plot(DZ_UM_NAST.Var1,0.55*DZ_UM_NAST.Var2/100,'-.b',LineWidth=1.5)
xlim([0 56])
xlabel('V in m/s')
ylabel('\Delta Z in m')
grid on
yyaxis right
epsilon = abs(100*(ASWING_DZ'-0.55*DZ_exp.Var2'/100)./(0.55*DZ_exp.Var2'/100));

plot(DZ_exp.Var1(30:end),epsilon(30:end),'d',MarkerEdgeColor=[0 0.5 0],MarkerFaceColor=[0 0.5 0])
ylim([0 100])
ylabel('\epsilon_ASWING in %)')
legend('Exp','ASWING','UM/NAST',Location='northwest')
ax = gca
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = [0 0.5 0];

set(gca,"FontSize",14)

saveas(gcf,'alpha5_DZ','epsc')


fig = figure(2);
left_color = [0 0 0];
right_color = [0 .5 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);

yyaxis left
plot(DZ_twist.Var1,DZ_twist.Var2,'ks',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(DZ_twist.Var1,ASWING_theta1,'-r',LineWidth=1.5)
hold on
plot(Twist_UM_NAST.Var1,Twist_UM_NAST.Var2,'-.b',LineWidth=1.5)
xlim([0 56])

xlabel('V in m/s')
ylabel('\theta in degrees')
grid on
yyaxis right
epsilon = abs(100*(ASWING_theta1'-DZ_twist.Var2')./(DZ_twist.Var2'));
plot(DZ_exp.Var1(1:end),epsilon(1:end),'d',MarkerEdgeColor=[0 0.5 0],MarkerFaceColor=[0 0.5 0])
ylim([0 100])
ylabel('\epsilon_ASWING in %)')
legend('Exp','ASWING','UM/NAST',Location='northwest')
ax = gca
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = [0 0.5 0];

set(gca,"FontSize",14)

saveas(gcf,'alpha5_twist','epsc')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ALPHA = 7.0 deg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
% Aswing simulation : 
system('sh ./alpha7.sh');

%%
DZ_exp = readtable("03_Experimental/static_aeroelastic_sweep_aoa7_skin1_disp_exp.txt");
DZ_twist = readtable("03_Experimental/static_aeroelastic_sweep_aoa7_skin1_rot_exp.txt");
DZ_UM_NAST = readtable("02_Beam/static_aeroelastic_sweep_aoa7_skin1_disp_UVLM.txt")
Twist_UM_NAST = readtable("02_Beam/static_aeroelastic_sweep_aoa7_skin1_rot_UVLM.txt")

ASWING_data = readtable("aswing_alpha_07.txt",NumHeaderLines=3);
ASWING_DZ = ASWING_data.Var7-ASWING_data.Var7(1);
ASWING_theta1 = ASWING_data.Var8;
ASWING_theta2 = 180*atan((ASWING_data.Var4-ASWING_data.Var6)/((ASWING_data.Var3-ASWING_data.Var5)))/pi;
fig = figure(3);
left_color = [0 0 0];
right_color = [0 .5 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
yyaxis left
plot(DZ_exp.Var1,0.55*DZ_exp.Var2/100,'ks',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(DZ_exp.Var1,ASWING_DZ,'-r',LineWidth=1.5)
hold on
plot(DZ_UM_NAST.Var1,0.55*DZ_UM_NAST.Var2/100,'-.b',LineWidth=1.5)
xlim([0 40])

xlabel('V in m/s')
ylabel('\Delta Z in m')
grid on
yyaxis right
epsilon = abs(100*(ASWING_DZ'-0.55*DZ_exp.Var2'/100)./(0.55*DZ_exp.Var2'/100));
plot(DZ_exp.Var1(20:end),epsilon(20:end),'d',MarkerEdgeColor=[0 0.5 0],MarkerFaceColor=[0 0.5 0])
ylim([0 100])
ylabel('\epsilon_ASWING in %)')
legend('Exp','ASWING','UM/NAST',Location='northwest')
ax = gca
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = [0 0.5 0];

set(gca,"FontSize",14)

saveas(gcf,'alpha7_DZ','epsc')


fig = figure(4);
left_color = [0 0 0];
right_color = [0 .5 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);

yyaxis left
plot(DZ_twist.Var1,DZ_twist.Var2,'ks',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(DZ_twist.Var1,ASWING_theta1,'-r',LineWidth=1.5)
hold on
plot(Twist_UM_NAST.Var1,Twist_UM_NAST.Var2,'-.b',LineWidth=1.5)
xlim([0 40])
xlabel('V in m/s')
ylabel('\theta in degrees')
grid on
yyaxis right
epsilon = abs(100*(ASWING_theta1'-DZ_twist.Var2')./(DZ_twist.Var2'));
plot(DZ_exp.Var1(20:end),epsilon(20:end),'d',MarkerEdgeColor=[0 0.5 0],MarkerFaceColor=[0 0.5 0])
ylim([0 100])
ylabel('\epsilon_ASWING in %)')
legend('Exp','ASWING','UM/NAST',Location='northwest')
ax = gca
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = [0 0.5 0];

set(gca,"FontSize",14)

saveas(gcf,'alpha7_twist','epsc')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NACA 0018 : XFOIL Analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


xfoil_data = readtable("xf-naca0018-il-200000-n5.txt",NumHeaderLines=12)
alpha = xfoil_data.Var1;
cl = xfoil_data.Var2;
alpha_lin = alpha(alpha>=-7.5&alpha<=7.5);
cl_lin = cl(alpha>=-7.5&alpha<=7.5);

P = polyfit(alpha_lin,cl_lin,1);
clalpha = P(1)*180/pi

T = toc
message = sprintf('This script took %f seconds to run (including the ASWING simulation)',T);
disp(message)