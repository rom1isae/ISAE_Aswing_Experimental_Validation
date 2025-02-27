clear all; close all; clc


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CASE I: [0_3_90]_S
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CASE1.VF = readtable('../[0_3_90]_S/[03_90]_S_Vf_alpha.csv','HeaderLines',2);
CASE1.FF = readtable('../[0_3_90]_S/[03_90]_S_ff_alpha.csv','HeaderLines',2);

Dunn_CASE1_VF = readtable('[90_0]_S_VF_VS_ALPHA_DUNN.csv','HeaderLines',2);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CASE II: [-15_2_0_2]_s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CASE2.VF = readtable('../[-15_2_0_2]_S/[-15_2_0_2]_S_Vf_alpha.csv','HeaderLines',2);
CASE2.FF = readtable('../[-15_2_0_2]_S/[-15_2_0_2]_S_ff_alpha.csv','HeaderLines',2);

Dunn_CASE2_VF = readtable('[m15_0]_S_VF_VS_ALPHA_DUNN.csv','HeaderLines',2);
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CASE III : [+15_2_0_2]_s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ASWING data: 
alpha_0_90 = [0 2.0 4.0 6.0 8.0 10 15];
V_O_90 = [29.25 29.1 28.75 28.6 28.5 27.0 25.5];
f_0_90 = [14.74 14.67 14.65 14.3116 14.4 13.9 13.5];
alpha_p_15 = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 ];
V_p_15  = [29.0 28.8 28.5 28.5 28.0 27.9 27.75 27.5 27.0 26.5 26.2  26.0 25.9 25.1 25.0];
f_p_15  = [14.1 14.2 14.5 14.2 14.1 14.0 14.0 14.0 13.9 14.0 13.9 13.8 13.7 13.5 13.0];
alpha_m_15 = [0 2.0];
V_m_15  = [19 16.75];


CASE3.VF = readtable('../[+15_2_0_2]_S/[+15_2_0_2]_S_Vf_alpha.csv','HeaderLines',2);
CASE3.FF = readtable('../[+15_2_0_2]_S/[+15_2_0_2]_S_ff_alpha.csv','HeaderLines',2);

Dunn_CASE3_VF = readtable('[p15_0]_S_VF_VS_ALPHA_DUNN.csv','HeaderLines',2);

fig = figure(1);
left_color = [0 0 0];
right_color = [0 .5 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
yyaxis left
plot(CASE1.VF.Var1,CASE1.VF.Var2,'ks','linewidth',1.0,'MarkerFaceColor','k',MarkerSize=10);





hold on 
plot(alpha_p_15,V_p_15,'-rs','linewidth',1.0,MarkerSize=8,linewidth=1.5);
hold on
xlim([0 15])
ylim([0 30])
xlabel('angle of attack in degree')
ylabel('Flutter speed in m/s')


yyaxis right
plot(alpha_p_15,abs(100*(V_p_15'-CASE3.VF.Var2(1:15))'./CASE3.VF.Var2(1:15)'),'d','linewidth',1.0,MarkerSize=8,MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0]);
ylabel('|\epsilon_{ASW}|')
ylim([0 100])
set(gca,"FontSize",14)
legend('Experiments','ASWING','location','west')

grid on
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = [0 0.5 0];
saveas(gcf,"[p15_0]_flutter_boundary_speed",'epsc')



fig =figure(2)
left_color = [0 0 0];
right_color = [0 .5 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
yyaxis left
hold on
plot(CASE3.FF.Var1,CASE3.FF.Var2,'ko','MarkerFaceColor','k',MarkerSize=8)
hold on
% ASWING data:
hold on 
plot(alpha_p_15,f_p_15,'-rs','linewidth',1.5,MarkerSize=8);
xlim([0 15])
ylim([0 30])
xlabel('angle of attack \alpha in \circ')
ylabel('frequency in Hz')
grid on
legend('Experiments','ASWING','location','west')

yyaxis right
plot(alpha_p_15,abs(100*(f_p_15'-CASE3.FF.Var2(1:15))'./CASE3.FF.Var2(1:15)'),'d','linewidth',1.0,MarkerSize=8,MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0]);
ylabel('|\epsilon_{ASW}|')
ylim([0 100])
set(gca,"FontSize",14)
legend('Experiments','ASWING','location','northwest')
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = [0 0.5 0];

saveas(gcf,"[p15_0]_flutter_boundary_freq",'epsc')



