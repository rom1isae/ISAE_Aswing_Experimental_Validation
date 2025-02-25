clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BODY CORRECTION OF LONGITUDINAL AND LATERAL CHARACTERISTIC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Body_alpha = [-7.606445583
-4.991429949
-2.415698653
0.003073045
2.087157582
4.05356686
4.977637607
5.980514041
7.101658259
8.084833272
9.009496543
10.0320744
11.95955485];

Body_CL = [-0.044680616
-0.025470316
-0.006249512
0.014370726
0.0291981
0.045414403
0.051954656
0.060283792
0.071748727
0.079630642
0.090695623
0.09947198
0.118413625];

Body_CD = [0.021661027
0.018062434
0.016007664
0.016161172
0.016412612
0.018338301
0.019560316
0.021044305
0.023044394
0.02568765
0.028334267
0.031887143
0.038982812];


Body_CM = [-0.06370731
-0.05207293
-0.04043773
-0.029736095
-0.020661172
-0.010887358
-0.007398234
-0.003094421
0.000859127
0.002714974
0.004104347
0.006309434
0.007687114];

Body_Cn_Beta_2_5 = 0.5*([0.004059002
0.004439315
0.004426996
0.004469424
0.004380802
0.004339685
0.004156822
0.004120616
0.004162003
0.004360306
0.004373415
0.004347467
0.004009937]+abs([-0.004239452
-0.00482356
-0.004922441
-0.004979247
-0.005149604
-0.00516546
-0.005127693
-0.005047852
-0.00507561
-0.005079314
-0.005230361
-0.005071116
-0.004789955]));

Body_CY_Beta_2_5 = 0.5*(abs([-0.037464825
-0.034193146
-0.033887481
-0.034361693
-0.033645259
-0.033706217
-0.033438413
-0.032534283
-0.033194875
-0.033852983
-0.03434766
-0.035025647
-0.034623649])+abs([0.042099935
0.038199239
0.036764325
0.035852009
0.035612711
0.035868674
0.035190686
0.035339791
0.037169832
0.035244042
0.037098934
0.037215733
0.036813004]));


figure("Name","Body correction : CL")
plot(Body_alpha,Body_CL,'rs',MarkerFaceColor='r',MarkerSize=8)
Body_CL_polyfit = polyfit(Body_alpha,Body_CL,1);
hold on
plot(Body_alpha,polyval(Body_CL_polyfit,Body_alpha),'--r',LineWidth=1.5)
legend('Exp data','polyfit')
hold on
grid on
xlabel('\alpha in deg')
ylabel('C_L')
title('Body C_L')


figure("Name","Body correction : CM")
plot(Body_alpha,Body_CM,'rs',MarkerFaceColor='r',MarkerSize=8)
Body_CM_polyfit = polyfit(Body_alpha,Body_CM,1);
hold on
plot(Body_alpha,polyval(Body_CM_polyfit,Body_alpha),'--r',LineWidth=1.5)
legend('Exp data','polyfit')
hold on
grid on
xlabel('\alpha in deg')
ylabel('C_M')
title('Body C_M')

figure("Name","Body correction : CD")
plot(Body_alpha,Body_CD,'rs',MarkerFaceColor='r',MarkerSize=8)
Body_CD_polyfit = polyfit(Body_alpha,Body_CD,4);
hold on
plot(Body_alpha,polyval(Body_CD_polyfit,Body_alpha),'--r',LineWidth=1.5)
legend('Exp data','polyfit')
hold on
grid on
xlabel('\alpha in deg')
ylabel('C_D')
title('Body C_D')

figure("Name","Body correction : Cn")
plot(Body_alpha,Body_Cn_Beta_2_5,'rs',MarkerFaceColor='r',MarkerSize=8)
Body_Cn_polyfit = polyfit(Body_alpha,Body_Cn_Beta_2_5,1);
hold on
plot(Body_alpha,polyval(Body_Cn_polyfit,Body_alpha),'--r',LineWidth=1.5)
legend('Exp data','polyfit')
hold on
grid on
xlabel('\alpha in deg')
ylabel('C_n')
ylim([0.0 0.0075])
title('Body C_n')

figure("Name","Body correction : CY")
plot(Body_alpha,Body_CY_Beta_2_5,'rs',MarkerFaceColor='r',MarkerSize=8)
Body_Cy_polyfit = polyfit(Body_alpha,Body_CY_Beta_2_5,1);
hold on
plot(Body_alpha,polyval(Body_Cy_polyfit,Body_alpha),'--r',LineWidth=1.5)
legend('Exp data','polyfit')
hold on
grid on
ylim([0.0 0.05])
xlabel('\alpha in deg')
ylabel('C_y')
title('Body C_y')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LONGITUDINAL CHARACTERISTIC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lift VS alpha
JW1_CL_alpha = [-7.640677555
-5.019923639
-2.45666798
0.172585679
2.201524196
4.297960668
6.1779037
7.201706009
8.177009788
9.191812369
10.18744887
12.29071846];

JW1_CL = [-0.087445835
0.211524903
0.510295648
0.76987566
0.967077765
1.118137834
1.205836187
1.172295789
1.09684757
1.105015
1.113115764
1.14361989];



