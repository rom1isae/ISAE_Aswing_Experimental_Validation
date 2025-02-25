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
JW2_CL_alpha = [-7.70202504
-5.094235407
-2.470020812
0.14808893
2.134201051
4.171768359
5.219768095
6.240877407
7.190036669
8.10721813
9.276733507
10.10045258
12.06941297];

JW2_CL = [-0.064623435
0.236925638
0.521717287
0.773091342
0.978282052
1.145135344
1.228489049
1.271312874
1.240286479
1.247548875
1.249405173
1.278393446
1.283029963];

S1 = 3.039;
S2 =  2.686;
body_correction = S1/S2;

figure("Name","JW2 : Longitudinal characteristics")
subplot(1,3,1)
errorbar(JW2_CL_alpha,JW2_CL,0.075*ones(1,length(JW2_CL_alpha)),'ks',MarkerFaceColor='k',MarkerSize=6)
hold on
JW2_dCL_dalpha_poly = polyfit(JW2_CL_alpha(1:6),JW2_CL(1:6),1)
plot(JW2_CL_alpha,polyval(JW2_dCL_dalpha_poly,JW2_CL_alpha),'--k',LineWidth=1.5)
leg1 = "Exp data linear fit $C_{L,\alpha} = $" + num2str(180*JW2_dCL_dalpha_poly(1)/pi,3);
JW2_CM_alpha_asw = readtable("JW2_Aswing_simulations/JW_2_CL_alpha.txt",...
                                                        NumHeaderLines=3)
hold on

JW2_CL_alpha_asw = readtable("JW2_Aswing_simulations/JW_2_CL_alpha.txt",...
                                                        NumHeaderLines=3)
plot(JW2_CL_alpha,JW2_CL_alpha_asw.Var6 + ...
       body_correction*polyval(Body_CL_polyfit,JW2_CL_alpha),'ro',MarkerFaceColor='r',MarkerSize=6)
hold on
JW2_dCL_dalpha_poly_asw = polyfit(JW2_CL_alpha(1:6),JW2_CL_alpha_asw.Var6(1:6)+body_correction*polyval(Body_CL_polyfit,JW2_CL_alpha(1:6)),1)
plot(JW2_CL_alpha,polyval(JW2_dCL_dalpha_poly_asw,JW2_CL_alpha),'-.r',LineWidth=1.5)
leg2 = "Aswing data linear fit $C_{L,\alpha} = $" + num2str(180*JW2_dCL_dalpha_poly_asw(1)/pi,3);
xlabel('\alpha in deg')
ylabel('C_L')
legend('Exp Cm',leg1,"Aswing data",leg2,interpreter = "latex")
grid on
ylim([-0.5 2.5])



% Drag VS alpha
JW2_CD_alpha = [-7.642724458
-5.09935266
-2.562285393
0.047340276
2.174021953
4.182212215
5.097832817
6.216633831
7.17486631
8.240641711
9.32642837
10.1835069
12.04286518];

JW2_CD = [0.041215874
0.03392063
0.035992119
0.044548269
0.056335491
0.072738531
0.083816493
0.107312131
0.169366732
0.214500422
0.258474529
0.299386434
0.365482691];


S1 = 3.039;
S2 =  2.686;
body_correction = S1/S2;

% figure("Name","JW2 : CD VS ALPHA")
subplot(1,3,2)
errorbar(JW2_CD_alpha,JW2_CD,0.015*ones(1,length(JW2_CD_alpha)),'ks',MarkerFaceColor='k',MarkerSize=6)
hold on
JW2_CD_alpha_asw = readtable("JW2_Aswing_simulations/JW_2_CL_alpha.txt",...
                                                        NumHeaderLines=3)
plot(JW2_CL_alpha,JW2_CD_alpha_asw.Var4 + ...
       body_correction*polyval(Body_CD_polyfit,JW2_CD_alpha),'--ro',LineWidth=1.5,MarkerFaceColor='r',MarkerSize=6)
xlabel('\alpha in deg')
ylabel('C_D')
legend('Exp','Aswing')
grid on
ylim([0.0 0.4])
title('JW-2: longitudinal characteristics')



% Pitching moment VS alpha
JW2_CM_alpha = [-7.695811442
-5.072185132
-2.430949085
0.113265168
2.12240143
4.209547699
5.20640456
6.165686507
7.241114196
8.218566698
9.216096543
10.26976443
12.24424204];

JW2_CM = [0.164821315
0.111405159
0.037515901
-0.050964227
-0.113699549
-0.159645333
-0.166522383
-0.163154279
-0.145932018
-0.155727243
-0.153832565
-0.170229528
-0.184708871];

% figure("Name","JW2 : CM VS ALPHA")
subplot(1,3,3)
errorbar(JW2_CM_alpha,JW2_CM,0.015*ones(1,length(JW2_CM_alpha)),'ks',MarkerFaceColor='k',MarkerSize=6)
hold on
JW2_dCM_dalpha_poly = polyfit(JW2_CM_alpha(1:6),JW2_CM(1:6),1)
plot(JW2_CM_alpha,polyval(JW2_dCM_dalpha_poly,JW2_CM_alpha),'--k',LineWidth=1.5)
leg1 = "Exp data linear fit $C_{M,\alpha} = $" + num2str(JW2_dCM_dalpha_poly(1),2);
JW2_CM_alpha_asw = readtable("JW2_Aswing_simulations/JW_2_CL_alpha.txt",...
                                                        NumHeaderLines=3)
plot(JW2_CL_alpha,JW2_CM_alpha_asw.Var8 + ...
       body_correction*polyval(Body_CM_polyfit,JW2_CM_alpha),'ro',MarkerFaceColor='r',MarkerSize=6)
hold on
JW2_dCM_dalpha_poly_asw = polyfit(JW2_CM_alpha(1:6),JW2_CM_alpha_asw.Var8(1:6)+body_correction*polyval(Body_CM_polyfit,JW2_CM_alpha(1:6)),1)
plot(JW2_CM_alpha,polyval(JW2_dCM_dalpha_poly_asw,JW2_CM_alpha),'-.r',LineWidth=1.5)
leg2 = "Aswing data linear fit $C_{M,\alpha} = $" + num2str(JW2_dCM_dalpha_poly_asw(1),2);
xlabel('\alpha in deg')
ylabel('C_M')
legend('Exp Cm',leg1,"Aswing data",leg2,interpreter = "latex")
grid on
ylim([-0.5 0.3])