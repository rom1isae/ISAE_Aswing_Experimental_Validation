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
JW3_CL_alpha = [-7.669722759
-7.055507386
-5.047722646
-2.425722534
0.146256732
2.305405316
4.148844913
5.198647914
6.218013102
7.249534373
8.267566519
9.182922624
10.17661087
12.12878868];

JW3_CL = [-0.086337032
-0.028516442
0.203070615
0.492478262
0.746751285
0.951661326
1.122634751
1.222452539
1.289723307
1.254872604
1.262323794
1.271767046
1.291560713
1.313531106];

S1 = 3.039;
S3 = 2.167;
body_correction = S1/S3;

figure("Name","JW3 : Longitudinal characteristic")
subplot(1,3,1)
errorbar(JW3_CL_alpha,JW3_CL,0.075*ones(1,length(JW3_CL_alpha)),'ks',MarkerFaceColor='k',MarkerSize=6)
hold on
JW3_dCL_dalpha_poly = polyfit(JW3_CL_alpha(1:6),JW3_CL(1:6),1)
plot(JW3_CL_alpha,polyval(JW3_dCL_dalpha_poly,JW3_CL_alpha),'--k',LineWidth=1.5)
leg1 = "Exp data linear fit $C_{L,\alpha} = $" + num2str(180*JW3_dCL_dalpha_poly(1)/pi,3);

hold on

JW3_CL_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_CL_alpha.txt",...
                                                        NumHeaderLines=3)
plot(JW3_CL_alpha,JW3_CL_alpha_asw.Var6 + ...
       body_correction*polyval(Body_CL_polyfit,JW3_CL_alpha),'ro',MarkerFaceColor='r',MarkerSize=6)
hold on
JW3_dCL_dalpha_poly_asw = polyfit(JW3_CL_alpha(1:6),JW3_CL_alpha_asw.Var6(1:6)+body_correction*polyval(Body_CL_polyfit,JW3_CL_alpha(1:6)),1)
plot(JW3_CL_alpha,polyval(JW3_dCL_dalpha_poly_asw,JW3_CL_alpha),'-.r',LineWidth=1.5)
leg2 = "Aswing data linear fit $C_{L,\alpha} = $" + num2str(180*JW3_dCL_dalpha_poly_asw(1)/pi,3);
xlabel('\alpha in deg')
ylabel('C_L')
legend('Exp Cm',leg1,"Aswing data",leg2,interpreter = "latex")
grid on
ylim([-0.5 2.5])


% Drag VS alpha
JW3_CD_alpha = [-7.601603849
-7.074899759
-5.021972735
-2.417321572
0.192461909
2.27393745
4.183159583
5.266078589
6.177706496
7.174979952
8.27265437
9.265437049
10.22999198
12.25244587];

JW3_CD = [0.049240558
0.045960222
0.041811422
0.044502177
0.056728015
0.069254475
0.089032455
0.100934872
0.121876636
0.192844181
0.232159961
0.258420672
0.304965703
0.389656896];


S1 = 3.039;
S3 = 2.167;
body_correction = S1/S3;
% figure("Name","JW3 : CD VS ALPHA")
subplot(1,3,2)

errorbar(JW3_CD_alpha,JW3_CD,0.015*ones(1,length(JW3_CD_alpha)),'ks',MarkerFaceColor='k',MarkerSize=6)
hold on
JW3_CD_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_CL_alpha.txt",...
                                                        NumHeaderLines=3)
plot(JW3_CL_alpha,JW3_CD_alpha_asw.Var4 + ...
       body_correction*polyval(Body_CD_polyfit,JW3_CD_alpha),'--ro',LineWidth=1.5,MarkerFaceColor='r',MarkerSize=6)
xlabel('\alpha in deg')
ylabel('C_D')
legend('Exp','Aswing')
grid on
ylim([0.0 0.4])
title('JW-3: longitudinal characteristics')

