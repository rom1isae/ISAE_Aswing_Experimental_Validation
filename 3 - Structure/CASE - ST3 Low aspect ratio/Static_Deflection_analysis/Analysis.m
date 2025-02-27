clear all; close all; clc




%% Lecture données expé 


CASE1.Z_F = readtable('../[0_3_90]_S/[03_90]_S_F_VS_Z.csv','HeaderLines',2);
CASE1.Z_F_NUM = readtable('../[0_3_90]_S/[03_90]_S_F_VS_Z_NUM.csv','HeaderLines',2);

CASE1.Z_F.Var1((length(CASE1.Z_F.Var1)+1)/2) = 0;
CASE1.Z_F.Var2((length(CASE1.Z_F.Var1)+1)/2) = 0;

CASE1.Z_M = readtable('../[0_3_90]_S/[03_90]_S_M_VS_Z.csv','HeaderLines',2);
CASE1.Z_M_NUM = readtable('../[0_3_90]_S/[03_90]_S_M_VS_Z_NUM.csv','HeaderLines',2);
CASE1.Z_M.Var1((length(CASE1.Z_M.Var1)+1)/2) = 0;
CASE1.Z_M.Var2((length(CASE1.Z_M.Var1)+1)/2) = 0;


CASE1.T_M = readtable('../[0_3_90]_S/[03_90]_S_M_VS_THETA.csv','HeaderLines',2);
CASE1.T_M_NUM = readtable('../[0_3_90]_S/[03_90]_S_M_VS_THETA_NUM.csv','HeaderLines',2);

CASE1.T_M.Var1((length(CASE1.T_M.Var1)+1)/2) = 0;
CASE1.T_M.Var2((length(CASE1.T_M.Var1)+1)/2) = 0;


CASE1.T_F = readtable('../[0_3_90]_S/[03_90]_S_F_VS_THETA.csv','HeaderLines',2);
CASE1.T_F_NUM = readtable('../[0_3_90]_S/[03_90]_S_F_VS_THETA_NUM.csv','HeaderLines',2);

CASE1.T_F.Var1((length(CASE1.T_F.Var1)+1)/2) = 0;
CASE1.T_F.Var2((length(CASE1.T_F.Var1)+1)/2) = 0;


CASE2.Z_F = readtable('../[+15_2_0_2]_S/[+15_2_0_2]_S_F_VS_Z.csv','HeaderLines',2);
CASE2.Z_F_NUM = readtable('../[+15_2_0_2]_S/[+15_2_0_2]_S_F_VS_Z_NUM.csv','HeaderLines',2);

CASE2.Z_F.Var1((length(CASE2.Z_F.Var1)+1)/2) = 0;
CASE2.Z_F.Var2((length(CASE2.Z_F.Var1)+1)/2) = 0;

CASE2.Z_M = readtable('../[+15_2_0_2]_S/[+15_2_0_2]_S_M_VS_Z.csv','HeaderLines',2);
CASE2.Z_M_NUM = readtable('../[+15_2_0_2]_S/[+15_2_0_2]_S_M_VS_Z_NUM.csv','HeaderLines',2);

CASE2.Z_M.Var1((length(CASE2.Z_M.Var1)+1)/2) = 0;
CASE2.Z_M.Var2((length(CASE2.Z_M.Var1)+1)/2) = 0;


CASE2.T_M = readtable('../[+15_2_0_2]_S/[+15_2_0_2]_S_M_VS_THETA.csv','HeaderLines',2);
CASE2.T_M_NUM = readtable('../[+15_2_0_2]_S/[+15_2_0_2]_S_M_VS_THETA_NUM.csv','HeaderLines',2);

CASE2.T_M.Var1((length(CASE2.T_M.Var1)+1)/2) = 0;
CASE2.T_M.Var2((length(CASE2.T_M.Var1)+1)/2) = 0;


CASE2.T_F = readtable('../[+15_2_0_2]_S/[+15_2_0_2]_S_F_VS_THETA.csv','HeaderLines',2);
CASE2.T_F.Var1((length(CASE2.T_F.Var1)+1)/2) = 0;
CASE2.T_F.Var2((length(CASE2.T_F.Var1)+1)/2) = 0;
CASE2.T_F_NUM = readtable('../[+15_2_0_2]_S/[+15_2_0_2]_S_F_VS_THETA_NUM.csv','HeaderLines',2);


