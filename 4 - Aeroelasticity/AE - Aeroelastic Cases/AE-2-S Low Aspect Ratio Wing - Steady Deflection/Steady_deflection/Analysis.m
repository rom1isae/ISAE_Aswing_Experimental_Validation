clear all
close all
clc

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CASE I : [0_3_90]_S
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CASE1.Z_ALPHA_V = readtable('../[0_3_90]_S/[03_90]_Z_ALPHA_V.csv','HeaderLines',2);
CASE1.Z_ALPHA_V.Var2(1) = 0.0;
CASE1.Z_ALPHA_V.Var4(1) = 0.0;
CASE1.Z_ALPHA_V.Var6(1) = 0.0;
CASE1.Z_ALPHA_V.Var8(1) = 0.0;
CASE1.Z_ALPHA_V.Var10(1) = 0.0;
CASE1.Z_ALPHA_V.Var12(1) = 0.0;
CASE1.Z_ALPHA_V.Var14(1) = 0.0;
CASE1.Z_ALPHA_V.Var16(1) = 0.0;
CASE1.T_ALPHA_V = readtable('../[0_3_90]_S/[03_90]_T_ALPHA_V.csv','HeaderLines',2);



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CASE II : [+15_2_0_2]_s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CASE2.Z_ALPHA_V = readtable('../[+15_2_0_2]_S/[+15_2_0_2]_Z_ALPHA_V.csv','HeaderLines',2);
CASE2.Z_ALPHA_V.Var2(1) = 0.0;
CASE2.Z_ALPHA_V.Var4(1) = 0.0;
CASE2.Z_ALPHA_V.Var6(1) = 0.0;
CASE2.Z_ALPHA_V.Var8(1) = 0.0;
CASE2.Z_ALPHA_V.Var10(1) = 0.0;
CASE2.Z_ALPHA_V.Var12(1) = 0.0;
CASE2.Z_ALPHA_V.Var14(1) = 0.0;
CASE2.Z_ALPHA_V.Var16(1) = 0.0;

CASE2.T_ALPHA_V = readtable('../[+15_2_0_2]_S/[+15_2_0_2]_T_ALPHA_V.csv','HeaderLines',2);


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CASE III : [+15_2_0_2]_s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CASE3.Z_ALPHA_V = readtable('../[-15_2_0_2]_S/[-15_2_0_2]_Z_ALPHA_V.csv','HeaderLines',2);
CASE3.Z_ALPHA_V.Var2(1) = 0.0;
CASE3.Z_ALPHA_V.Var4(1) = 0.0;
CASE3.Z_ALPHA_V.Var6(1) = 0.0;
CASE3.Z_ALPHA_V.Var8(1) = 0.0;
CASE3.Z_ALPHA_V.Var10(1) = 0.0;
CASE3.Z_ALPHA_V.Var12(1) = 0.0;
CASE3.Z_ALPHA_V.Var14(1) = 0.0;
CASE3.Z_ALPHA_V.Var16(1) = 0.0;

CASE3.T_ALPHA_V = readtable('../[-15_2_0_2]_S/[-15_2_0_2]_T_ALPHA_V.csv','HeaderLines',2);

%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ANALYSIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% CASE I : [0_3_90]_S
% system('sh ./\[0_90\]_3s_A1.sh')
% system('sh ./\[0_90\]_3s_A5.sh')
% system('sh ./\[0_90\]_3s_A10.sh')
% system('sh ./\[0_90\]_3s_A15.sh')




figure(1)
hold on

% alpha = 1
errorbar(CASE1.Z_ALPHA_V.Var1,0.5*(CASE1.Z_ALPHA_V.Var2+CASE1.Z_ALPHA_V.Var4),0.5*(abs(CASE1.Z_ALPHA_V.Var2-CASE1.Z_ALPHA_V.Var4)),'ok','linewidth',1.0,MarkerSize=8,MarkerFaceColor='k')

hold on
% alpha = 5
rand_f = (1+0.1*(1-2*rand(length(CASE1.Z_ALPHA_V.Var6),1)));
errorbar(CASE1.Z_ALPHA_V.Var5,0.5*(CASE1.Z_ALPHA_V.Var6+CASE1.Z_ALPHA_V.Var8),0.5*(abs(CASE1.Z_ALPHA_V.Var6-CASE1.Z_ALPHA_V.Var8)),'sk','linewidth',1.0,MarkerSize=8,MarkerFaceColor='k')

% alpha = 10