% Pitching moment VS alpha
JW3_CM_alpha = [-7.66372502
-7.137948266
-5.053088728
-2.419218068
0.085560175
2.215075035
4.112699566
5.24653674
6.203452699
7.180996244
8.309619853
9.225280641
10.21687815
12.27782328];

JW3_CM = [0.224712919
0.215315364
0.173330448
0.107046814
0.015262816
-0.049507751
-0.117020849
-0.154197642
-0.181809962
-0.139236975
-0.156240823
-0.174223761
-0.186030014
-0.210482512];

% figure("Name","JW3 : CM VS ALPHA")
subplot(1,3,3)
errorbar(JW3_CM_alpha,JW3_CM,0.015*ones(1,length(JW3_CM_alpha)),'ks',MarkerFaceColor='k',MarkerSize=6)
hold on
JW3_dCM_dalpha_poly = polyfit(JW3_CM_alpha(1:6),JW3_CM(1:6),1)
plot(JW3_CM_alpha,polyval(JW3_dCM_dalpha_poly,JW3_CM_alpha),'--k',LineWidth=1.5)
leg1 = "Exp data linear fit $C_{M,\alpha} = $" + num2str(JW3_dCM_dalpha_poly(1),2);
JW3_CM_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_CL_alpha.txt",...
                                                        NumHeaderLines=3)
plot(JW3_CL_alpha,JW3_CM_alpha_asw.Var8 + ...
       body_correction*polyval(Body_CM_polyfit,JW3_CM_alpha),'ro',MarkerFaceColor='r',MarkerSize=6)
hold on
JW3_dCM_dalpha_poly_asw = polyfit(JW3_CM_alpha(1:6),JW3_CM_alpha_asw.Var8(1:6)+body_correction*polyval(Body_CM_polyfit,JW3_CM_alpha(1:6)),1)
plot(JW3_CM_alpha,polyval(JW3_dCM_dalpha_poly_asw,JW3_CM_alpha),'-.r',LineWidth=1.5)
leg2 = "Aswing data linear fit $C_{M,\alpha} = $" + num2str(JW3_dCM_dalpha_poly_asw(1),2);
xlabel('\alpha in deg')
ylabel('C_M')
legend('Exp Cm',leg1,"Aswing data",leg2,interpreter = "latex")
grid on
ylim([-0.5 0.3])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Longitudinal control rear elevator only
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


JW3_CL_delta_E_alpha = [-7.586890252
-4.827949355
-2.473936587
0.061187462
2.210411842
4.257985812
5.211454266
6.102816798
7.271548591
8.118903934
9.228504939
10.23812905
11.95261198];


JW3_CL_delta_E_CL = [-0.245651402
0.037486688
0.290876819
0.541178559
0.745083422
0.935321264
1.033333333
1.106531771
1.11001065
1.127902023
1.15086972
1.185090522
1.215299965]

JW3_CL_alpha = [-7.669722759
-7.055507386
-5.047722646
-2.425722534
0.146256732
2.305405316
4.148844913
5.198647914
6.218013102
7.249534373
8.267566519
9.182922624
10.17661087
12.12878868];

JW3_CL = [-0.086337032
-0.028516442
0.203070615
0.492478262
0.746751285
0.951661326
1.122634751
1.222452539
1.289723307
1.254872604
1.262323794
1.271767046
1.291560713
1.313531106];

figure("Name","JW3 : Longitudinal control")

S1 = 3.039;
S3 = 2.167;
body_correction = S1/S3;