CASE3.Z_F = readtable('../[-15_2_0_2]_S/[-15_2_0_2]_S_F_VS_Z.csv','HeaderLines',2);
CASE3.Z_F_NUM = readtable('../[-15_2_0_2]_S/[-15_2_0_2]_S_F_VS_Z_NUM.csv','HeaderLines',2);

CASE3.Z_F.Var1((length(CASE3.Z_F.Var1)+1)/2) = 0;
CASE3.Z_F.Var2((length(CASE3.Z_F.Var1)+1)/2) = 0;

CASE3.Z_M = readtable('../[-15_2_0_2]_S/[-15_2_0_2]_S_M_VS_Z.csv','HeaderLines',2);
CASE3.Z_M_NUM = readtable('../[-15_2_0_2]_S/[-15_2_0_2]_S_M_VS_Z_NUM.csv','HeaderLines',2);

CASE3.Z_M.Var1((length(CASE3.Z_M.Var1)+1)/2) = 0;
CASE3.Z_M.Var2((length(CASE3.Z_M.Var1)+1)/2) = 0;


CASE3.T_M = readtable('../[-15_2_0_2]_S/[-15_2_0_2]_S_M_VS_THETA.csv','HeaderLines',2);
CASE3.T_M_NUM = readtable('../[-15_2_0_2]_S/[-15_2_0_2]_S_M_VS_THETA_NUM.csv','HeaderLines',2);

CASE3.T_M.Var1((length(CASE3.T_M.Var1)+1)/2) = 0;
CASE3.T_M.Var2((length(CASE3.T_M.Var1)+1)/2) = 0;


CASE3.T_F = readtable('../[-15_2_0_2]_S/[-15_2_0_2]_S_F_VS_THETA.csv','HeaderLines',2);
CASE3.T_F_NUM = readtable('../[-15_2_0_2]_S/[-15_2_0_2]_S_F_VS_THETA_NUM.csv','HeaderLines',2);

CASE3.T_F.Var1((length(CASE3.T_F.Var1)+1)/2) = 0;
CASE3.T_F.Var2((length(CASE3.T_F.Var1)+1)/2) = 0;


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CASE I
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ASWING analysis
M = 0:0.1:0.5;
[CASE1.Force.Delta_z, CASE1.Force.Twist] = tip_forces_analysis1('[0_3_90].asw',M);
CASE1.Force.M = M;
M = CASE1.T_M.Var2
[CASE1.Moment.Delta_z, CASE1.Moment.Twist] = tip_moment_analysis1('[0_3_90].asw',M);
CASE1.moment.M = M;









%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CASE II
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M = 0:0.1:0.4;
[CASE2.Force.Delta_z, CASE2.Force.Twist] = tip_forces_analysis2('[p15_0].asw',M);
CASE2.Force.M = M;
M = -CASE2.T_M.Var2
[CASE2.Moment.Delta_z, CASE2.Moment.Twist] = tip_moment_analysis2('[p15_0].asw',M);
CASE2.moment.M = M;





%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CASE III
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%% ASWING analysis
M = 0:0.1:0.4;
[CASE3.Force.Delta_z, CASE3.Force.Twist] = tip_forces_analysis3('[m15_0].asw',M);
CASE3.Force.M = M;
M = -CASE3.T_M.Var2
[CASE3.Moment.Delta_z, CASE3.Moment.Twist] = tip_moment_analysis3('[m15_0].asw',M);
CASE3.moment.M = M;




%% ANALYSE

close all

