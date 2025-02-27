clear all
close all


tic


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BENDING BENCH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DZ_exp = readtable("05_Experimental_Bending/static_bending_sweep_skin0_disp_exp.txt");
DZ_UMNAST = readtable("01_GFEM_Bending/static_bending_sweep_skin0_disp_GFEM.txt");
DZ_BEAM = readtable("03_Beam_Bending/static_bending_sweep_skin0_disp.txt");
%%
[B_DZ_ASW B_Twist_ASW] = tip_forces_analysis1('Pazy_wing_bending_bench.asw',DZ_exp.Var1);
%%


fig = figure(1);
left_color = [0 0 0];
right_color = [0 .5 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);

yyaxis left
plot(DZ_exp.Var1,-0.55*DZ_exp.Var2/100,'ks',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(DZ_UMNAST.Var1,-0.55*DZ_UMNAST.Var2/100,'-.b',MarkerFaceColor='b',MarkerSize=8,LineWidth=1.5)
hold on
% plot(DZ_BEAM.Var1,-0.55*DZ_BEAM.Var2/100,'-r',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
hold on 
plot(DZ_exp.Var1,-(B_DZ_ASW-B_DZ_ASW(1)),'-r',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
grid on
xlabel('tip load in kg')
ylabel('\Delta Z in m')
set(gca,"FontSize",14)
xlim([0 DZ_exp.Var1(end)])
ylim([0 -0.55*DZ_exp.Var2(end)/100])
yyaxis right
plot(DZ_exp.Var1,abs(100*((-(B_DZ_ASW-B_DZ_ASW(1)))-(-0.55*DZ_exp.Var2'/100))./(-0.55*DZ_exp.Var2'/100)),'d',MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0],MarkerSize=8,LineWidth=1.5)
ylabel('|\epsilon_{ASWING}| in %')
ylim([0 100])
legend('Exp','UM/NAST','ASWING',Location='northwest')
title('Bending bench : Skin off')

saveas(gcf,'Skin_Off_Bending_bench_DZ','epsc')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TORSION BENCH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T_DZ_exp = readtable("06_Experimental_Torsion/static_torsion_sweep_skin0_disp_exp.txt");
T_DZ_UMNAST = readtable("02_GFEM_Torsion/static_torsion_sweep_skin0_disp_GFEM.txt");
T_DZ_BEAM = readtable("04_Beam_Torsion/static_torsion_sweep_skin0_disp.txt");

T_Dtheta_exp = readtable("06_Experimental_Torsion/static_torsion_sweep_skin0_rot_exp.txt");
T_Dtheta_UMNAST = readtable("02_GFEM_Torsion/static_torsion_sweep_skin0_rot_GFEM.txt");
T_Dtheta_BEAM = readtable("04_Beam_Torsion/static_torsion_sweep_skin0_rot.txt");
%% ASWING simulation

[T_DZ_ASW T_Twist_ASW] = tip_forces_analysis2('Pazy_wing_torsion_bench.asw',T_DZ_exp.Var1);

%%
fig = figure(2);
left_color = [0 0 0];
right_color = [0 .5 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
yyaxis left
plot(T_DZ_exp.Var1,-0.55*T_DZ_exp.Var2/100,'ks',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(T_DZ_UMNAST.Var1,-0.55*T_DZ_UMNAST.Var2/100,'-.b',MarkerFaceColor='b',MarkerSize=8,LineWidth=1.5)
hold on
plot(T_DZ_exp.Var1,-(T_DZ_ASW-T_DZ_ASW(1)),'-r',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
grid on
xlabel('tip load in kg')
ylabel('\Delta Z in m')
legend('Exp','UM/NAST','ASWING',Location='northwest')

set(gca,"FontSize",14)
xlim([0 T_DZ_exp.Var1(end)])
ylim([0 -0.55*T_DZ_exp.Var2(end)/100])
yyaxis right
plot(T_DZ_exp.Var1,abs(100*((-(T_DZ_ASW-T_DZ_ASW(1)))-(-0.55*T_DZ_exp.Var2'/100))./(-0.55*T_DZ_exp.Var2'/100)),'d',MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0],MarkerSize=8,LineWidth=1.5)
ylabel('|\epsilon_{ASWING}| in %')
ylim([0 100])
legend('Exp','UM/NAST','ASWING')
title('Torsion bench : Skin off')
saveas(gcf,'Skin_Off_Torsion_bench_DZ','epsc')


fig = figure(3);
left_color = [0 0 0];
right_color = [0 .5 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
yyaxis left
plot(T_Dtheta_exp.Var1,T_Dtheta_exp.Var2,'ks',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(T_Dtheta_UMNAST.Var1,T_Dtheta_UMNAST.Var2,'-.b',MarkerFaceColor='b',MarkerSize=8,LineWidth=1.5)
hold on
% plot(T_Dtheta_BEAM.Var1,T_Dtheta_BEAM.Var2,'--r',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
hold on 
plot(T_DZ_exp.Var1,-(T_Twist_ASW),'-r',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
grid on
xlabel('tip load in kg')
ylabel('\Delta \theta in degree')
legend('Exp','UM/NAST','ASWING')
set(gca,"FontSize",14)
xlim([0 T_Dtheta_exp.Var1(end)])
% ylim([0 T_Dtheta_exp.Var2(end)])
yyaxis right
plot(T_DZ_exp.Var1,abs(100*((-(T_Twist_ASW))-(T_Dtheta_exp.Var2'))./(T_Dtheta_exp.Var2')),'d',MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0],MarkerSize=8,LineWidth=1.5)
ylabel('|\epsilon_{ASWING}| in %')
ylim([0 100])
legend('Exp','UM/NAST','ASWING',Location='northwest')
title('Torsion bench : Skin off')
saveas(gcf,'Skin_Off_Torsion_bench_theta','epsc')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SKIN ON
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BENDING BENCH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DZ_exp = readtable("05_Experimental_Bending/static_bending_sweep_skin1_disp_exp.txt");
DZ_UMNAST = readtable("01_GFEM_Bending/static_bending_sweep_skin0_disp_GFEM.txt");
DZ_BEAM = readtable("03_Beam_Bending/static_bending_sweep_skin1_disp.txt");
%%
[B_DZ_ASW B_Twist_ASW] = tip_forces_analysis1('Pazy_wing_bending_bench.asw',DZ_exp.Var1);
%%


fig = figure(4);
left_color = [0 0 0];
right_color = [0 .5 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);

yyaxis left
plot(DZ_exp.Var1,-0.55*DZ_exp.Var2/100,'ks',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(DZ_UMNAST.Var1,-0.55*DZ_UMNAST.Var2/100,'-.b',MarkerFaceColor='b',MarkerSize=8,LineWidth=1.5)
hold on
% plot(DZ_BEAM.Var1,-0.55*DZ_BEAM.Var2/100,'-r',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
hold on 
plot(DZ_exp.Var1,-(B_DZ_ASW-B_DZ_ASW(1)),'-r',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
grid on
xlabel('tip load in kg')
ylabel('\Delta Z in m')
set(gca,"FontSize",14)
xlim([0 DZ_exp.Var1(end)])
ylim([0 -0.55*DZ_exp.Var2(end)/100])
yyaxis right
plot(DZ_exp.Var1,abs(100*((-(B_DZ_ASW-B_DZ_ASW(1)))-(-0.55*DZ_exp.Var2'/100))./(-0.55*DZ_exp.Var2'/100)),'d',MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0],MarkerSize=8,LineWidth=1.5)
ylabel('|\epsilon_{ASWING}| in %')
ylim([0 100])
legend('Exp','UM/NAST','ASWING',Location='northwest')
title('Bending bench : Skin on')
saveas(gcf,'Skin_On_Bending_bench_DZ','epsc')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TORSION BENCH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T_DZ_exp = readtable("06_Experimental_Torsion/static_torsion_sweep_skin1_disp_exp.txt");
T_DZ_UMNAST = readtable("02_GFEM_Torsion/static_torsion_sweep_skin0_disp_GFEM.txt");
T_DZ_BEAM = readtable("04_Beam_Torsion/static_torsion_sweep_skin1_disp.txt");

T_Dtheta_exp = readtable("06_Experimental_Torsion/static_torsion_sweep_skin1_rot_exp.txt");
T_Dtheta_UMNAST = readtable("02_GFEM_Torsion/static_torsion_sweep_skin0_rot_GFEM.txt");
T_Dtheta_BEAM = readtable("04_Beam_Torsion/static_torsion_sweep_skin1_rot.txt");
%% ASWING simulation

[T_DZ_ASW T_Twist_ASW] = tip_forces_analysis3('Pazy_wing_torsion_bench.asw',T_DZ_exp.Var1);

%%
fig = figure(5)
left_color = [0 0 0];
right_color = [0 .5 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
yyaxis left
plot(T_DZ_exp.Var1,-0.55*T_DZ_exp.Var2/100,'ks',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(T_DZ_UMNAST.Var1,-0.55*T_DZ_UMNAST.Var2/100,'-.b',MarkerFaceColor='b',MarkerSize=8,LineWidth=1.5)
hold on
plot(T_DZ_exp.Var1,-(T_DZ_ASW-T_DZ_ASW(1)),'-r',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
grid on
xlabel('tip load in kg')
ylabel('\Delta Z in m')
legend('Exp','UM/NAST','ASWING',Location='northwest')

set(gca,"FontSize",14)
xlim([0 T_DZ_exp.Var1(end)])
ylim([0 -0.55*T_DZ_exp.Var2(end)/100])
yyaxis right
plot(T_DZ_exp.Var1,abs(100*((-(T_DZ_ASW-T_DZ_ASW(1)))-(-0.55*T_DZ_exp.Var2'/100))./(-0.55*T_DZ_exp.Var2'/100)),'d',MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0],MarkerSize=8,LineWidth=1.5)
ylabel('|\epsilon_{ASWING}| in %')
ylim([0 100])
legend('Exp','UM/NAST','ASWING')
title('Torsion bench : Skin on')
saveas(gcf,'Skin_On_Torsion_bench_DZ','epsc')

fig = figure(6);
left_color = [0 0 0];
right_color = [0 .5 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
yyaxis left
plot(T_Dtheta_exp.Var1,T_Dtheta_exp.Var2,'ks',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(T_Dtheta_UMNAST.Var1,T_Dtheta_UMNAST.Var2,'-.b',MarkerFaceColor='b',MarkerSize=8,LineWidth=1.5)
hold on
% plot(T_Dtheta_BEAM.Var1,T_Dtheta_BEAM.Var2,'--r',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
hold on 
plot(T_DZ_exp.Var1,-(T_Twist_ASW),'-r',MarkerFaceColor='r',MarkerSize=8,LineWidth=1.5)
grid on
xlabel('tip load in kg')
ylabel('\Delta \theta in degree')
legend('Exp','UM/NAST','ASWING')
set(gca,"FontSize",14)
xlim([0 T_Dtheta_exp.Var1(end)])
% ylim([0 T_Dtheta_exp.Var2(end)])
yyaxis right
plot(T_DZ_exp.Var1,abs(100*((-(T_Twist_ASW))-(T_Dtheta_exp.Var2'))./(T_Dtheta_exp.Var2')),'d',MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0],MarkerSize=8,LineWidth=1.5)
ylabel('|\epsilon_{ASWING}| in %')
ylim([0 100])
legend('Exp','UM/NAST','ASWING',Location='northwest')
title('Torsion bench : Skin on')
saveas(gcf,'Skin_On_Torsion_bench_theta','epsc')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DISPLAY TIME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T = toc
message = sprintf('This script took %f seconds to run (including the ASWING simulation)',T);
disp(message)
