%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fuselage drag polyfit for drag correction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha = [
-6.25
-3.25
-0.25
2.75
5.75
8.75
11.75];

CD = [0.027
0.0249
0.0235
0.0236
0.0254
0.0287
0.0346];

CM = [-0.1487
-0.0507
0.0407
0.1387
0.2282
0.2996
0.3587];

p_fuse = polyfit(alpha,CD,3)

% alpha_cont = linspace(alpha(1),alpha(end),100)
% figure (10)
% plot(alpha,CD,'rs')
% hold on
% plot(alpha_cont,polyval(p_fuse,alpha_cont),'--r',LineWidth=2.0)
% xlabel('angle of attack in deg')
% ylabel('C_D')
% grid on
% legend('Exp','Polyfit')

p_fuse_cm = polyfit(alpha,CM,1)

figure(11)
plot(alpha,CM,'sk')
xlabel('\alpha in deg')
ylabel('C_m')
grid on


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RUN 17
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [out1 out2] = system('sh ./RUN17.sh');


aswing_data = readtable("Aswing_Runs/Runs17.txt",NumHeaderLines=3)
run_17_asw_alpha = aswing_data.Var3;
run_17_asw_CD = aswing_data.Var4;
run_17_asw_CY = aswing_data.Var5;
run_17_asw_CL = aswing_data.Var6;
run_17_asw_Cl = aswing_data.Var7;
run_17_asw_Cm = aswing_data.Var8;
run_17_asw_Cn = aswing_data.Var9;
run_17_asw_e = aswing_data.Var10;


run_17_exp_alpha = [-6.2
-5.15
-4.11
-3.07
-2.04
-1
0.03
1.07
2.1
3.14
4.17
5.19
6.2
7.22];

run_17_exp_CL = [0.1235
0.2425
0.3425
0.4336
0.5159
0.61
0.6923
0.779
0.8598
0.9451
1.0142
1.073
1.1097
1.145];

run_17_exp_CD = [0.0513
0.0454
0.0442
0.0447
0.0461
0.049
0.0525
0.0569
0.0618
0.0675
0.0736
0.0807
0.0886
0.0965];

run_17_exp_Cm = [-0.1231
-0.1998
-0.2481
-0.3056
-0.3695
-0.4193
-0.4697
-0.5484
-0.6138
-0.6862
-0.7411
-0.7983
-0.8407
-0.8681];


run_17_exp_Cn = zeros(length(run_17_exp_alpha),1);
run_17_exp_CY = zeros(length(run_17_exp_alpha),1);
run_17_exp_Cl = zeros(length(run_17_exp_alpha),1);

run_18_exp_alpha = [-6.21
-5.17
-4.13
-3.1
-2.06
-1.03
0
1.04
2.07
3.09];

run_18_exp_CL = [0.0897
0.1984
0.2925
0.3704
0.46
0.5335
0.6203
0.6952
0.7702
0.8319];

run_18_exp_CD = [0.0544
0.049
0.0486
0.0498
0.0521
0.0545
0.0584
0.0623
0.0668
0.0722];

run_18_exp_Cm = [-0.1434
-0.1763
-0.2202
-0.2706
-0.3215
-0.3724
-0.4277
-0.4933
-0.562
-0.6187];


run_18_exp_Cn = zeros(length(run_18_exp_alpha),1);
run_18_exp_CY = zeros(length(run_18_exp_alpha),1);
run_18_exp_Cl = zeros(length(run_18_exp_alpha),1);


run_19_exp_alpha = [-6.2
-5.16
-4.12
-3.09
-2.05
-1.02
0.01
1.04
2.07
3.1
4.13
5.15
6.17
7.18];

run_19_exp_CL = [0.1102
0.2161
0.3072
0.3866
0.4924
0.5571
0.632
0.7129
0.7834
0.8481
0.9157
0.9671
1.0142
1.0436];

run_19_exp_CD = [0.0526
0.0474
0.0469
0.0484
0.0508
0.0536
0.057
0.0612
0.0658
0.071
0.0772
0.0844
0.0925
0.1009];

run_19_exp_Cm = [-0.1409
-0.1829
-0.2369
-0.2726
-0.325
-0.384
-0.4263
-0.5152
-0.5743
-0.6342
-0.6959
-0.7509
-0.7936
-0.8147];


run_19_exp_Cn = zeros(length(run_19_exp_alpha),1);
run_19_exp_CY = zeros(length(run_19_exp_alpha),1);
run_19_exp_Cl = zeros(length(run_19_exp_alpha),1);