subplot(1,2,1)
plot(JW3_CL_alpha,JW3_CL,'--ks',MarkerFaceColor='k',MarkerSize=6)
hold on
JW3_dCL_dalpha_poly = polyfit(JW3_CL_alpha(1:6),JW3_CL(1:6),1)
% plot(JW3_CL_alpha,polyval(JW3_dCL_dalpha_poly,JW3_CL_alpha),'--k',LineWidth=1.5)
leg1 = "Exp data linear fit $C_{L,\alpha} = $" + num2str(180*JW3_dCL_dalpha_poly(1)/pi,3);
plot(JW3_CL_delta_E_alpha,JW3_CL_delta_E_CL,'-.kv',MarkerFaceColor='k',MarkerSize=6)
hold on
JW3_CL_delta_E_CL_poly = polyfit(JW3_CL_delta_E_alpha(1:6),JW3_CL_delta_E_CL(1:6),1)
% plot(JW3_CL_delta_E_alpha,polyval(JW3_CL_delta_E_CL_poly,JW3_CL_delta_E_alpha),'-.k',LineWidth=1.5)
leg2 = "Exp data linear fit $C_{L,\alpha} = $" + num2str(180*JW3_CL_delta_E_CL_poly(1)/pi,3);
hold on 
JW3_CL_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_Elevator_H085_alpha1.txt",...
                                                        NumHeaderLines=3)
plot(JW3_CL_alpha,JW3_CL_alpha_asw.Var6 + ...
       body_correction*polyval(Body_CL_polyfit,JW3_CL_alpha),'ro',MarkerFaceColor='r',MarkerSize=6)
hold on
JW3_dCL_dalpha_poly_asw = polyfit(JW3_CL_alpha(1:6),JW3_CL_alpha_asw.Var6(1:6)+body_correction*polyval(Body_CL_polyfit,JW3_CL_alpha(1:6)),1)
% plot(JW3_CL_alpha,polyval(JW3_dCL_dalpha_poly_asw,JW3_CL_alpha),'-.r',LineWidth=1.5)

JW3_CL_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_Elevator_H080_alpha1.txt",...
                                                       NumHeaderLines=3)
hold on
plot(JW3_CL_alpha,JW3_CL_alpha_asw.Var6 + ...
       body_correction*polyval(Body_CL_polyfit,JW3_CL_alpha),'bd',MarkerFaceColor='b',MarkerSize=6)

JW3_CL_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_Elevator_H070_alpha1.txt",...
                                                       NumHeaderLines=3)
hold on
plot(JW3_CL_alpha,JW3_CL_alpha_asw.Var6 + ...
       body_correction*polyval(Body_CL_polyfit,JW3_CL_alpha),'^',MarkerFaceColor=[0 0.5 0.0],MarkerSize=6,MarkerEdgeColor=[0 0.5 0])

xlabel("\alpha in deg")
ylabel("C_L")
grid on
legend("Exp : no flap","Exp 15^\circ","15^\circ hinge 85%","15^\circ hinge 80%","15^\circ hinge 70%")



JW3_CM_delta_E_alpha = [
-7.078816772
-6.017321945
-4.95485115
-2.474234457
0.009310139
2.247626624
4.237787097
5.244074694
6.209436719
7.340452967
8.224614493
9.234155315
10.38563435
12.20753802];


JW3_CM_delta_E_CM = [0.665250676
0.659943039
0.649472534
0.617010227
0.569059315
0.498365106
0.420416206
0.377154818
0.330389707
0.287313753
0.230099283
0.169628334
0.128304242
0.060433832];


JW3_CM_alpha = [-7.66372502
-7.137948266
-5.053088728
-2.419218068
0.085560175
2.215075035
4.112699566
5.24653674
6.203452699
7.180996244
8.309619853
9.225280641
10.21687815
12.27782328];

JW3_CM = [0.224712919
0.215315364
0.173330448
0.107046814
0.015262816
-0.049507751
-0.117020849
-0.154197642
-0.181809962
-0.139236975
-0.156240823
-0.174223761
-0.186030014
-0.210482512];