errorbar(CASE1.Z_ALPHA_V.Var9,0.5*(CASE1.Z_ALPHA_V.Var10+CASE1.Z_ALPHA_V.Var12),0.5*(abs(CASE1.Z_ALPHA_V.Var10-CASE1.Z_ALPHA_V.Var12)),'dk','linewidth',1.0,MarkerSize=8,MarkerFaceColor='k')

% alpha = 15
errorbar(CASE1.Z_ALPHA_V.Var13,0.5*(CASE1.Z_ALPHA_V.Var14+CASE1.Z_ALPHA_V.Var16),0.5*(abs(CASE1.Z_ALPHA_V.Var14-CASE1.Z_ALPHA_V.Var16)),'^k','linewidth',1.0,MarkerSize=8,MarkerFaceColor='k')

% ASWING DATA:
% alpha = 1

CASE1_ASW_A1 = readtable('[03_90]_A1.txt',NumHeaderLines=3)
CASE1_ASW_A5 = readtable('[03_90]_A5.txt',NumHeaderLines=3)
CASE1_ASW_A10 = readtable('[03_90]_A10.txt',NumHeaderLines=3)
CASE1_ASW_A15 = readtable('[03_90]_A15.txt',NumHeaderLines=3)
hold on
rand_f = (1+0.1*(1-2*rand(length(CASE1.Z_ALPHA_V.Var2),1)));
plot(CASE1_ASW_A1.Var5,-CASE1_ASW_A1.Var3,'-r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 5
rand_f = (1+0.1*(1-2*rand(length(CASE1.Z_ALPHA_V.Var6),1)));
hold on
plot(CASE1_ASW_A5.Var5,-CASE1_ASW_A5.Var3,'--r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 10
rand_f = (1+0.1*(1-2*rand(length(CASE1.Z_ALPHA_V.Var10),1)));
hold on
plot(CASE1_ASW_A10.Var5,-CASE1_ASW_A10.Var3,':r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 15
rand_f = (1+0.1*(1-2*rand(length(CASE1.Z_ALPHA_V.Var14),1)));
hold on
plot(CASE1_ASW_A15.Var5,-CASE1_ASW_A15.Var3,'-.r','linewidth',1.5,MarkerFaceColor='r')
ylim([0 0.3])

grid on
xlabel('V in m/s')
ylabel('\Delta z_{tip} in m')
set(gca,"FontSize",14)
legend('Exp : \alpha = 1 \circ','Exp : \alpha = 5 \circ','Exp : \alpha = 10 \circ','Exp : \alpha = 15 \circ','ASW : \alpha = 1 \circ','ASW : \alpha = 5 \circ','ASW : \alpha = 10 \circ','ASW : \alpha = 15 \circ',Location='northwest')
xlim([0 30])
ylim([0 0.30])
saveas(gcf,"[0_3_90]S_Z_V",'epsc')




figure(2)
hold on
% alpha = 1
errorbar(CASE1.T_ALPHA_V.Var1,0.5*(CASE1.T_ALPHA_V.Var2+CASE1.T_ALPHA_V.Var4),0.5*(abs(CASE1.T_ALPHA_V.Var2-CASE1.T_ALPHA_V.Var4)),'ok',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 5
errorbar(CASE1.T_ALPHA_V.Var5,0.5*(CASE1.T_ALPHA_V.Var6+CASE1.T_ALPHA_V.Var8),0.5*(abs(CASE1.T_ALPHA_V.Var6-CASE1.T_ALPHA_V.Var8)),'sk',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 10
errorbar(CASE1.T_ALPHA_V.Var9,0.5*(CASE1.T_ALPHA_V.Var10+CASE1.T_ALPHA_V.Var12),0.5*(abs(CASE1.T_ALPHA_V.Var10-CASE1.T_ALPHA_V.Var12)),'dk',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 15
errorbar(CASE1.T_ALPHA_V.Var13,0.5*(CASE1.T_ALPHA_V.Var14+CASE1.T_ALPHA_V.Var16),0.5*(abs(CASE1.T_ALPHA_V.Var14-CASE1.T_ALPHA_V.Var16)),'^k',MarkerSize=8,MarkerFaceColor='k')
hold on
% ASWING data:


% system('sh ./\[m15_02]_s_A1.sh')
% system('sh ./\[m15_02]_s_A5.sh')
% system('sh ./\[m15_02]_s_A10.sh')
% system('sh ./\[m15_02]_s_A15.sh')
% ASWING DATA:
% alpha = 1
hold on
rand_f = (1+0.1*(1-2*rand(length(CASE1.T_ALPHA_V.Var2),1)));
plot(CASE1_ASW_A1.Var5,1-CASE1_ASW_A1.Var4,'-r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 5
rand_f = (1+0.1*(1-2*rand(length(CASE1.T_ALPHA_V.Var6),1)));
hold on
plot(CASE1_ASW_A5.Var5,5-CASE1_ASW_A5.Var4,'--r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 10
rand_f = (1+0.1*(1-2*rand(length(CASE1.T_ALPHA_V.Var10),1)));
hold on
plot(CASE1_ASW_A10.Var5,10-CASE1_ASW_A10.Var4,':r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 15
rand_f = (1+0.1*(1-2*rand(length(CASE1.T_ALPHA_V.Var14),1)));
hold on
plot(CASE1_ASW_A15.Var5,15-CASE1_ASW_A15.Var4,'-.r','linewidth',1.5,MarkerFaceColor='r')


grid on
xlabel('V in m/s')
ylabel('\Delta \theta in ^\circ')
set(gca,"FontSize",14)
% legend('Exp : \alpha = 1 \circ','Exp : \alpha = 5 \circ','Exp : \alpha = 10 \circ','Exp : \alpha = 15 \circ','ASWING : \alpha = 1 \circ','ASWING : \alpha = 5 \circ','ASWING : \alpha = 10 \circ','ASWING : \alpha = 15 \circ','NumColumns',2)

ylim([0 30])
xlim([0 30])
saveas(gcf,"[0_3_90]S_T_V",'epsc')
%% CASE II : [+15_2_0_2]_s

% system('sh ./\[p15_02]_s_A1.sh')
% system('sh ./\[p15_02]_s_A5.sh')
% system('sh ./\[p15_02]_s_A10.sh')
% system('sh ./\[p15_02]_s_A15.sh')



%%
CASE2_ASW_A1 = readtable('[p15_02]_S_A1.txt',NumHeaderLines=3)
CASE2_ASW_A5 = readtable('[p15_02]_S_A5.txt',NumHeaderLines=3)
CASE2_ASW_A10 = readtable('[p15_02]_S_A10.txt',NumHeaderLines=3)
CASE2_ASW_A15 = readtable('[p15_02]_S_A15.txt',NumHeaderLines=3)


figure(3)
hold on
% alpha = 1
errorbar(CASE2.Z_ALPHA_V.Var1,0.5*(CASE2.Z_ALPHA_V.Var2+CASE2.Z_ALPHA_V.Var4),0.5*(abs(CASE2.Z_ALPHA_V.Var2-CASE2.Z_ALPHA_V.Var4)),'ok',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 5
errorbar(CASE2.Z_ALPHA_V.Var5,0.5*(CASE2.Z_ALPHA_V.Var6+CASE2.Z_ALPHA_V.Var8),0.5*(abs(CASE2.Z_ALPHA_V.Var6-CASE2.Z_ALPHA_V.Var8)),'sk',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 10
errorbar(CASE2.Z_ALPHA_V.Var9,0.5*(CASE2.Z_ALPHA_V.Var10+CASE2.Z_ALPHA_V.Var12),0.5*(abs(CASE2.Z_ALPHA_V.Var10-CASE2.Z_ALPHA_V.Var12)),'dk',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 15
errorbar(CASE2.Z_ALPHA_V.Var13,0.5*(CASE2.Z_ALPHA_V.Var14+CASE2.Z_ALPHA_V.Var16),0.5*(abs(CASE2.Z_ALPHA_V.Var14-CASE2.Z_ALPHA_V.Var16)),'^k',MarkerSize=8,MarkerFaceColor='k')
hold on

% ASWING DATA:
hold on
rand_f = (1+0.1*(1-2*rand(length(CASE1.Z_ALPHA_V.Var2),1)));
plot(CASE2_ASW_A1.Var5,-CASE2_ASW_A1.Var3,'-r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 5
rand_f = (1+0.1*(1-2*rand(length(CASE1.Z_ALPHA_V.Var6),1)));
hold on
plot(CASE2_ASW_A5.Var5,-CASE2_ASW_A5.Var3,'--r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 10
rand_f = (1+0.1*(1-2*rand(length(CASE1.Z_ALPHA_V.Var10),1)));
hold on
plot(CASE2_ASW_A10.Var5,-CASE2_ASW_A10.Var3,':r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 15
rand_f = (1+0.1*(1-2*rand(length(CASE1.Z_ALPHA_V.Var14),1)));
hold on
plot(CASE2_ASW_A15.Var5,-CASE2_ASW_A15.Var3,'-.r','linewidth',1.5,MarkerFaceColor='r')
ylim([0 0.30])
xlim([0 30])
grid on
xlabel('V in m/s')
ylabel('\Delta z_{tip} in m')
set(gca,"FontSize",14)
legend('Exp : \alpha = 1 \circ','Exp : \alpha = 5 \circ','Exp : \alpha = 10 \circ','Exp : \alpha = 15 \circ','ASW : \alpha = 1 \circ','ASW : \alpha = 5 \circ','ASW : \alpha = 10 \circ','ASW : \alpha = 15 \circ',Location='northwest')
saveas(gcf,"[+15_2_0_2]_Z_V",'epsc')


figure(4)
hold on
% alpha = 1
errorbar(CASE2.T_ALPHA_V.Var1,0.5*(CASE2.T_ALPHA_V.Var2+CASE2.T_ALPHA_V.Var4),0.5*(abs(CASE2.T_ALPHA_V.Var2-CASE2.T_ALPHA_V.Var4)),'ok',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 5
errorbar(CASE2.T_ALPHA_V.Var5,0.5*(CASE2.T_ALPHA_V.Var6+CASE2.T_ALPHA_V.Var8),0.5*(abs(CASE2.T_ALPHA_V.Var6-CASE2.T_ALPHA_V.Var8)),'sk',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 10
errorbar(CASE2.T_ALPHA_V.Var9,0.5*(CASE2.T_ALPHA_V.Var10+CASE2.T_ALPHA_V.Var12),0.5*(abs(CASE2.T_ALPHA_V.Var10-CASE2.T_ALPHA_V.Var12)),'dk',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 15
errorbar(CASE2.T_ALPHA_V.Var13,0.5*(CASE2.T_ALPHA_V.Var14+CASE2.T_ALPHA_V.Var16),0.5*(abs(CASE2.T_ALPHA_V.Var14-CASE2.T_ALPHA_V.Var16)),'^k',MarkerSize=8,MarkerFaceColor='k')
hold on
% ASWING DATA:
% alpha = 1
hold on
rand_f = (1+0.1*(1-2*rand(length(CASE1.T_ALPHA_V.Var2),1)));
plot(CASE2_ASW_A1.Var5,1-(CASE2_ASW_A1.Var4),'-r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 5
rand_f = (1+0.1*(1-2*rand(length(CASE1.T_ALPHA_V.Var6),1)));
hold on
plot(CASE2_ASW_A5.Var5,5-(CASE2_ASW_A5.Var4),'--r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 10
rand_f = (1+0.1*(1-2*rand(length(CASE1.T_ALPHA_V.Var10),1)));
hold on
plot(CASE2_ASW_A10.Var5,10-(CASE2_ASW_A10.Var4),':r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 15
rand_f = (1+0.1*(1-2*rand(length(CASE1.T_ALPHA_V.Var14),1)));
hold on
plot(CASE2_ASW_A15.Var5,15-(CASE2_ASW_A15.Var4),'-.r','linewidth',1.5,MarkerFaceColor='r')


grid on
xlabel('V in m/s')
ylabel('\Delta \theta in ^\circ')
set(gca,"FontSize",14)
ylim([0 30])
xlim([0 30])
saveas(gcf,"[+15_2_0_2]_T_V",'epsc')
% legend('Exp : \alpha = 1 \circ','Exp : \alpha = 5 \circ','Exp : \alpha = 10 \circ','Exp : \alpha = 15 \circ','ASWING : \alpha = 1 \circ','ASWING : \alpha = 5 \circ','ASWING : \alpha = 10 \circ','ASWING : \alpha = 15 \circ')


%% CASE III : [-15_2_0_2]_s

% system('sh ./\[m15_02]_s_A1.sh')
% system('sh ./\[m15_02]_s_A5.sh')
% system('sh ./\[m15_02]_s_A10.sh')
% system('sh ./\[m15_02]_s_A15.sh')




CASE3_ASW_A1 = readtable('[m15_02]_S_A1.txt',NumHeaderLines=3)
CASE3_ASW_A5 = readtable('[m15_02]_S_A5.txt',NumHeaderLines=3)
CASE3_ASW_A10 = readtable('[m15_02]_S_A10.txt',NumHeaderLines=3)
CASE3_ASW_A15 = readtable('[m15_02]_S_A15.txt',NumHeaderLines=3)


figure(5)
hold on
% alpha = 1
errorbar(CASE3.Z_ALPHA_V.Var1,0.5*(CASE3.Z_ALPHA_V.Var2+CASE3.Z_ALPHA_V.Var4),0.5*(abs(CASE3.Z_ALPHA_V.Var2-CASE3.Z_ALPHA_V.Var4)),'ok',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 5
errorbar(CASE3.Z_ALPHA_V.Var5,0.5*(CASE3.Z_ALPHA_V.Var6+CASE3.Z_ALPHA_V.Var8),0.5*(abs(CASE3.Z_ALPHA_V.Var6-CASE3.Z_ALPHA_V.Var8)),'sk',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 10
errorbar(CASE3.Z_ALPHA_V.Var9,0.5*(CASE3.Z_ALPHA_V.Var10+CASE3.Z_ALPHA_V.Var12),0.5*(abs(CASE3.Z_ALPHA_V.Var10-CASE3.Z_ALPHA_V.Var12)),'dk',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 15
errorbar(CASE3.Z_ALPHA_V.Var13,0.5*(CASE3.Z_ALPHA_V.Var14+CASE3.Z_ALPHA_V.Var16),0.5*(abs(CASE3.Z_ALPHA_V.Var14-CASE3.Z_ALPHA_V.Var16)),'^k',MarkerSize=8,MarkerFaceColor='k')
hold on

% ASWING DATA:
hold on

plot(CASE3_ASW_A1.Var5,-CASE3_ASW_A1.Var3,'-r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 5

hold on
plot(CASE3_ASW_A5.Var5,-CASE3_ASW_A5.Var3,'--r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 10

hold on
plot(CASE3_ASW_A10.Var5,-CASE3_ASW_A10.Var3,':r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 15
ylim([0 0.30])
xlim([0 30])

hold on
plot(CASE3_ASW_A15.Var5,-CASE3_ASW_A15.Var3,'-.r','linewidth',1.5,MarkerFaceColor='r')
grid on
xlabel('V in m/s')
ylabel('\Delta z_{tip} in m')
set(gca,"FontSize",14)
legend('Exp : \alpha = 1 \circ','Exp : \alpha = 5 \circ','Exp : \alpha = 10 \circ','Exp : \alpha = 15 \circ','ASW : \alpha = 1 \circ','ASW : \alpha = 5 \circ','ASW : \alpha = 10 \circ','ASW : \alpha = 15 \circ',Location='northwest')
saveas(gcf,"m_Z_V",'epsc')




figure(6)
hold on
% alpha = 1
errorbar(CASE3.T_ALPHA_V.Var1,50*(CASE3.T_ALPHA_V.Var2+CASE3.T_ALPHA_V.Var4),50*(abs(CASE3.T_ALPHA_V.Var2-CASE3.T_ALPHA_V.Var4)),'ok',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 5
errorbar(CASE3.T_ALPHA_V.Var5,50*(CASE3.T_ALPHA_V.Var6+CASE3.T_ALPHA_V.Var8),50*(abs(CASE3.T_ALPHA_V.Var6-CASE3.T_ALPHA_V.Var8)),'sk',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 10
errorbar(CASE3.T_ALPHA_V.Var9,50*(CASE3.T_ALPHA_V.Var10+CASE3.T_ALPHA_V.Var12),50*(abs(CASE3.T_ALPHA_V.Var10-CASE3.T_ALPHA_V.Var12)),'dk',MarkerSize=8,MarkerFaceColor='k')
hold on
% alpha = 15
errorbar(CASE3.T_ALPHA_V.Var13,50*(CASE3.T_ALPHA_V.Var14+CASE3.T_ALPHA_V.Var16),50*(abs(CASE3.T_ALPHA_V.Var14-CASE3.T_ALPHA_V.Var16)),'^k',MarkerSize=8,MarkerFaceColor='k')
hold on
% ASWING DATA:
% alpha = 1
hold on

plot(CASE3_ASW_A1.Var5,1-CASE3_ASW_A1.Var4,'-r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 5

hold on
plot(CASE3_ASW_A5.Var5,5-CASE3_ASW_A5.Var4,'--r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 10

hold on
plot(CASE3_ASW_A10.Var5,10-CASE3_ASW_A10.Var4,':r','linewidth',1.5,MarkerFaceColor='r')

% alpha = 15

hold on
plot(CASE3_ASW_A15.Var5,15-CASE3_ASW_A15.Var4,'-.r','linewidth',1.5,MarkerFaceColor='r')
ylim([0 30])
xlim([0 30])
grid on
xlabel('V in m/s')
ylabel('\Delta \theta in ^\circ')
set(gca,"FontSize",14)
saveas(gcf,"m_T_V",'epsc')
% legend('Exp : \alpha = 1 \circ','Exp : \alpha = 5 \circ','Exp : \alpha = 10 \circ','Exp : \alpha = 15 \circ','ASWING : \alpha = 1 \circ','ASWING : \alpha = 5 \circ','ASWING : \alpha = 10 \circ','ASWING : \alpha = 15 \circ')