figure(13) 
subplot(1,3,1)
errorbar(CASE1.Z_F.Var2((length(CASE1.Z_F.Var1)+1)/2:end),...
    0.5*(abs(CASE1.Z_F.Var1((length(CASE1.Z_F.Var1)+1)/2:end))+...
    abs(flip(CASE1.Z_F.Var1(1:(length(CASE1.Z_F.Var1)+1)/2)))),...
    min(abs(CASE1.Z_F.Var1((length(CASE1.Z_F.Var1)+1)/2:end))-0.5*(abs(CASE1.Z_F.Var1((length(CASE1.Z_F.Var1)+1)/2:end))+...
    abs(flip(CASE1.Z_F.Var1(1:(length(CASE1.Z_F.Var1)+1)/2)))),abs(flip(CASE1.Z_F.Var1(1:(length(CASE1.Z_F.Var1)+1)/2)))-0.5*(abs(CASE1.Z_F.Var1((length(CASE1.Z_F.Var1)+1)/2:end))+...
    abs(flip(CASE1.Z_F.Var1(1:(length(CASE1.Z_F.Var1)+1)/2))))),...
    max(abs(CASE1.Z_F.Var1((length(CASE1.Z_F.Var1)+1)/2:end)),abs(flip(CASE1.Z_F.Var1(1:(length(CASE1.Z_F.Var1)+1)/2))))-0.5*(abs(CASE1.Z_F.Var1((length(CASE1.Z_F.Var1)+1)/2:end))+...
    abs(flip(CASE1.Z_F.Var1(1:(length(CASE1.Z_F.Var1)+1)/2)))),'ok',MarkerSize=8,MarkerFaceColor='k')
subplot(1,3,2)
errorbar(CASE2.Z_F.Var2((length(CASE2.Z_F.Var1)+1)/2:end),...
    0.5*(abs(CASE2.Z_F.Var1((length(CASE2.Z_F.Var1)+1)/2:end))+...
    abs(flip(CASE2.Z_F.Var1(1:(length(CASE2.Z_F.Var1)+1)/2)))),...
    min(abs(CASE2.Z_F.Var1((length(CASE2.Z_F.Var1)+1)/2:end))-0.5*(abs(CASE2.Z_F.Var1((length(CASE2.Z_F.Var1)+1)/2:end))+...
    abs(flip(CASE2.Z_F.Var1(1:(length(CASE2.Z_F.Var1)+1)/2)))),abs(flip(CASE2.Z_F.Var1(1:(length(CASE2.Z_F.Var1)+1)/2)))-0.5*(abs(CASE2.Z_F.Var1((length(CASE2.Z_F.Var1)+1)/2:end))+...
    abs(flip(CASE2.Z_F.Var1(1:(length(CASE2.Z_F.Var1)+1)/2))))),...
    max(abs(CASE2.Z_F.Var1((length(CASE2.Z_F.Var1)+1)/2:end)),abs(flip(CASE2.Z_F.Var1(1:(length(CASE2.Z_F.Var1)+1)/2))))-0.5*(abs(CASE2.Z_F.Var1((length(CASE2.Z_F.Var1)+1)/2:end))+...
    abs(flip(CASE2.Z_F.Var1(1:(length(CASE2.Z_F.Var1)+1)/2)))),'ok',MarkerSize=8,MarkerFaceColor='k')
subplot(1,3,3)
errorbar(CASE3.Z_F.Var2((length(CASE3.Z_F.Var1)+1)/2:end),...
    0.5*(abs(CASE3.Z_F.Var1((length(CASE3.Z_F.Var1)+1)/2:end))+...
    abs(flip(CASE3.Z_F.Var1(1:(length(CASE3.Z_F.Var1)+1)/2)))),...
    min(abs(CASE3.Z_F.Var1((length(CASE3.Z_F.Var1)+1)/2:end))-0.5*(abs(CASE3.Z_F.Var1((length(CASE3.Z_F.Var1)+1)/2:end))+...
    abs(flip(CASE3.Z_F.Var1(1:(length(CASE3.Z_F.Var1)+1)/2)))),abs(flip(CASE3.Z_F.Var1(1:(length(CASE3.Z_F.Var1)+1)/2)))-0.5*(abs(CASE3.Z_F.Var1((length(CASE3.Z_F.Var1)+1)/2:end))+...
    abs(flip(CASE3.Z_F.Var1(1:(length(CASE3.Z_F.Var1)+1)/2))))),...
    max(abs(CASE3.Z_F.Var1((length(CASE3.Z_F.Var1)+1)/2:end)),abs(flip(CASE3.Z_F.Var1(1:(length(CASE3.Z_F.Var1)+1)/2))))-0.5*(abs(CASE3.Z_F.Var1((length(CASE3.Z_F.Var1)+1)/2:end))+...
    abs(flip(CASE3.Z_F.Var1(1:(length(CASE3.Z_F.Var1)+1)/2)))),'ok',MarkerSize=8,MarkerFaceColor='k')


% ASWING data: 