subplot(1,2,2)
plot(JW3_CM_alpha,JW3_CM,'--ks',MarkerFaceColor='k',MarkerSize=6)
hold on
JW3_dCM_dalpha_poly = polyfit(JW3_CM_alpha(1:6),JW3_CM(1:6),1)
% plot(JW3_CM_alpha,polyval(JW3_dCM_dalpha_poly,JW3_CM_alpha),'--k',LineWidth=1.5)
leg1 = "Exp data linear fit $C_{M,\alpha} = $" + num2str(JW3_dCM_dalpha_poly(1),2);

plot(JW3_CM_delta_E_alpha,JW3_CM_delta_E_CM,'-.kv',MarkerFaceColor='k',MarkerSize=6)
hold on
JW3_dCM_dalpha_poly = polyfit(JW3_CM_delta_E_alpha(1:6),JW3_CM_delta_E_CM(1:6),1)
% plot(JW3_CM_delta_E_alpha,polyval(JW3_dCM_dalpha_poly,JW3_CM_delta_E_alpha),'-.k',LineWidth=1.5)
leg2 = "Exp data linear fit $C_{M,\alpha} = $" + num2str(JW3_dCM_dalpha_poly(1),2);
JW3_CM_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_Elevator_H085_alpha1.txt",...
                                                        NumHeaderLines=3)

hold on
plot(JW3_CM_alpha,JW3_CM_alpha_asw.Var8 + ...
       body_correction*polyval(Body_CM_polyfit,JW3_CM_alpha),'ro',MarkerFaceColor='r',MarkerSize=6)
hold on
JW3_dCM_dalpha_poly_asw = polyfit(JW3_CL_alpha(1:6),JW3_CM_alpha_asw.Var8(1:6)+body_correction*polyval(Body_CM_polyfit,JW3_CM_alpha(1:6)),1)
% plot(JW3_CM_alpha,polyval(JW3_dCM_dalpha_poly_asw,JW3_CM_alpha),'-.r',LineWidth=1.5)

JW3_CM_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_Elevator_H080_alpha1.txt",...
                                                        NumHeaderLines=3)

hold on
plot(JW3_CM_alpha,JW3_CM_alpha_asw.Var8 + ...
       body_correction*polyval(Body_CM_polyfit,JW3_CM_alpha),'bd',MarkerFaceColor='b',MarkerSize=6)

JW3_CM_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_Elevator_H070_alpha1.txt",...
                                                        NumHeaderLines=3)

hold on
plot(JW3_CM_alpha,JW3_CM_alpha_asw.Var8 + ...
       body_correction*polyval(Body_CM_polyfit,JW3_CM_alpha),'^',MarkerFaceColor=[0 0.5 0.0],MarkerSize=6,MarkerEdgeColor=[0 0.5 0])

xlabel("\alpha in deg")
ylabel("C_M")
grid on
legend("Exp : no flap","Exp 15^\circ","15^\circ hinge 85%","15^\circ hinge 80%","15^\circ hinge 70%")



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Longitudinal control rear and forward elevator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


JW3_CL_delta_E_alpha = [-6.996450124
-5.922674691
-4.868113664
-3.874356937
-2.96322216
-1.950808865
-0.876289647
0.115793566
1.008271774
2.103678911
3.056589527
4.069188769
5.080486389
6.047218982
7.075127767
7.964073003
9.094004091
9.96057384
10.96926822
11.89701416];


JW3_CL_delta_E_CL = [0.146538871
0.236031239
0.339403621
0.437344693
0.504969826
0.580724175
0.681292155
0.754313099
0.844124956
0.955733049
1.04543841
1.123961661
1.183102591
1.178629748
1.185126021
1.222328718
1.248029819
1.252041179
1.272417465
1.287397941];

JW3_CL_alpha = [-7.669722759
-7.055507386
-5.047722646
-2.425722534
0.146256732
2.305405316
4.148844913
5.198647914
6.218013102
7.249534373
8.267566519
9.182922624
10.17661087
12.12878868];