figure(1)
subplot(1,3,1)
plot(run_17_exp_alpha,run_17_exp_CL,'ks',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(run_18_exp_alpha,run_18_exp_CL,'bd',MarkerFaceColor='b',MarkerSize=8)
hold on
plot(run_19_exp_alpha,run_19_exp_CL,'v',MarkerFaceColor=[0 0.5 0],MarkerSize=8,MarkerEdgeColor=[0 0.5 0])
hold on
plot(run_17_exp_alpha,run_17_asw_CL,'--r',LineWidth=2.0)
xlabel('\alpha in deg')
ylabel('C_L')
grid on
legend('Exp strip 1','Exp strip 2','Exp strip 3','ASWING')


JW_FW_IN_CDp = [0.0206   -0.0614    0.0678   -0.0313    0.0068];
JW_FW_IN_CDf = [0.0106   -0.0276    0.0257   -0.0082    0.0132];

Cd_poly = JW_FW_IN_CDp+JW_FW_IN_CDf;
Cd_poly(end) = 0.0;
subplot(1,3,2)
plot(run_17_exp_alpha,run_17_exp_CD,'ks',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(run_18_exp_alpha,run_18_exp_CD,'bd',MarkerFaceColor='b',MarkerSize=8)
hold on
plot(run_19_exp_alpha,run_19_exp_CD,'v',MarkerFaceColor=[0 0.5 0],MarkerSize=8,MarkerEdgeColor=[0 0.5 0])
hold on
plot(run_17_asw_alpha,polyval(p_fuse,run_17_asw_alpha)+run_17_asw_CD,'--r',LineWidth=2.0)
xlabel('\alpha in deg')
ylabel('C_D')
grid on
legend('Exp strip 1','Exp strip 2','Exp strip 3','ASWING')
ylim([0.0 0.11])



subplot(1,3,3)
plot(run_17_exp_alpha,run_17_exp_Cm-polyval(p_fuse_cm,run_17_exp_alpha),'ks',MarkerFaceColor='k',MarkerSize=8)
hold on
% plot(run_17_exp_alpha,run_17_exp_Cm,'ks',MarkerFaceColor='k',MarkerSize=8)
% hold on
plot(run_18_exp_alpha,run_18_exp_Cm-polyval(p_fuse_cm,run_18_exp_alpha),'bd',MarkerFaceColor='b',MarkerSize=8)
hold on
plot(run_19_exp_alpha,run_19_exp_Cm-polyval(p_fuse_cm,run_19_exp_alpha),'v',MarkerFaceColor=[0 0.5 0],MarkerSize=8,MarkerEdgeColor=[0 0.5 0])
hold on
plot(run_17_exp_alpha,run_17_asw_Cm,'--r',LineWidth=2.0)
xlabel('\alpha in deg')
ylabel('C_m')
grid on
legend('Exp strip 1','Exp strip 2','Exp strip 3','ASWING')
% subplot(2,3,4)
% plot(run_17_exp_alpha,run_17_exp_CY,'ks',MarkerFaceColor='k',MarkerSize=8)
% hold on
% plot(run_17_exp_alpha,run_17_asw_CY,'--r',MarkerFaceColor='k',MarkerSize=8)
% xlabel('\alpha in deg')
% ylabel('C_Y')
% ylim([-1 1])
% grid on
% legend('Exp strip 1','Exp strip 2','Exp strip 3','ASWING')
% subplot(2,3,5)
% plot(run_17_exp_alpha,run_17_exp_Cn,'ks',MarkerFaceColor='k',MarkerSize=8)
% hold on
% plot(run_17_exp_alpha,run_17_asw_Cn,'--r',MarkerFaceColor='k',MarkerSize=8)
% xlabel('\alpha in deg')
% ylabel('C_Y')
% ylim([-1 1])
% grid on
% legend('Exp strip 1','Exp strip 2','Exp strip 3','ASWING')
% subplot(2,3,6)
% plot(run_17_exp_alpha,run_17_exp_Cl,'ks',MarkerFaceColor='k',MarkerSize=8)
% hold on
% plot(run_17_exp_alpha,run_17_asw_Cl,'--r',MarkerFaceColor='k',MarkerSize=8)
% xlabel('\alpha in deg')
% ylabel('C_Y')
% ylim([-1 1])
% grid on
% legend('Exp strip 1','Exp strip 2','Exp strip 3','ASWING')