subplot(1,3,1)
hold on
plot(CASE1.Force.M*9.81,-CASE1.Force.Delta_z,'-rs',LineWidth=1.5,MarkerSize=8,MarkerFaceColor='r')
ylabel('Tip deflection |z| (in m)')
grid on
title('[0_3 / 90]_s')
xlim([0 5])
ylim([0 0.19])


subplot(1,3,2)
hold on
plot(CASE2.Force.M*9.81,-CASE2.Force.Delta_z,'-rs',LineWidth=1.5,MarkerSize=8,MarkerFaceColor='r')
xlabel('applied load |F| (in N)')
title('[+15_2 / 0_2]_s')
grid on
xlim([0 5])
ylim([0 0.19])

subplot(1,3,3)
hold on
plot(CASE3.Force.M*9.81,-CASE3.Force.Delta_z,'-rs',LineWidth=1.5,MarkerSize=8,MarkerFaceColor='r')
grid on


% Dunn's model

subplot(1,3,1)
hold on
plot(CASE1.Z_F_NUM.Var2,CASE1.Z_F_NUM.Var1,'--bd',LineWidth=1.5,MarkerSize=8)
ylabel('Tip deflection |z| (in m)')
grid on
title('[0_3 / 90]_s')
xlim([0 5])
ylim([0 0.19])


subplot(1,3,2)
hold on
plot(CASE2.Z_F_NUM.Var2,CASE2.Z_F_NUM.Var1,'--bd',LineWidth=1.5,MarkerSize=8)
xlabel('applied load |F| (in N)')
title('[+15_2 / 0_2]_s')
grid on
xlim([0 5])
ylim([0 0.19])

subplot(1,3,3)
hold on
plot(CASE3.Z_F_NUM.Var2,CASE3.Z_F_NUM.Var1,'--bd',LineWidth=1.5,MarkerSize=8)
grid on

title('[-15_2 / 0_2]_s')
legend("Dunn's experimental data","ASWING predictions", "Dunn's FEM model predictions",Location="southoutside")
xlim([0 5])
ylim([0 0.19])



figure(14) 
errorbar(CASE1.Z_M.Var2((length(CASE1.Z_M.Var1)+1)/2:end),...
    0.5*(abs(CASE1.Z_M.Var1((length(CASE1.Z_M.Var1)+1)/2:end))+...
    abs(flip(CASE1.Z_M.Var1(1:(length(CASE1.Z_M.Var1)+1)/2)))),...
    min(abs(CASE1.Z_M.Var1((length(CASE1.Z_M.Var1)+1)/2:end))-0.5*(abs(CASE1.Z_M.Var1((length(CASE1.Z_M.Var1)+1)/2:end))+...
    abs(flip(CASE1.Z_M.Var1(1:(length(CASE1.Z_M.Var1)+1)/2)))),abs(flip(CASE1.Z_M.Var1(1:(length(CASE1.Z_M.Var1)+1)/2)))-0.5*(abs(CASE1.Z_M.Var1((length(CASE1.Z_M.Var1)+1)/2:end))+...
    abs(flip(CASE1.Z_M.Var1(1:(length(CASE1.Z_M.Var1)+1)/2))))),...
    max(abs(CASE1.Z_M.Var1((length(CASE1.Z_M.Var1)+1)/2:end)),abs(flip(CASE1.Z_M.Var1(1:(length(CASE1.Z_M.Var1)+1)/2))))-0.5*(abs(CASE1.Z_M.Var1((length(CASE1.Z_M.Var1)+1)/2:end))+...
    abs(flip(CASE1.Z_M.Var1(1:(length(CASE1.Z_M.Var1)+1)/2)))),'ks',MarkerSize=8,MarkerFaceColor='k')