JW3_CL = [-0.086337032
-0.028516442
0.203070615
0.492478262
0.746751285
0.951661326
1.122634751
1.222452539
1.289723307
1.254872604
1.262323794
1.271767046
1.291560713
1.313531106];

figure("Name","JW3 : Longitudinal control : rear and forward elevator")

S1 = 3.039;
S3 = 2.167;
body_correction = S1/S3;


subplot(1,2,1)
plot(JW3_CL_alpha,JW3_CL,'--ks',MarkerFaceColor='k',MarkerSize=6)
hold on
JW3_dCL_dalpha_poly = polyfit(JW3_CL_alpha(1:6),JW3_CL(1:6),1)
% plot(JW3_CL_alpha,polyval(JW3_dCL_dalpha_poly,JW3_CL_alpha),'--k',LineWidth=1.5)
leg1 = "Exp data linear fit $C_{L,\alpha} = $" + num2str(180*JW3_dCL_dalpha_poly(1)/pi,3);
plot(JW3_CL_delta_E_alpha,JW3_CL_delta_E_CL,'-.kv',MarkerFaceColor='k',MarkerSize=6)
hold on
JW3_CL_delta_E_CL_poly = polyfit(JW3_CL_delta_E_alpha(1:6),JW3_CL_delta_E_CL(1:6),1)
% plot(JW3_CL_delta_E_alpha,polyval(JW3_CL_delta_E_CL_poly,JW3_CL_delta_E_alpha),'-.k',LineWidth=1.5)
leg2 = "Exp data linear fit $C_{L,\alpha} = $" + num2str(180*JW3_CL_delta_E_CL_poly(1)/pi,3);
hold on 
% JW3_CL_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_Elevator_H085_alpha1.txt",...
%                                                         NumHeaderLines=3)
% plot(JW3_CL_alpha,JW3_CL_alpha_asw.Var6 + ...
%        body_correction*polyval(Body_CL_polyfit,JW3_CL_alpha),'ro',MarkerFaceColor='r',MarkerSize=6)
% hold on
% JW3_dCL_dalpha_poly_asw = polyfit(JW3_CL_alpha(1:6),JW3_CL_alpha_asw.Var6(1:6)+body_correction*polyval(Body_CL_polyfit,JW3_CL_alpha(1:6)),1)
% % plot(JW3_CL_alpha,polyval(JW3_dCL_dalpha_poly_asw,JW3_CL_alpha),'-.r',LineWidth=1.5)
% 
% JW3_CL_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_Elevator_H080_alpha1.txt",...
%                                                        NumHeaderLines=3)
% hold on
% plot(JW3_CL_alpha,JW3_CL_alpha_asw.Var6 + ...
%        body_correction*polyval(Body_CL_polyfit,JW3_CL_alpha),'bd',MarkerFaceColor='b',MarkerSize=6)

JW3_CL_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_Elevator_H070_alpha2.txt",...
                                                       NumHeaderLines=3)
hold on
plot(JW3_CL_alpha,JW3_CL_alpha_asw.Var6 + ...
       body_correction*polyval(Body_CL_polyfit,JW3_CL_alpha),'^',MarkerFaceColor=[0 0.5 0.0],MarkerSize=6,MarkerEdgeColor=[0 0.5 0])

xlabel("\alpha in deg")
ylabel("C_L")
grid on
legend("Exp : no flap","Exp 15^\circ","15^\circ hinge 85%","15^\circ hinge 80%","15^\circ hinge 70%")



JW3_CM_delta_E_alpha = [-7.678418696
-4.930484494
-3.889452453
-2.866931262
-1.988625542
-0.88197595
0.0395326
1.146832837
1.964400845
2.968411184
4.160815791
5.12943104
6.119810367
7.105309855
8.176564358
9.14160106
10.18523568
11.02326647
11.92301095];