figure("Name","JW1 : Longitudinal characteristic")
subplot(1,3,1)
errorbar(JW1_CL_alpha,JW1_CL,0.075*ones(1,length(JW1_CL_alpha)),'ks',MarkerFaceColor='k',MarkerSize=6)
hold on
JW1_dCL_dalpha_poly = polyfit(JW1_CL_alpha(1:6),JW1_CL(1:6),1)
plot(JW1_CL_alpha,polyval(JW1_dCL_dalpha_poly,JW1_CL_alpha),'--k',LineWidth=1.5)
leg1 = "Exp data linear fit $C_{L,\alpha} = $" + num2str(180*JW1_dCL_dalpha_poly(1)/pi,3);
JW1_CM_alpha_asw = readtable("JW1_Aswing_simulations/JW_1_CL_alpha.txt",...
                                                        NumHeaderLines=3)
hold on

JW1_CL_alpha_asw = readtable("JW1_Aswing_simulations/JW_1_CL_alpha.txt",...
                                                        NumHeaderLines=3)
plot(JW1_CL_alpha,JW1_CL_alpha_asw.Var6 + ...
       0*polyval(Body_CL_polyfit,JW1_CL_alpha),'ro',MarkerFaceColor='r',MarkerSize=6)
hold on
JW1_dCL_dalpha_poly_asw = polyfit(JW1_CL_alpha(1:6),JW1_CL_alpha_asw.Var6(1:6)+0*polyval(Body_CL_polyfit,JW1_CL_alpha(1:6)),1)
plot(JW1_CL_alpha,polyval(JW1_dCL_dalpha_poly_asw,JW1_CL_alpha),'-.r',LineWidth=1.5)
leg2 = "Aswing data linear fit $C_{L,\alpha} = $" + num2str(180*JW1_dCL_dalpha_poly_asw(1)/pi,3);
xlabel('\alpha in deg')
ylabel('C_L')
legend('Exp Cm',leg1,"Aswing data",leg2,interpreter = "latex")
grid on
ylim([-0.5 2.5])

% Drag VS alpha
JW1_CD_alpha = [-7.572003483
-5.018166035
-2.358689233
0.20657032
2.356101541
4.372858355
6.260648132
7.36345531
8.270757161
9.246168596
10.26938365
12.25362675];

JW1_CD = [0.033796572
0.027943774
0.029317283
0.036259549
0.044168766
0.058899379
0.084716412
0.142305463
0.203111273
0.229102467
0.264198928
0.331396502];

% 
% figure("Name","JW1 : CD VS ALPHA")
subplot(1,3,2)
errorbar(JW1_CD_alpha,JW1_CD,0.015*ones(1,length(JW1_CD_alpha)),'ks',MarkerFaceColor='k',MarkerSize=6)
hold on
JW1_CD_alpha_asw = readtable("JW1_Aswing_simulations/JW_1_CL_alpha.txt",...
                                                        NumHeaderLines=3)
plot(JW1_CL_alpha,JW1_CD_alpha_asw.Var4 + ...
       polyval(Body_CD_polyfit,JW1_CD_alpha),'--ro',LineWidth=1.5,MarkerFaceColor='r',MarkerSize=6)
xlabel('\alpha in deg')
ylabel('C_D')
legend('Exp','Aswing')
grid on
ylim([-0.0 0.4])
title('JW-1: longitudinal characteristics')


% Pitching moment VS alpha
JW1_CM_alpha = [-7.605914806
-4.998737183
-2.403147016
0.116440608
2.191097838
4.251431298
6.120027262
7.170995569
8.208868656
9.187575912
10.27702016
12.22991137];

JW1_CM = [0.170661399
0.106447157
0.022518311
-0.062767524
-0.135167104
-0.170129556
-0.153959915
-0.100808901
-0.06343174
-0.071416614
-0.068827712
-0.072975209];


% figure("Name","JW1 : CM VS ALPHA")
subplot(1,3,3)
errorbar(JW1_CM_alpha,JW1_CM,0.015*ones(1,length(JW1_CM_alpha)),'ks',MarkerFaceColor='k',MarkerSize=6)
hold on
JW1_dCM_dalpha_poly = polyfit(JW1_CM_alpha(1:6),JW1_CM(1:6),1)
plot(JW1_CM_alpha,polyval(JW1_dCM_dalpha_poly,JW1_CM_alpha),'--k',LineWidth=1.5)
leg1 = "Exp data linear fit $C_{M,\alpha} = $" + num2str(JW1_dCM_dalpha_poly(1),2);
JW1_CM_alpha_asw = readtable("JW1_Aswing_simulations/JW_1_CL_alpha.txt",...
                                                        NumHeaderLines=3)
plot(JW1_CL_alpha,JW1_CM_alpha_asw.Var8 + ...
       polyval(Body_CM_polyfit,JW1_CM_alpha),'ro',MarkerFaceColor='r',MarkerSize=6)
hold on
JW1_dCM_dalpha_poly_asw = polyfit(JW1_CM_alpha(1:6),JW1_CM_alpha_asw.Var8(1:6)+polyval(Body_CM_polyfit,JW1_CM_alpha(1:6)),1)
plot(JW1_CM_alpha,polyval(JW1_dCM_dalpha_poly_asw,JW1_CM_alpha),'-.r',LineWidth=1.5)
leg2 = "Aswing data linear fit $C_{M,\alpha} = $" + num2str(JW1_dCM_dalpha_poly_asw(1),2);
xlabel('\alpha in deg')
ylabel('C_M')
legend('Exp Cm',leg1,"Aswing data",leg2,interpreter = "latex")
grid on
ylim([-0.5 0.3])