hold on
errorbar(CASE2.Z_M.Var2((length(CASE2.Z_M.Var1)+1)/2:end),...
    0.5*(abs(CASE2.Z_M.Var1((length(CASE2.Z_M.Var1)+1)/2:end))+...
    abs(flip(CASE2.Z_M.Var1(1:(length(CASE2.Z_M.Var1)+1)/2)))),...
    min(abs(CASE2.Z_M.Var1((length(CASE2.Z_M.Var1)+1)/2:end))-0.5*(abs(CASE2.Z_M.Var1((length(CASE2.Z_M.Var1)+1)/2:end))+...
    abs(flip(CASE2.Z_M.Var1(1:(length(CASE2.Z_M.Var1)+1)/2)))),abs(flip(CASE2.Z_M.Var1(1:(length(CASE2.Z_M.Var1)+1)/2)))-0.5*(abs(CASE2.Z_M.Var1((length(CASE2.Z_M.Var1)+1)/2:end))+...
    abs(flip(CASE2.Z_M.Var1(1:(length(CASE2.Z_M.Var1)+1)/2))))),...
    max(abs(CASE2.Z_M.Var1((length(CASE2.Z_M.Var1)+1)/2:end)),abs(flip(CASE2.Z_M.Var1(1:(length(CASE2.Z_M.Var1)+1)/2))))-0.5*(abs(CASE2.Z_M.Var1((length(CASE2.Z_M.Var1)+1)/2:end))+...
    abs(flip(CASE2.Z_M.Var1(1:(length(CASE2.Z_M.Var1)+1)/2)))),'kd',MarkerSize=8,MarkerFaceColor='k')
hold on
errorbar(CASE3.Z_M.Var2((length(CASE3.Z_M.Var1)+1)/2:end),...
    -0.5*(abs(CASE3.Z_M.Var1((length(CASE3.Z_M.Var1)+1)/2:end))+...
    abs(flip(CASE3.Z_M.Var1(1:(length(CASE3.Z_M.Var1)+1)/2)))),...
    min(abs(CASE3.Z_M.Var1((length(CASE3.Z_M.Var1)+1)/2:end))-0.5*(abs(CASE3.Z_M.Var1((length(CASE3.Z_M.Var1)+1)/2:end))+...
    abs(flip(CASE3.Z_M.Var1(1:(length(CASE3.Z_M.Var1)+1)/2)))),abs(flip(CASE3.Z_M.Var1(1:(length(CASE3.Z_M.Var1)+1)/2)))-0.5*(abs(CASE3.Z_M.Var1((length(CASE3.Z_M.Var1)+1)/2:end))+...
    abs(flip(CASE3.Z_M.Var1(1:(length(CASE3.Z_M.Var1)+1)/2))))),...
    max(abs(CASE3.Z_M.Var1((length(CASE3.Z_M.Var1)+1)/2:end)),abs(flip(CASE3.Z_M.Var1(1:(length(CASE3.Z_M.Var1)+1)/2))))-0.5*(abs(CASE3.Z_M.Var1((length(CASE3.Z_M.Var1)+1)/2:end))+...
    abs(flip(CASE3.Z_M.Var1(1:(length(CASE3.Z_M.Var1)+1)/2)))),'ko',MarkerSize=8,MarkerFaceColor='k')

% ASWING data: 

hold on
plot(CASE1.moment.M,-CASE1.Moment.Delta_z,'-sr',LineWidth=1.5,MarkerFaceColor='r',MarkerSize=8)

hold on
plot(CASE2.moment.M,CASE2.Moment.Delta_z,'--dr',LineWidth=1.5,MarkerFaceColor='r',MarkerSize=8)

hold on
plot(CASE3.moment.M,CASE3.Moment.Delta_z,'-.or',LineWidth=1.5,MarkerFaceColor='r',MarkerSize=8)

% Dunn's model
hold on
plot(CASE1.Z_M_NUM.Var2,CASE1.Z_M_NUM.Var1,'-b',LineWidth=1.5,MarkerSize=8)

hold on
plot(CASE2.Z_M_NUM.Var2,CASE2.Z_M_NUM.Var1,'-.b',LineWidth=1.5,MarkerSize=8)

hold on
plot(CASE3.Z_M_NUM.Var2,CASE3.Z_M_NUM.Var1,'--b',LineWidth=1.5,MarkerSize=8)
grid on
xlabel('applied Torque |M| (in Nm)')
ylabel('Tip deflection |z| (in m)')
ylim([-0.06 0.06])
xlim([0 0.55])
legend('[0_3/90]_s :Exp','[+15_2 / 0_2]_s : Exp','[-15_2 / 0_2]_S : Exp','ASWING','ASWING','ASWING','Dunn','Dunn','Dunn','NumColumns',3,location="southoutside")