JW3_CM_delta_E_CM = [0.647144851
0.630572923
0.623513424
0.604376327
0.578139067
0.553962724
0.519182494
0.491564239
0.456629481
0.425414786
0.387594417
0.323619745
0.25451311
0.211220817
0.154284497
0.109240342
0.088413195
0.055230299
0.025582032];


JW3_CM_alpha = [-7.66372502
-7.137948266
-5.053088728
-2.419218068
0.085560175
2.215075035
4.112699566
5.24653674
6.203452699
7.180996244
8.309619853
9.225280641
10.21687815
12.27782328];

JW3_CM = [0.224712919
0.215315364
0.173330448
0.107046814
0.015262816
-0.049507751
-0.117020849
-0.154197642
-0.181809962
-0.139236975
-0.156240823
-0.174223761
-0.186030014
-0.210482512];

subplot(1,2,2)
plot(JW3_CM_alpha,JW3_CM,'--ks',MarkerFaceColor='k',MarkerSize=6)
hold on
JW3_dCM_dalpha_poly = polyfit(JW3_CM_alpha(1:6),JW3_CM(1:6),1)
% plot(JW3_CM_alpha,polyval(JW3_dCM_dalpha_poly,JW3_CM_alpha),'--k',LineWidth=1.5)
leg1 = "Exp data linear fit $C_{M,\alpha} = $" + num2str(JW3_dCM_dalpha_poly(1),2);

plot(JW3_CM_delta_E_alpha,JW3_CM_delta_E_CM,'-.kv',MarkerFaceColor='k',MarkerSize=6)
hold on
JW3_dCM_dalpha_poly = polyfit(JW3_CM_delta_E_alpha(1:6),JW3_CM_delta_E_CM(1:6),1)
% plot(JW3_CM_delta_E_alpha,polyval(JW3_dCM_dalpha_poly,JW3_CM_delta_E_alpha),'-.k',LineWidth=1.5)
leg2 = "Exp data linear fit $C_{M,\alpha} = $" + num2str(JW3_dCM_dalpha_poly(1),2);
% JW3_CM_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_Elevator_H085_alpha1.txt",...
%                                                         NumHeaderLines=3)

% hold on
% plot(JW3_CM_alpha,JW3_CM_alpha_asw.Var8 + ...
%        body_correction*polyval(Body_CM_polyfit,JW3_CM_alpha),'ro',MarkerFaceColor='r',MarkerSize=6)
% hold on
% JW3_dCM_dalpha_poly_asw = polyfit(JW3_CL_alpha(1:6),JW3_CM_alpha_asw.Var8(1:6)+body_correction*polyval(Body_CM_polyfit,JW3_CM_alpha(1:6)),1)
% % plot(JW3_CM_alpha,polyval(JW3_dCM_dalpha_poly_asw,JW3_CM_alpha),'-.r',LineWidth=1.5)
% 
% JW3_CM_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_Elevator_H080_alpha1.txt",...
%                                                         NumHeaderLines=3)
% 
% hold on
% plot(JW3_CM_alpha,JW3_CM_alpha_asw.Var8 + ...
%        body_correction*polyval(Body_CM_polyfit,JW3_CM_alpha),'bd',MarkerFaceColor='b',MarkerSize=6)

JW3_CM_alpha_asw = readtable("JW3_Aswing_simulations/JW_3_Elevator_H070_alpha2.txt",...
                                                        NumHeaderLines=3)

hold on
plot(JW3_CM_alpha,JW3_CM_alpha_asw.Var8 + ...
       body_correction*polyval(Body_CM_polyfit,JW3_CM_alpha),'^',MarkerFaceColor=[0 0.5 0.0],MarkerSize=6,MarkerEdgeColor=[0 0.5 0])

xlabel("\alpha in deg")
ylabel("C_M")
grid on
legend("Exp : no flap","Exp 15^\circ","15^\circ hinge 85%","15^\circ hinge 80%","15^\circ hinge 70%")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lateral control
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