figure(15) 
subplot(1,3,1)
errorbar(CASE1.T_M.Var2((length(CASE1.T_M.Var1)+1)/2:end),...
    0.5*(abs(CASE1.T_M.Var1((length(CASE1.T_M.Var1)+1)/2:end))+...
    abs(flip(CASE1.T_M.Var1(1:(length(CASE1.T_M.Var1)+1)/2)))),...
    min(abs(CASE1.T_M.Var1((length(CASE1.T_M.Var1)+1)/2:end))-0.5*(abs(CASE1.T_M.Var1((length(CASE1.T_M.Var1)+1)/2:end))+...
    abs(flip(CASE1.T_M.Var1(1:(length(CASE1.T_M.Var1)+1)/2)))),abs(flip(CASE1.T_M.Var1(1:(length(CASE1.T_M.Var1)+1)/2)))-0.5*(abs(CASE1.T_M.Var1((length(CASE1.T_M.Var1)+1)/2:end))+...
    abs(flip(CASE1.T_M.Var1(1:(length(CASE1.T_M.Var1)+1)/2))))),...
    max(abs(CASE1.T_M.Var1((length(CASE1.T_M.Var1)+1)/2:end)),abs(flip(CASE1.T_M.Var1(1:(length(CASE1.T_M.Var1)+1)/2))))-0.5*(abs(CASE1.T_M.Var1((length(CASE1.T_M.Var1)+1)/2:end))+...
    abs(flip(CASE1.T_M.Var1(1:(length(CASE1.T_M.Var1)+1)/2)))),'ko',MarkerSize=8,MarkerFaceColor='k')
subplot(1,3,2)
errorbar(CASE2.T_M.Var2((length(CASE2.T_M.Var1)+1)/2:end),...
    0.5*(abs(CASE2.T_M.Var1((length(CASE2.T_M.Var1)+1)/2:end))+...
    abs(flip(CASE2.T_M.Var1(1:(length(CASE2.T_M.Var1)+1)/2)))),...
    min(abs(CASE2.T_M.Var1((length(CASE2.T_M.Var1)+1)/2:end))-0.5*(abs(CASE2.T_M.Var1((length(CASE2.T_M.Var1)+1)/2:end))+...
    abs(flip(CASE2.T_M.Var1(1:(length(CASE2.T_M.Var1)+1)/2)))),abs(flip(CASE2.T_M.Var1(1:(length(CASE2.T_M.Var1)+1)/2)))-0.5*(abs(CASE2.T_M.Var1((length(CASE2.T_M.Var1)+1)/2:end))+...
    abs(flip(CASE2.T_M.Var1(1:(length(CASE2.T_M.Var1)+1)/2))))),...
    max(abs(CASE2.T_M.Var1((length(CASE2.T_M.Var1)+1)/2:end)),abs(flip(CASE2.T_M.Var1(1:(length(CASE2.T_M.Var1)+1)/2))))-0.5*(abs(CASE2.T_M.Var1((length(CASE2.T_M.Var1)+1)/2:end))+...
    abs(flip(CASE2.T_M.Var1(1:(length(CASE2.T_M.Var1)+1)/2)))),'ko',MarkerSize=8,MarkerFaceColor='k')
subplot(1,3,3)
errorbar(CASE3.T_M.Var2((length(CASE3.T_M.Var1)+1)/2:end),...
    0.5*(abs(CASE3.T_M.Var1((length(CASE3.T_M.Var1)+1)/2:end))+...
    abs(flip(CASE3.T_M.Var1(1:(length(CASE3.T_M.Var1)+1)/2)))),...
    min(abs(CASE3.T_M.Var1((length(CASE3.T_M.Var1)+1)/2:end))-0.5*(abs(CASE3.T_M.Var1((length(CASE3.T_M.Var1)+1)/2:end))+...
    abs(flip(CASE3.T_M.Var1(1:(length(CASE3.T_M.Var1)+1)/2)))),abs(flip(CASE3.T_M.Var1(1:(length(CASE3.T_M.Var1)+1)/2)))-0.5*(abs(CASE3.T_M.Var1((length(CASE3.T_M.Var1)+1)/2:end))+...
    abs(flip(CASE3.T_M.Var1(1:(length(CASE3.T_M.Var1)+1)/2))))),...
    max(abs(CASE3.T_M.Var1((length(CASE3.T_M.Var1)+1)/2:end)),abs(flip(CASE3.T_M.Var1(1:(length(CASE3.T_M.Var1)+1)/2))))-0.5*(abs(CASE3.T_M.Var1((length(CASE3.T_M.Var1)+1)/2:end))+...
    abs(flip(CASE3.T_M.Var1(1:(length(CASE3.T_M.Var1)+1)/2)))),'ko',MarkerSize=8,MarkerFaceColor='k')


% ASWING data: 
subplot(1,3,1)
hold on
plot(CASE1.moment.M,-CASE1.Moment.Twist,'-rs',LineWidth=1.5,MarkerFaceColor='r',MarkerSize=8)
grid on
title('[0_3 / 90]_S')
ylabel('Tip twist |\theta| (in deg)')
xlim([0 .6])
ylim([0 25])

subplot(1,3,2)
hold on
plot(CASE2.moment.M,-CASE2.Moment.Twist,'-rs',LineWidth=1.5,MarkerFaceColor='r',MarkerSize=8)
grid on
title('[+15_2 / 0_2]_S')
xlabel('applied Torque |M| (in Nm)')
xlim([0 0.6])
ylim([0 25])

subplot(1,3,3)
hold on
plot(CASE3.moment.M,-CASE3.Moment.Twist,'-sr',LineWidth=1.5,MarkerFaceColor='r',MarkerSize=8)
grid on
title('[-15_2 / 0_2]_S')
grid on

% Dunn's model 
subplot(1,3,1)
hold on
plot(CASE1.T_M_NUM.Var2,CASE1.T_M_NUM.Var1,'--bd',LineWidth=1.5,MarkerSize=8)
ylabel('Tip twist |\theta| (in deg)')
grid on
title('[0_3 / 90]_s')



subplot(1,3,2)
hold on
plot(CASE2.T_M_NUM.Var2,CASE2.T_M_NUM.Var1,'--bd',LineWidth=1.5,MarkerSize=8)
xlabel('applied Torque |M| (in Nm)')
title('[+15_2 / 0_2]_s')
grid on

subplot(1,3,3)
hold on
plot(CASE3.T_M_NUM.Var2,CASE3.T_M_NUM.Var1,'--bd',LineWidth=1.5,MarkerSize=8)
grid on

title('[-15_2 / 0_2]_s')
xlim([0 .6])
ylim([0 25])
figure(15) 

legend("Dunn's experimental data","ASWING predictions", "Dunn's FEM model predictions",Location="southoutside")






figure(16) 
errorbar(CASE1.T_F.Var2((length(CASE1.T_F.Var1)+1)/2:end),...
    0.5*(abs(CASE1.T_F.Var1((length(CASE1.T_F.Var1)+1)/2:end))+...
    abs(flip(CASE1.T_F.Var1(1:(length(CASE1.T_F.Var1)+1)/2)))),...
    min(abs(CASE1.T_F.Var1((length(CASE1.T_F.Var1)+1)/2:end))-0.5*(abs(CASE1.T_F.Var1((length(CASE1.T_F.Var1)+1)/2:end))+...
    abs(flip(CASE1.T_F.Var1(1:(length(CASE1.T_F.Var1)+1)/2)))),abs(flip(CASE1.T_F.Var1(1:(length(CASE1.T_F.Var1)+1)/2)))-0.5*(abs(CASE1.T_F.Var1((length(CASE1.T_F.Var1)+1)/2:end))+...
    abs(flip(CASE1.T_F.Var1(1:(length(CASE1.T_F.Var1)+1)/2))))),...
    max(abs(CASE1.T_F.Var1((length(CASE1.T_F.Var1)+1)/2:end)),abs(flip(CASE1.T_F.Var1(1:(length(CASE1.T_F.Var1)+1)/2))))-0.5*(abs(CASE1.T_F.Var1((length(CASE1.T_F.Var1)+1)/2:end))+...
    abs(flip(CASE1.T_F.Var1(1:(length(CASE1.T_F.Var1)+1)/2)))),'ks',MarkerSize=8,MarkerFaceColor='k')
hold on
errorbar(CASE2.T_F.Var2((length(CASE2.T_F.Var1)+1)/2:end),...
    0.5*(abs(CASE2.T_F.Var1((length(CASE2.T_F.Var1)+1)/2:end))+...
    abs(flip(CASE2.T_F.Var1(1:(length(CASE2.T_F.Var1)+1)/2)))),...
    min(abs(CASE2.T_F.Var1((length(CASE2.T_F.Var1)+1)/2:end))-0.5*(abs(CASE2.T_F.Var1((length(CASE2.T_F.Var1)+1)/2:end))+...
    abs(flip(CASE2.T_F.Var1(1:(length(CASE2.T_F.Var1)+1)/2)))),abs(flip(CASE2.T_F.Var1(1:(length(CASE2.T_F.Var1)+1)/2)))-0.5*(abs(CASE2.T_F.Var1((length(CASE2.T_F.Var1)+1)/2:end))+...
    abs(flip(CASE2.T_F.Var1(1:(length(CASE2.T_F.Var1)+1)/2))))),...
    max(abs(CASE2.T_F.Var1((length(CASE2.T_F.Var1)+1)/2:end)),abs(flip(CASE2.T_F.Var1(1:(length(CASE2.T_F.Var1)+1)/2))))-0.5*(abs(CASE2.T_F.Var1((length(CASE2.T_F.Var1)+1)/2:end))+...
    abs(flip(CASE2.T_F.Var1(1:(length(CASE2.T_F.Var1)+1)/2)))),'kd',MarkerSize=8,MarkerFaceColor='k')
hold on
errorbar(CASE3.T_F.Var2((length(CASE3.T_F.Var1)+1)/2:end),...
    -0.5*(abs(CASE3.T_F.Var1((length(CASE3.T_F.Var1)+1)/2:end))+...
    abs(flip(CASE3.T_F.Var1(1:(length(CASE3.T_F.Var1)+1)/2)))),...
    min(abs(CASE3.T_F.Var1((length(CASE3.T_F.Var1)+1)/2:end))-0.5*(abs(CASE3.T_F.Var1((length(CASE3.T_F.Var1)+1)/2:end))+...
    abs(flip(CASE3.T_F.Var1(1:(length(CASE3.T_F.Var1)+1)/2)))),abs(flip(CASE3.T_F.Var1(1:(length(CASE3.T_F.Var1)+1)/2)))-0.5*(abs(CASE3.T_F.Var1((length(CASE3.T_F.Var1)+1)/2:end))+...
    abs(flip(CASE3.T_F.Var1(1:(length(CASE3.T_F.Var1)+1)/2))))),...
    max(abs(CASE3.T_F.Var1((length(CASE3.T_F.Var1)+1)/2:end)),abs(flip(CASE3.T_F.Var1(1:(length(CASE3.T_F.Var1)+1)/2))))-0.5*(abs(CASE3.T_F.Var1((length(CASE3.T_F.Var1)+1)/2:end))+...
    abs(flip(CASE3.T_F.Var1(1:(length(CASE3.T_F.Var1)+1)/2)))),'ko',MarkerSize=8,MarkerFaceColor='k')


% ASWING data: 

hold on
plot(CASE1.Force.M*9.81,CASE1.Force.Twist,'-sr',LineWidth=1.5,MarkerFaceColor='r',MarkerSize=8)


hold on
plot(CASE2.Force.M*9.81,CASE2.Force.Twist,'--dr',LineWidth=1.5,MarkerFaceColor='r',MarkerSize=8)



hold on
plot(CASE3.Force.M*9.81,CASE3.Force.Twist,'-.or',LineWidth=1.5,MarkerFaceColor='r',MarkerSize=8)


% Dunn's model data: 

hold on
plot(CASE1.T_F_NUM.Var2,CASE1.T_F_NUM.Var1,'-b',LineWidth=1.5,MarkerSize=8)


hold on
plot(CASE2.T_F_NUM.Var2,CASE2.T_F_NUM.Var1,'-.b',LineWidth=1.5,MarkerSize=8)



hold on
plot(CASE3.T_F_NUM.Var2,CASE3.T_F_NUM.Var1,'--b',LineWidth=1.5,MarkerSize=8)

grid on
xlim([0 4])
xlabel('applied load |F| (in N)')
ylabel('Tip twist \theta (in \circ)')
ylim([-20 20])
legend('[0_3/90]_s :Exp','[+15_2 / 0_2]_s : Exp','[-15_2 / 0_2]_S : Exp','ASWING','ASWING','ASWING','Dunn','Dunn','Dunn','NumColumns',3,location="southoutside")
grid on

