clear all
close all
clc

%% DA4022_2B
% Static formalisme RPM CT CP Radius 
DA4022_2B.Static = [ 1326.667  0.146329  0.087607
                     1433.333  0.150878  0.089766
                     1700.000  0.152442  0.088946
                     1953.333  0.146078  0.083298
                     2210.000  0.146178  0.081402
                     2530.000  0.147843  0.080288
                     2686.667  0.147452  0.079276
                     2943.333  0.146372  0.077756
                     3256.667  0.146333  0.076829
                     3493.333  0.145205  0.075765
                     3710.000  0.147485  0.076383
                     3950.000  0.149582  0.077088
                     4200.000  0.149532  0.076649
                     4450.000  0.150186  0.076846
                     4693.333  0.150883  0.076885
                     4933.333  0.151599  0.077399
                     5183.333  0.153229  0.078077
                     5463.333  0.153899  0.078517
                     5710.000  0.154860  0.079018
                     5940.000  0.156683  0.079983 ];

% INFLOW
% 2018 RPM : J CT CP eta


DA4022_2B.Dynamic{1} = [0.304309  0.110579  0.075261  0.447105
                        0.385022  0.096197  0.070280  0.526993
                        0.468394  0.080331  0.064302  0.585157
                        0.543693  0.063328  0.055463  0.620794
                        0.647059  0.034468  0.038604  0.577723
                        0.697733  0.023081  0.031191  0.516305
                        0.788781  0.001221  0.016022  0.060102];


% 3039 RPM : J CT CP eta



DA4022_2B.Dynamic{2} = [ 0.202333  0.122440  0.074159  0.334067
                         0.254818  0.115343  0.072566  0.405031
                         0.304823  0.107865  0.070591  0.465775
                         0.358332  0.098333  0.067612  0.521145
                         0.409945  0.090740  0.065467  0.568206
                         0.479275  0.078043  0.061013  0.613059
                         0.519593  0.068232  0.056000  0.633086
                         0.571355  0.058896  0.051647  0.651545
                         0.624202  0.043611  0.042802  0.636009
                         0.674348  0.033583  0.037061  0.611067
                         0.727243  0.016881  0.025658  0.478446
                         0.776227  0.004856  0.017283  0.218126];


% 4042 RPM : J CT CP eta

DA4022_2B.Dynamic{3} = [ 0.152627  0.133145  0.075633  0.268687
                         0.189171  0.128293  0.074873  0.324143
                         0.231534  0.122225  0.073717  0.383887
                         0.270946  0.116646  0.072550  0.435626
                         0.308225  0.108695  0.069888  0.479375
                         0.346701  0.102766  0.068363  0.521174
                         0.386789  0.095499  0.065901  0.560505
                         0.425342  0.088039  0.063234  0.592196
                         0.460677  0.080979  0.060398  0.617650
                         0.505789  0.072258  0.056881  0.642520
                         0.547226  0.063421  0.052671  0.658906
                         0.584463  0.055336  0.048551  0.666151
                         0.627311  0.046117  0.043566  0.664038
                         0.664746  0.036848  0.038191  0.641358
                         0.701294  0.026518  0.031439  0.591521
                         0.753678  0.013251  0.022298  0.447873
                         0.777667  0.006249  0.017153  0.283306];



%% DA4022_3B
% Static formalisme Omega CT CP
DA4022_3B.Static = [1317.778  0.200438  0.127043
 1460.000  0.203214  0.127240
 1677.778  0.201853  0.123576
 1873.333  0.201960  0.121881
 2122.222  0.200055  0.118555
 2375.556  0.200228  0.116783
 2537.778  0.199854  0.115479
 2793.333  0.196846  0.113003
 2986.667  0.198974  0.113367
 3204.445  0.199862  0.113059
 3440.000  0.200898  0.113009
 3697.778  0.201415  0.112750
 3884.444  0.200796  0.112026
 4108.889  0.203092  0.112902
 4335.556  0.202162  0.112217
 4564.444  0.203450  0.112827
 4784.445  0.204749  0.113376
 5004.444  0.205260  0.113570
 5193.333  0.207191  0.114618
 5460.000  0.207195  0.114548];


DA4022_4B.Static = [ 1505.000  0.243484  0.161061
                     1796.667  0.240866  0.156181
                     1958.333  0.239311  0.154376
                     2225.000  0.237572  0.150464
                     2453.333  0.239441  0.149536
                     2726.667  0.237467  0.147303
                     2976.667  0.239446  0.147080
                     3203.333  0.241329  0.147320
                     3436.667  0.241883  0.147213
                     3710.000  0.241997  0.146411
                     3938.333  0.244743  0.147676
                     4188.333  0.243839  0.146685
                     4456.667  0.245067  0.147146
                     4698.333  0.246992  0.148069
                     4938.333  0.247589  0.148435];


% INFLOW
% 2034 RPM : J CT CP eta


DA4022_4B.Dynamic{1} = [0.306448  0.174728  0.133182  0.402046
                        0.384997  0.153948  0.124537  0.475918
                        0.467558  0.124802  0.109278  0.533975
                        0.538755  0.100249  0.095172  0.567497
                        0.616961  0.068499  0.075464  0.560011
                        0.700752  0.037511  0.055524  0.473407
                        0.790564  0.002484  0.031073  0.063196];





DA4022_4B.Dynamic{2} = [0.203032  0.201504  0.138079  0.296291
                        0.254553  0.187518  0.133041  0.358785
                        0.307854  0.175856  0.129446  0.418231
                        0.359122  0.161203  0.123425  0.469044
                        0.413187  0.146383  0.117130  0.516383
                        0.464567  0.132065  0.110522  0.555119
                        0.514890  0.112796  0.099892  0.581409
                        0.568108  0.094350  0.089459  0.599161
                        0.620732  0.074098  0.077088  0.596652
                        0.679355  0.050612  0.061932  0.555181
                        0.728111  0.030284  0.047842  0.460895
                        0.789371  0.003020  0.028051  0.084985
                        0.837842 -0.018690  0.011424 -1.370847];




DA4022_4B.Dynamic{3} = [ 0.156489  0.214116  0.139587  0.240042
0.193350  0.204774  0.136585  0.289878
0.232206  0.196037  0.134303  0.338948
0.271184  0.186936  0.130923  0.387208
0.309893  0.175886  0.126578  0.430611
0.347519  0.165727  0.122636  0.469629
0.387024  0.155026  0.118286  0.507235
0.427295  0.143861  0.113407  0.542037
0.465105  0.130259  0.106488  0.568928
0.503741  0.117795  0.100181  0.592305
0.545675  0.103285  0.092347  0.610306
0.585350  0.089888  0.084829  0.620253
0.624772  0.075723  0.076195  0.620903
0.661849  0.059335  0.065643  0.598243
0.705512  0.041413  0.053825  0.542823
0.745692  0.022949  0.040799  0.419451
0.783812  0.005758  0.028256  0.159730];


rho = 1.215;

J = DA4022_4B.Dynamic{1}(:,1);
CT = DA4022_4B.Dynamic{1}(:,2)
CP = DA4022_4B.Dynamic{1}(:,3)

n = 2018/60;
Omega = n*(2*pi);

D = 0.2286;
R = D/2;
Ae = pi*R^2;


Ve = J*n*D;

lambda = Ve/(Omega*R)

Fe = rho*(n^2)*(D^4)*CT;
Pe = rho*(n^3)*(D^5)*CP;
DVe = sqrt(Ve.^2+(2*Fe)/(rho*Ae))-Ve


P_RSD = -rho*Ae*(Ve+(1+5*lambda.^2).*0.5.*DVe).*(Ve+0.5*DVe).*DVe;
Pv_CDA = (1/8)*sqrt(Ve.^2 + (Omega*R).^2).*(Ve.^2+3*(Omega*R).^2);

CDA = (Pe+P_RSD)./Pv_CDA;
CDA_2000RPM = CDA;





figure(2)
plot([0; J],[0.00033; CDA],'-*r')
xlabel('advance ratio J')

ylabel('CDA')


rho = 1.215;

J = DA4022_4B.Dynamic{2}(:,1);
CT = DA4022_4B.Dynamic{2}(:,2)
CP = DA4022_4B.Dynamic{2}(:,3)

n = 3000/60;
Omega = n*(2*pi);

D = 0.2286;
R = D/2;
Ae = pi*R^2;

Ve = J*n*D;

lambda = Ve./(Omega*R)


Fe = rho*(n^2)*(D^4)*CT;
Pe = rho*(n^3)*(D^5)*CP;
DVe = sqrt(Ve.^2+(2*Fe)/(rho*Ae))-Ve



P_RSD = -rho*Ae*(Ve+(1+5*lambda.^2).*0.5.*DVe).*(Ve+0.5*DVe).*DVe;
Pv_CDA = (1/8)*sqrt(Ve.^2 + (Omega*R).^2).*(Ve.^2+3*(Omega*R).^2);




CDA = (Pe+P_RSD)./Pv_CDA;
CDA_3000RPM = CDA;
% 
figure(2)
hold on
plot([0; J],[0.00029; CDA],'-.sb')
xlabel('advance ratio J')
ylabel('CDA')


rho = 1.215;

J = DA4022_4B.Dynamic{3}(:,1);
CT = DA4022_4B.Dynamic{3}(:,2);
CP = DA4022_4B.Dynamic{3}(:,3);

n = 4042/60;
Omega = n*(2*pi);

D = 0.2286;
R = D/2;
Ae = pi*R^2;

Ve = J*n*D;

lambda = Ve./(Omega*R)

Fe = rho*(n^2)*(D^4)*CT
Pe = rho*(n^3)*(D^5)*CP;
DVe = sqrt(Ve.^2+(2*Fe)/(rho*Ae))-Ve



P_RSD = -(Ve+(1+5*lambda.^2).*0.5.*DVe).*Fe;
Pv_CDA = (1/8)*sqrt(Ve.^2 + (Omega*R).^2).*(Ve.^2+3*(Omega*R).^2);

CDA = (Pe+P_RSD)./Pv_CDA;
CDA_4000RPM = CDA

figure(2)
hold on
plot([0; J],[0.00027; CDA],'--ok')
xlabel('advance ratio J')
ylabel('CDA in m^2')
grid on
legend('2000 RMP','3000 RPM','4000 RPM')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANALYSE STATIQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% DA4022_2B :
Ve = 0.0; % static
J = 0.0;
rho = 1.215;




n = DA4022_2B.Static(:,1)/60;
Omega = n*(2*pi);
CT = DA4022_2B.Static(:,2);
CP = DA4022_2B.Static(:,3);
D = 22.86e-2;
R = D/2;
Ae = pi*R^2


Fe = rho*(n.^2)*(D^4).*CT
Pe = rho*(n.^3)*(D^5).*CP;
DVe = sqrt(Ve^2+(2*Fe)/(rho*Ae))-Ve;



P_RSD = -rho*Ae*(Ve+(1+5*J^2)*0.5*DVe).*(Ve+0.5*DVe).*DVe;
Pv_CDA = (1/8)*sqrt(Ve^2 + (Omega*R).^2).*(Ve+3*(Omega*R).^2);


DA4022_2B_CDA = (Pe+P_RSD)./Pv_CDA;

% 
figure(1)
plot(n*60,DA4022_2B_CDA/2,'-or',MarkerSize=8,MarkerFaceColor='r',linewidth = 1.5)
xlabel('n RMP')
ylabel('normalised total effective drag blade area (CDA)/B')
grid on

% DA4022_3B :
Ve = 0.0; % static
J = 0.0;
rho = 1.215;




n = DA4022_3B.Static(:,1)/60;
Omega = n*(2*pi);
CT = DA4022_3B.Static(:,2);
CP = DA4022_3B.Static(:,3);
D = 22.86e-2;
R = D/2;
Ae = pi*R^2


Fe = rho*(n.^2)*(D^4).*CT
Pe = rho*(n.^3)*(D^5).*CP;
DVe = sqrt(Ve^2+(2*Fe)/(rho*Ae))-Ve;



P_RSD = -rho*Ae*(Ve+(1+5*J^2)*0.5*DVe).*(Ve+0.5*DVe).*DVe;
Pv_CDA = (1/8)*sqrt(Ve^2 + (Omega*R).^2).*(Ve+3*(Omega*R).^2);


DA4022_3B_CDA = (Pe+P_RSD)./Pv_CDA;

% 
figure(1)
hold on
plot(n*60,DA4022_3B_CDA/3,'--*k',MarkerSize=8,MarkerFaceColor='k',linewidth = 1.5)

% DA4022_4B :
Ve = 0.0; % static
J = 0.0;
rho = 1.215;




n = DA4022_4B.Static(:,1)/60;
Omega = n*(2*pi);
CT = DA4022_4B.Static(:,2);
CP = DA4022_4B.Static(:,3);
D = 22.86e-2;
R = D/2;
Ae = pi*R^2


Fe = rho*(n.^2)*(D^4).*CT
Pe = rho*(n.^3)*(D^5).*CP;
DVe = sqrt(Ve^2+(2*Fe)/(rho*Ae))-Ve



P_RSD = -rho*Ae*(Ve+(1+5*J^2)*0.5*DVe).*(Ve+0.5*DVe).*DVe;
Pv_CDA = (1/8)*sqrt(Ve^2 + (Omega*R).^2).*(Ve+3*(Omega*R).^2);


DA4022_4B_CDA = (Pe+P_RSD)./Pv_CDA;
figure(1)
hold on
plot(n*60,DA4022_4B_CDA/4,'-.sb',MarkerSize=8,MarkerFaceColor='b',linewidth = 1.5)
xlabel('n RMP')
ylabel('(CDA)/B in m^2')
leg1 = 'DA4022 : B = 3 \epsilon_{CDA} = 16%'
leg2 = 'DA4022 : B = 3 \epsilon_{CDA} = 22%'  
legend('DA4022 : B = 2',leg1,leg2)
grid on

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analyse dynamique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


rho = 1.215;

J = DA4022_2B.Dynamic{1}(:,1);
CT = DA4022_2B.Dynamic{1}(:,2)
CP = DA4022_2B.Dynamic{1}(:,3)

n = 2018/60;
Omega = n*(2*pi);

D = 0.2286;
R = D/2;
Ae = pi*R^2;


Ve = J*n*D;

lambda = Ve/(Omega*R)

Fe = rho*(n^2)*(D^4)*CT;
Pe = rho*(n^3)*(D^5)*CP;
DVe = sqrt(Ve.^2+(2*Fe)/(rho*Ae))-Ve


P_RSD = -rho*Ae*(Ve+(1+5*lambda.^2).*0.5.*DVe).*(Ve+0.5*DVe).*DVe;
Pv_CDA = (1/8)*sqrt(Ve.^2 + (Omega*R).^2).*(Ve.^2+3*(Omega*R).^2);

CDA = (Pe+P_RSD)./Pv_CDA;
CDA_2000RPM = CDA;





figure(2)
plot([0; J],[0.0002116; CDA],'*-.r',MarkerSize=8,MarkerFaceColor='r',linewidth = 1.5)
xlabel('advance ratio J')

ylabel('CDA')


rho = 1.215;

J = DA4022_2B.Dynamic{2}(:,1);
CT = DA4022_2B.Dynamic{2}(:,2)
CP = DA4022_2B.Dynamic{2}(:,3)

n = 3000/60;
Omega = n*(2*pi);

D = 0.2286;
R = D/2;
Ae = pi*R^2;

Ve = J*n*D;

lambda = Ve./(Omega*R)


Fe = rho*(n^2)*(D^4)*CT;
Pe = rho*(n^3)*(D^5)*CP;
DVe = sqrt(Ve.^2+(2*Fe)/(rho*Ae))-Ve



P_RSD = -rho*Ae*(Ve+(1+5*lambda.^2).*0.5.*DVe).*(Ve+0.5*DVe).*DVe;
Pv_CDA = (1/8)*sqrt(Ve.^2 + (Omega*R).^2).*(Ve.^2+3*(Omega*R).^2);




CDA = (Pe+P_RSD)./Pv_CDA;
CDA_3000RPM = CDA;

figure(2)
hold on
plot([0; J],[0.000181; CDA],'-.sb',MarkerSize=8,MarkerFaceColor='b',linewidth = 1.5)
xlabel('advance ratio J')
ylabel('CDA')


rho = 1.215;

J = DA4022_2B.Dynamic{3}(:,1);
CT = DA4022_2B.Dynamic{3}(:,2);
CP = DA4022_2B.Dynamic{3}(:,3);

n = 4042/60;
Omega = n*(2*pi);

D = 0.2286;
R = D/2;
Ae = pi*R^2;

Ve = J*n*D;

lambda = Ve./(Omega*R)

Fe = rho*(n^2)*(D^4)*CT
Pe = rho*(n^3)*(D^5)*CP;
DVe = sqrt(Ve.^2+(2*Fe)/(rho*Ae))-Ve



P_RSD = -(Ve+(1+5*lambda.^2).*0.5.*DVe).*Fe;
Pv_CDA = (1/8)*sqrt(Ve.^2 + (Omega*R).^2).*(Ve.^2+3*(Omega*R).^2);

CDA = (Pe+P_RSD)./Pv_CDA;
CDA_4000RPM = CDA
% 

figure(2)
hold on
plot([0; J],[0.000169; CDA],'-.ok',MarkerSize=8,MarkerFaceColor='k',linewidth = 1.5)
xlabel('advance ratio J')
ylabel('CDA in m^2')
grid on
legend('2000 RMP','3000 RPM','4000 RPM')


rho = 1.215;

J = DA4022_4B.Dynamic{1}(:,1);
CT = DA4022_4B.Dynamic{1}(:,2)
CP = DA4022_4B.Dynamic{1}(:,3)

n = 2018/60;
Omega = n*(2*pi);

D = 0.2286;
R = D/2;
Ae = pi*R^2;


Ve = J*n*D;

lambda = Ve/(Omega*R)

Fe = rho*(n^2)*(D^4)*CT;
Pe = rho*(n^3)*(D^5)*CP;
DVe = sqrt(Ve.^2+(2*Fe)/(rho*Ae))-Ve


P_RSD = -rho*Ae*(Ve+(1+5*lambda.^2).*0.5.*DVe).*(Ve+0.5*DVe).*DVe;
Pv_CDA = (1/8)*sqrt(Ve.^2 + (Omega*R).^2).*(Ve.^2+3*(Omega*R).^2);

CDA = (Pe+P_RSD)./Pv_CDA;
CDA_2000RPM = CDA;





figure(2)
plot([0; J],[0.00033; CDA],'-*r',MarkerSize=8,linewidth = 1.5)
xlabel('advance ratio J')

ylabel('CDA')


rho = 1.215;

J = DA4022_4B.Dynamic{2}(:,1);
CT = DA4022_4B.Dynamic{2}(:,2)
CP = DA4022_4B.Dynamic{2}(:,3)

n = 3000/60;
Omega = n*(2*pi);

D = 0.2286;
R = D/2;
Ae = pi*R^2;

Ve = J*n*D;

lambda = Ve./(Omega*R)


Fe = rho*(n^2)*(D^4)*CT;
Pe = rho*(n^3)*(D^5)*CP;
DVe = sqrt(Ve.^2+(2*Fe)/(rho*Ae))-Ve



P_RSD = -rho*Ae*(Ve+(1+5*lambda.^2).*0.5.*DVe).*(Ve+0.5*DVe).*DVe;
Pv_CDA = (1/8)*sqrt(Ve.^2 + (Omega*R).^2).*(Ve.^2+3*(Omega*R).^2);




CDA = (Pe+P_RSD)./Pv_CDA;
CDA_3000RPM = CDA;
% 
figure(2)
hold on
plot([0; J],[0.00029; CDA],'-sb',MarkerSize=8,linewidth = 1.5)
xlabel('advance ratio J')
ylabel('CDA')


rho = 1.215;

J = DA4022_4B.Dynamic{3}(:,1);
CT = DA4022_4B.Dynamic{3}(:,2);
CP = DA4022_4B.Dynamic{3}(:,3);

n = 4042/60;
Omega = n*(2*pi);

D = 0.2286;
R = D/2;
Ae = pi*R^2;

Ve = J*n*D;

lambda = Ve./(Omega*R)

Fe = rho*(n^2)*(D^4)*CT
Pe = rho*(n^3)*(D^5)*CP;
DVe = sqrt(Ve.^2+(2*Fe)/(rho*Ae))-Ve



P_RSD = -(Ve+(1+5*lambda.^2).*0.5.*DVe).*Fe;
Pv_CDA = (1/8)*sqrt(Ve.^2 + (Omega*R).^2).*(Ve.^2+3*(Omega*R).^2);

CDA = (Pe+P_RSD)./Pv_CDA;
CDA_4000RPM = CDA

figure(2)
hold on
plot([0; J],[0.00027; CDA],'-ok',MarkerSize=8,linewidth = 1.5)
xlabel('advance ratio J')
ylabel('(CDA) in m^2')
grid on
set(gca,"FontSize",14)


legend('DA4022 : B = 2 : 2000 RMP','DA4022 : B = 2 : 3000 RMP','DA4022 : B = 2 : 4000 RMP','DA4022 : B = 4 : 2000 RMP','DA4022 : B = 4 : 3000 RMP','DA4022 : B = 4 : 4000 RMP')

% figure(3)
% plot(J,CT)
% 
% 
% 
% figure(4)
% plot(CP,CT,'-sk')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
swirl_on = 1.0;
ASW_CT_Pv_OFF = zeros(1,length(DA4022_2B.Static(:,1)));
ASW_CT = zeros(1,length(DA4022_2B.Static(:,1)));
for i = 1 :length(DA4022_2B.Static(:,1))
[ASW_CT_Pv_OFF(i),ASW_CP(i),ASW_eta_Pv_OFF(i),ASW_phi_Pv_OFF(i)] = Actuatir_disk(0,DA4022_2B.Static(i,1),0.114300,0E-5,DA4022_2B.Static(i,3),swirl_on);
[ASW_CT(i),ASW_CP(i),ASW_eta(i),ASW_phi(i)] = Actuatir_disk(0,DA4022_2B.Static(i,1),0.114300,16E-5,DA4022_2B.Static(i,3),swirl_on);
Eps_ASW_PV_OFF(i) = 100*abs((DA4022_2B.Static(i,2)-ASW_CT_Pv_OFF(i))/DA4022_2B.Static(i,2));
Eps_ASW(i) = 100*abs((DA4022_2B.Static(i,2)-ASW_CT(i))/DA4022_2B.Static(i,2));
end

Eps_mean_ASW = mean(Eps_ASW)
leg1 = "ASWING Pv ON: \epsilon = " + num2str(Eps_mean_ASW,2) + " %";
Eps_mean_ASW_pv_off = mean(Eps_ASW_PV_OFF)
leg2 = "ASWING Pv OFF: \epsilon = " + num2str(Eps_mean_ASW_pv_off,2) + " %";
% DA4022_2B Static 
figure(1)
Omega = DA4022_2B.Static(:,1);
CT =DA4022_2B.Static(:,2);
CP = DA4022_2B.Static(:,3);
CQ = CP/(2*pi);
CQ_ASW = CP/(2*pi);
CQ_ASW_PV_OFF =  CP/(2*pi);
phi = sqrt(2/pi)*(CT.^1.5)./(CP);
ASW_Phi = sqrt(2/pi)*(ASW_CT.^1.5)./(CP);
plot(Omega,CT,'ks',MarkerSize=8,MarkerFaceColor='k')
hold on
plot(Omega,ASW_CT,'--r',LineWidth=1.5)
hold on
plot(Omega,ASW_CT_Pv_OFF,'-b',LineWidth=1.5)
legend('Experiments',leg1,leg2)
xlabel('\Omega (RPM)')
ylabel('CT')
ylim([0.00 0.3])
set(gca,"FontSize",14)

grid on
%%
swirl_on = 1.0;
ASW_CT_Pv_OFF = zeros(1,length(DA4022_3B.Static(:,1)));
ASW_CT = zeros(1,length(DA4022_3B.Static(:,1)));
for i = 1 :length(DA4022_3B.Static(:,1))
[ASW_CT_Pv_OFF(i),ASW_CP(i),ASW_eta_Pv_OFF(i),ASW_phi_Pv_OFF(i)] = Actuatir_disk(0,DA4022_3B.Static(i,1),0.114300,0E-5,DA4022_3B.Static(i,3),swirl_on);
[ASW_CT(i),ASW_CP(i),ASW_eta(i),ASW_phi(i)] = Actuatir_disk(0,DA4022_3B.Static(i,1),0.114300,24E-5,DA4022_3B.Static(i,3),swirl_on);
Eps_ASW_PV_OFF(i) = 100*abs((DA4022_3B.Static(i,2)-ASW_CT_Pv_OFF(i))/DA4022_3B.Static(i,2));
Eps_ASW(i) = 100*abs((DA4022_3B.Static(i,2)-ASW_CT(i))/DA4022_3B.Static(i,2));
end

Eps_mean_ASW = mean(Eps_ASW)
leg1 = "ASWING Pv ON: \epsilon = " + num2str(Eps_mean_ASW,2) + " %";
Eps_mean_ASW_pv_off = mean(Eps_ASW_PV_OFF)
leg2 = "ASWING Pv OFF: \epsilon = " + num2str(Eps_mean_ASW_pv_off,2) + " %";
% DA4022_3B Static 
figure(2)
Omega = DA4022_3B.Static(:,1);
CT =DA4022_3B.Static(:,2);
CP = DA4022_3B.Static(:,3);
CQ = CP/(2*pi);
CQ_ASW = CP/(2*pi);
CQ_ASW_PV_OFF =  CP/(2*pi);
phi = sqrt(2/pi)*(CT.^1.5)./(CP);
ASW_Phi = sqrt(2/pi)*(ASW_CT.^1.5)./(CP);
plot(Omega,CT,'ks',MarkerSize=8,MarkerFaceColor='k')
hold on
plot(Omega,ASW_CT,'--r',LineWidth=1.5)
hold on
plot(Omega,ASW_CT_Pv_OFF,'-b',LineWidth=1.5)
legend('Experiments',leg1,leg2)
xlabel('\Omega (RPM)')
ylabel('CT')
ylim([0.00 0.40])
grid on
set(gca,"FontSize",14)

%%
swirl_on = 1.0;
ASW_CT_Pv_OFF = zeros(1,length(DA4022_4B.Static(:,1)));
ASW_CT = zeros(1,length(DA4022_4B.Static(:,1)));

for i = 1 :length(DA4022_4B.Static(:,1))
[ASW_CT_Pv_OFF(i),ASW_CP(i),ASW_eta_Pv_OFF(i),ASW_phi_Pv_OFF(i)] = Actuatir_disk(0,DA4022_4B.Static(i,1),0.114300,0E-5,DA4022_4B.Static(i,3),swirl_on);
[ASW_CT(i),ASW_CP(i),ASW_eta(i),ASW_phi(i)] = Actuatir_disk(0,DA4022_4B.Static(i,1),0.114300,32E-5,DA4022_4B.Static(i,3),swirl_on);
Eps_ASW_PV_OFF(i) = 100*abs((DA4022_4B.Static(i,2)-ASW_CT_Pv_OFF(i))/DA4022_4B.Static(i,2));
Eps_ASW(i) = 100*abs((DA4022_4B.Static(i,2)-ASW_CT(i))/DA4022_4B.Static(i,2));
end

Eps_mean_ASW = mean(Eps_ASW)
leg1 = "ASWING Pv ON: \epsilon = " + num2str(Eps_mean_ASW,2) + " %";
Eps_mean_ASW_pv_off = mean(Eps_ASW_PV_OFF)
leg2 = "ASWING Pv OFF: \epsilon = " + num2str(Eps_mean_ASW_pv_off,2) + " %";
% DA4022_4B Static 
figure(3)
Omega = DA4022_4B.Static(:,1);
CT =DA4022_4B.Static(:,2);
CP = DA4022_4B.Static(:,3);
CQ = CP/(2*pi);
CQ_ASW = CP/(2*pi);
CQ_ASW_PV_OFF =  CP/(2*pi);
phi = sqrt(2/pi)*(CT.^1.5)./(CP);
ASW_Phi = sqrt(2/pi)*(ASW_CT.^1.5)./(CP);
plot(Omega,CT,'ks',MarkerSize=8,MarkerFaceColor='k')
hold on
plot(Omega,ASW_CT,'--r',LineWidth=1.5)
hold on
plot(Omega,ASW_CT_Pv_OFF,'-b',LineWidth=1.5)
legend('Experiments',leg1,leg2)
xlabel('\Omega (RPM)')
ylabel('CT')
ylim([0.00 0.5])
grid on
set(gca,"FontSize",14)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANALYSE DYNAMIQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DA4022A : 4000 RPM
clear ASW_eta
Omegae_RPM = 4042
Omegae_rads = 2*pi*Omegae_RPM/60
D = 0.2286;
Re = D/2;
Ve1 = DA4022_2B.Dynamic{3}(:,1)*Omegae_RPM*2*Re/60
swirl_on = 1.0
J= DA4022_2B.Dynamic{3}(:,1);
% CDA1 = 28E-5;
% CDAEND = 5E-5;
% a1 = (CDA2-CDA1)/(J(end));
% a2 = CDA1;
% 
% CDAJ = polyval([a1 a2],J)
for i = 1 :length(Ve1)
[Dynamic.RPM1.ASW_CT(i),Dynamic.RPM1.ASW_CP(i),Dynamic.RPM1.ASW_eta(i),Dynamic.RPM1.ASW_phi(i)] = Actuatir_disk(Ve1(i),4042,Re,CDA_4000RPM(i),DA4022_2B.Dynamic{3}(i,3),swirl_on);
[CONST_INF_ASW_CT(i),Dynamic.RPM1.ASW_CP(i),Dynamic.RPM1.ASW_eta2(i),Dynamic.RPM1.ASW_phi(i)] = Actuatir_disk(Ve1(i),4042,Re,CDA_4000RPM(end),DA4022_2B.Dynamic{3}(i,3),swirl_on);
[CONST_SUP_ASW_CT(i),Dynamic.RPM1.ASW_CP(i),Dynamic.RPM1.ASW_eta3(i),Dynamic.RPM1.ASW_phi(i)] = Actuatir_disk(Ve1(i),4042,Re,CDA_4000RPM(1),DA4022_2B.Dynamic{3}(i,3),swirl_on);
ASW_eta(i) = DA4022_2B.Dynamic{3}(i,1)*Dynamic.RPM1.ASW_CT(i)/  DA4022_2B.Dynamic{3}(i,3);
CONST_ASW_ETA(i) =DA4022_2B.Dynamic{3}(i,1)*CONST_INF_ASW_CT(i)/  DA4022_2B.Dynamic{3}(i,3);
CONST_SUP_ASW_ETA(i) =DA4022_2B.Dynamic{3}(i,1)*CONST_SUP_ASW_CT(i)/  DA4022_2B.Dynamic{3}(i,3);
end
figure(4)
plot(DA4022_2B.Dynamic{3}(:,1),DA4022_2B.Dynamic{3}(:,2),'ks')
hold on
plot(DA4022_2B.Dynamic{3}(:,1),Dynamic.RPM1.ASW_CT,'--r')
hold on
plot(DA4022_2B.Dynamic{3}(:,1),CONST_INF_ASW_CT,'-b')
hold on
plot(DA4022_2B.Dynamic{3}(:,1),CONST_SUP_ASW_CT,'-.b')
hold on
grid on 
xlabel('Advance ratio \lambda = V/nD')
legend('Exp','ASWING : CDA quadratic','CDA min','CDA max')
ylabel('CT')
ylim([0 0.16])
figure(5)
% plot(DA4022_2B.Dynamic{3}(:,1),DA4022_2B.Dynamic{3}(:,1).*DA4022_2B.Dynamic{3}(:,2)./DA4022_2B.Dynamic{3}(:,3),'ks')
plot(DA4022_2B.Dynamic{3}(:,1),DA4022_2B.Dynamic{3}(:,4),'ks')
hold on
plot(DA4022_2B.Dynamic{3}(:,1),pi*Dynamic.RPM1.ASW_eta,'--r')
hold on
plot(DA4022_2B.Dynamic{3}(:,1),CONST_ASW_ETA,'-b')
hold on
plot(DA4022_2B.Dynamic{3}(:,1),CONST_SUP_ASW_ETA,'-.b')
grid on 
xlabel('Advance ratio \lambda = V/nD')
% legend('Exp','ASWING : CDA quadratic','CDA min','CDA max')
ylabel('\eta')
ylim([0 0.7])


%% DA4022A : 4000 RPM
clear ASW_eta
clear CONST_ASW_ETA
clear Dynamic.RPM1.ASW_CT
clear CONST_INF_ASW_CT
clear CONST_SUP_ASW_CT
clear CONST_SUP_ASW_ETA
Omegae_RPM = 2018
Omegae_rads = 2*pi*Omegae_RPM/60
D = 0.2286;
Re = D/2;
Ve1 = DA4022_2B.Dynamic{1}(:,1)*Omegae_RPM*2*Re/60
swirl_on = 1.0
J= DA4022_2B.Dynamic{1}(:,1);
CDA1 = 28E-5;
CDAEND = 5E-5;
a1 = (CDA2-CDA1)/(J(end));
a2 = CDA1;

CDAJ = polyval([a1 a2],J)
for i = 1 :length(Ve1)
[Dynamic.RPM1.ASW_CT(i),Dynamic.RPM1.ASW_CP(i),Dynamic.RPM1.ASW_eta(i),Dynamic.RPM1.ASW_phi(i)] = Actuatir_disk(Ve1(i),2018,Re,CDA_2000RPM(i),DA4022_2B.Dynamic{1}(i,3),swirl_on);
[CONST_INF_ASW_CT(i),Dynamic.RPM1.ASW_CP(i),Dynamic.RPM1.ASW_eta(i),Dynamic.RPM1.ASW_phi(i)] = Actuatir_disk(Ve1(i),2018,Re,CDA_2000RPM(end),DA4022_2B.Dynamic{1}(i,3),swirl_on);
[CONST_SUP_ASW_CT(i),Dynamic.RPM1.ASW_CP(i),Dynamic.RPM1.ASW_eta(i),Dynamic.RPM1.ASW_phi(i)] = Actuatir_disk(Ve1(i),2018,Re,CDA_2000RPM(1),DA4022_2B.Dynamic{1}(i,3),swirl_on);
ASW_eta(i) = DA4022_2B.Dynamic{1}(i,1)*Dynamic.RPM1.ASW_CT(i)/  DA4022_2B.Dynamic{1}(i,3);
CONST_ASW_ETA(i) =DA4022_2B.Dynamic{1}(i,1)*CONST_INF_ASW_CT(i)/  DA4022_2B.Dynamic{1}(i,3);
CONST_SUP_ASW_ETA(i) =DA4022_2B.Dynamic{1}(i,1)*CONST_SUP_ASW_CT(i)/  DA4022_2B.Dynamic{1}(i,3);
end
figure(4)
plot(DA4022_2B.Dynamic{1}(:,1),DA4022_2B.Dynamic{1}(:,2),'ks')
hold on
plot(DA4022_2B.Dynamic{1}(:,1),Dynamic.RPM1.ASW_CT,'--r')
hold on
plot(DA4022_2B.Dynamic{1}(:,1),CONST_INF_ASW_CT,'-b')
hold on
plot(DA4022_2B.Dynamic{1}(:,1),CONST_SUP_ASW_CT,'-.b')
hold on
grid on 
xlabel('Advance ratio \lambda = V/nD')
legend('Exp','ASWING : CDA quadratic','CDA min','CDA max')
ylabel('CT')
ylim([0 0.16])
figure(5)
plot(DA4022_2B.Dynamic{1}(:,1),DA4022_2B.Dynamic{1}(:,1).*DA4022_2B.Dynamic{1}(:,2)./DA4022_2B.Dynamic{1}(:,3),'ks')
hold on
plot(DA4022_2B.Dynamic{1}(:,1),ASW_eta,'--r')
hold on
plot(DA4022_2B.Dynamic{1}(:,1),CONST_ASW_ETA,'-b')
hold on
plot(DA4022_2B.Dynamic{1}(:,1),CONST_SUP_ASW_ETA,'-.b')
grid on 
xlabel('Advance ratio \lambda = V/nD')
% legend('Exp','ASWING : CDA quadratic','CDA min','CDA max')
ylabel('\eta')
ylim([0 0.7])

%% DA4022A 2 Blades : 2000 RPM CT(Lambda0) = 0.146078  ; CP(lambda0) = 0.083298
clear all
DA4022_2B.Static = [ 1326.667  0.146329  0.087607
                     1433.333  0.150878  0.089766
                     1700.000  0.152442  0.088946
                     1953.333  0.146078  0.083298
                     2210.000  0.146178  0.081402
                     2530.000  0.147843  0.080288
                     2686.667  0.147452  0.079276
                     2943.333  0.146372  0.077756
                     3256.667  0.146333  0.076829
                     3493.333  0.145205  0.075765
                     3710.000  0.147485  0.076383
                     3950.000  0.149582  0.077088
                     4200.000  0.149532  0.076649
                     4450.000  0.150186  0.076846
                     4693.333  0.150883  0.076885
                     4933.333  0.151599  0.077399
                     5183.333  0.153229  0.078077
                     5463.333  0.153899  0.078517
                     5710.000  0.154860  0.079018
                     5940.000  0.156683  0.079983 ];


DA4022_2B.Dynamic{1} = [0.304309  0.110579  0.075261  0.447105
                        0.385022  0.096197  0.070280  0.526993
                        0.468394  0.080331  0.064302  0.585157
                        0.543693  0.063328  0.055463  0.620794
                        0.647059  0.034468  0.038604  0.577723
                        0.697733  0.023081  0.031191  0.516305
                        0.788781  0.001221  0.016022  0.060102];

clear ASW_eta
Omegae_RPM = 2018
Omegae_rads = 2*pi*Omegae_RPM/60
D = 0.2286;
Re = D/2;
Ve1 = DA4022_2B.Dynamic{1}(:,1)*Omegae_RPM*2*Re/60
swirl_on = 1.0
J= DA4022_2B.Dynamic{1}(:,1);
% CDA1 = 28E-5;
% CDAEND = 5E-5;
% a1 = (CDA2-CDA1)/(J(end));
% a2 = CDA1;
% 
% CDAJ = polyval([a1 a2],J)
Ve1 = [0 ;Ve1];
CT_exp = [ 0.146078  ;DA4022_2B.Dynamic{1}(:,2)];
CP_exp = [0.083298 ;DA4022_2B.Dynamic{1}(:,3)];
J_exp = [0.0; DA4022_2B.Dynamic{1}(:,1)];
eta_exp = [0.0 ;DA4022_2B.Dynamic{1}(:,4)];

for i = 2 :length(Ve1)
CDA_reverse(i) = Find_CDA(Ve1(i),Omegae_RPM,Re,0.0002,CP_exp(i),swirl_on,CT_exp(i));
[CT_reverse(i),CP_reverse(i),eta_reverse(i),phi_reverse(i)] = Actuatir_disk(Ve1(i),Omegae_RPM,Re,CDA_reverse(i),CP_exp(i),swirl_on);
eta_reverse(i) = J_exp(i)*CT_reverse(i)/  CP_exp(i);
end

CDA_p_4B_2000 = polyfit(J_exp(2:end),CDA_reverse(2:end),2)

for i = 1 :length(Ve1) 
[CT_reverse2(i),CP_reverse2(i),eta_reverse2(i),phi_reverse2(i)] = Actuatir_disk(Ve1(i),Omegae_RPM,Re,polyval(CDA_p_4B_2000,J_exp(i)),CP_exp(i),swirl_on);
eta_reverse2(i) = J_exp(i)*CT_reverse2(i)/  CP_exp(i);
[CONST_INF_ASW_CT(i),Dynamic.RPM1.ASW_CP(i),Dynamic.RPM1.ASW_eta(i),Dynamic.RPM1.ASW_phi(i)] = Actuatir_disk(Ve1(i),Omegae_RPM,Re,polyval(CDA_p_4B_2000,0),CP_exp(i),swirl_on);
[CONST_SUP_ASW_CT(i),Dynamic.RPM1.ASW_CP(i),Dynamic.RPM1.ASW_eta(i),Dynamic.RPM1.ASW_phi(i)] = Actuatir_disk(Ve1(i),Omegae_RPM,Re,polyval(CDA_p_4B_2000,J_exp(end)),CP_exp(i),swirl_on);
CONST_ASW_ETA(i) =J_exp(i)*CONST_INF_ASW_CT(i)/  CP_exp(i);
CONST_SUP_ASW_ETA(i) =J_exp(i)*CONST_SUP_ASW_CT(i)/ CP_exp(i);
end
%%
figure(4)
plot(J_exp,CT_exp,'ks',MarkerSize=8,MarkerFaceColor='k')
hold on
plot(J_exp,CT_reverse2,'-r',LineWidth=1.5)
hold on
plot(J_exp,CONST_INF_ASW_CT,'--b',LineWidth=1.5)
hold on
plot(J_exp,CONST_SUP_ASW_CT,'-.',Color=[0 0.5 0],LineWidth=1.5)
hold on
% plot(DA4022_4B.Dynamic{3}(:,1),CT_reverse,'*g')
% hold on
% plot(DA4022_4B.Dynamic{3}(:,1),CT_reverse2,'-g')
grid on 
xlabel('Advance ratio \lambda = V/nD')

ylabel('C_T')
title('DA4022-2B : 2000 RPM')
set(gca,Fontsize=14)

figure(5)
plot(J_exp,J_exp.*CT_exp./CP_exp,'ks',MarkerSize=8,MarkerFaceColor='k')
hold on
eta_reverse2(1) = 0.0;
CONST_ASW_ETA(1) = 0.0;
CONST_SUP_ASW_ETA(1) = 0.0;
plot(J_exp,eta_reverse2,'-r',LineWidth=1.5)
hold on
plot(J_exp,CONST_ASW_ETA,'-b',LineWidth=1.5)
hold on
plot(J_exp,CONST_SUP_ASW_ETA,'-.',Color=[0 0.5 0],LineWidth=1.5)
hold on
ylim([0 0.7])
grid on 
xlabel('Advance ratio \lambda = V/nD')
% legend('Exp','ASWING : CDA quadratic','CDA min','CDA max')
ylabel('\eta')
title('DA4022-2B : 2000 RPM')
leg1 = "CDA = " + num2str(CDA_p_4B_2000(1),'%1.1e')+"\lambda^2+" + num2str(CDA_p_4B_2000(2),'%1.1e')+"\lambda+"+ num2str(CDA_p_4B_2000(3),'%1.1e')
legend('Exp',leg1,'CDA(\lambda = 0)','CDA(\lambda_{max})')

set(gca,Fontsize=14)
% plot(DA4022_4B.Dynamic{3}(:,1),eta_reverse,'*g')
% hold on



figure(6)
plot(J_exp,CDA_reverse,'b')
hold on
plot(J_exp,polyval(CDA_p_4B_2000,J_exp),'g')



%% DA4022A 2 Blades : 4000 RPM CT(Lambda0) = 0.149582 ; CP(lambda0) = 0.077088
DA4022_2B.Static = [ 1326.667  0.146329  0.087607
                     1433.333  0.150878  0.089766
                     1700.000  0.152442  0.088946
                     1953.333  0.146078  0.083298
                     2210.000  0.146178  0.081402
                     2530.000  0.147843  0.080288
                     2686.667  0.147452  0.079276
                     2943.333  0.146372  0.077756
                     3256.667  0.146333  0.076829
                     3493.333  0.145205  0.075765
                     3710.000  0.147485  0.076383
                     3950.000  0.149582  0.077088
                     4200.000  0.149532  0.076649
                     4450.000  0.150186  0.076846
                     4693.333  0.150883  0.076885
                     4933.333  0.151599  0.077399
                     5183.333  0.153229  0.078077
                     5463.333  0.153899  0.078517
                     5710.000  0.154860  0.079018
                     5940.000  0.156683  0.079983 ];


DA4022_2B.Dynamic{3} = [ 0.152627  0.133145  0.075633  0.268687
                         0.189171  0.128293  0.074873  0.324143
                         0.231534  0.122225  0.073717  0.383887
                         0.270946  0.116646  0.072550  0.435626
                         0.308225  0.108695  0.069888  0.479375
                         0.346701  0.102766  0.068363  0.521174
                         0.386789  0.095499  0.065901  0.560505
                         0.425342  0.088039  0.063234  0.592196
                         0.460677  0.080979  0.060398  0.617650
                         0.505789  0.072258  0.056881  0.642520
                         0.547226  0.063421  0.052671  0.658906
                         0.584463  0.055336  0.048551  0.666151
                         0.627311  0.046117  0.043566  0.664038
                         0.664746  0.036848  0.038191  0.641358
                         0.701294  0.026518  0.031439  0.591521
                         0.753678  0.013251  0.022298  0.447873
                         0.777667  0.006249  0.017153  0.283306];

clear ASW_eta
Omegae_RPM = 4042
Omegae_rads = 2*pi*Omegae_RPM/60
D = 0.2286;
Re = D/2;
Ve1 = DA4022_2B.Dynamic{3}(:,1)*Omegae_RPM*2*Re/60
swirl_on = 1.0
J= DA4022_2B.Dynamic{3}(:,1);
% CDA1 = 28E-5;
% CDAEND = 5E-5;
% a1 = (CDA2-CDA1)/(J(end));
% a2 = CDA1;
% 
% CDAJ = polyval([a1 a2],J)
Ve1 = [0 ;Ve1];
CT_exp = [0.149582 ;DA4022_2B.Dynamic{3}(:,2)];
CP_exp = [0.077088 ;DA4022_2B.Dynamic{3}(:,3)];
J_exp = [0.0; DA4022_2B.Dynamic{3}(:,1)];
eta_exp = [0.0 ;DA4022_2B.Dynamic{3}(:,4)];

for i = 2 :length(Ve1)
CDA_reverse(i) = Find_CDA(Ve1(i),4042,Re,0.0002,CP_exp(i),swirl_on,CT_exp(i));
[CT_reverse(i),CP_reverse(i),eta_reverse(i),phi_reverse(i)] = Actuatir_disk(Ve1(i),4042,Re,CDA_reverse(i),CP_exp(i),swirl_on);
eta_reverse(i) = J_exp(i)*CT_reverse(i)/  CP_exp(i);
end

CDA_p = polyfit(J_exp(2:end),CDA_reverse(2:end),2)
% CDA_p = CDA_p_4B_2000
for i = 1 :length(Ve1) 
[CT_reverse2(i),CP_reverse2(i),eta_reverse2(i),phi_reverse2(i)] = Actuatir_disk(Ve1(i),Omegae_RPM,Re,polyval(CDA_p,J_exp(i)),CP_exp(i),swirl_on);
eta_reverse2(i) = J_exp(i)*CT_reverse2(i)/  CP_exp(i);
[CONST_INF_ASW_CT(i),Dynamic.RPM1.ASW_CP(i),Dynamic.RPM1.ASW_eta(i),Dynamic.RPM1.ASW_phi(i)] = Actuatir_disk(Ve1(i),Omegae_RPM,Re,polyval(CDA_p,0),CP_exp(i),swirl_on);
[CONST_SUP_ASW_CT(i),Dynamic.RPM1.ASW_CP(i),Dynamic.RPM1.ASW_eta(i),Dynamic.RPM1.ASW_phi(i)] = Actuatir_disk(Ve1(i),Omegae_RPM,Re,polyval(CDA_p,J_exp(end)),CP_exp(i),swirl_on);
CONST_ASW_ETA(i) =J_exp(i)*CONST_INF_ASW_CT(i)/  CP_exp(i);
CONST_SUP_ASW_ETA(i) =J_exp(i)*CONST_SUP_ASW_CT(i)/ CP_exp(i);
end
%%
figure(7)
plot(J_exp,CT_exp,'ks',MarkerSize=8,MarkerFaceColor='k')
hold on
plot(J_exp,CT_reverse2,'-r',LineWidth=1.5)
hold on
plot(J_exp,CONST_INF_ASW_CT,'--b',LineWidth=1.5)
hold on
plot(J_exp,CONST_SUP_ASW_CT,'-.',Color=[0 0.5 0],LineWidth=1.5)
hold on
% plot(DA4022_4B.Dynamic{3}(:,1),CT_reverse,'*g')
% hold on
% plot(DA4022_4B.Dynamic{3}(:,1),CT_reverse2,'-g')
grid on 
xlabel('Advance ratio \lambda = V/nD')

ylabel('C_T')
title('DA4022-2B : 4000 RPM')
set(gca,Fontsize=14)
figure(8)
plot(J_exp,J_exp.*CT_exp./CP_exp,'ks',MarkerSize=8,MarkerFaceColor='k')
hold on
eta_reverse2(1) = 0.0;
CONST_ASW_ETA(1) = 0.0;
CONST_SUP_ASW_ETA(1) = 0.0;
plot(J_exp,eta_reverse2,'-r',linewidth=1.5)
hold on
plot(J_exp,CONST_ASW_ETA,'-b',linewidth=1.5)
hold on
plot(J_exp,CONST_SUP_ASW_ETA,'-.',Color=[0 0.5 0],linewidth=1.5)
hold on
% plot(DA4022_4B.Dynamic{3}(:,1),eta_reverse,'*g')
% hold on

grid on 
xlabel('Advance ratio \lambda = V/nD')
% legend('Exp','ASWING : CDA quadratic','CDA min','CDA max')
ylabel('\eta')
title('DA4022-2B : 4000 RPM')
ylim([0 0.7])
leg1 = "CDA = " + num2str(CDA_p(1),'%1.1e')+"\lambda^2+" + num2str(CDA_p(2),'%1.1e')+"\lambda+"+ num2str(CDA_p(3),'%1.1e')
legend('Exp',leg1,'CDA(\lambda = 0)','CDA(\lambda_{max})')
set(gca,"FontSize",14)
figure(9)
plot(J_exp,CDA_reverse,'b')
hold on
plot(J_exp,polyval(CDA_p,J_exp),'g')



%% DA4022A 4 Blades : 2000 RPM CT(Lambda0) = 0.239311  ; CP(lambda0) = 0.154376
clear all
DA4022_4B.Static = [ 1505.000  0.243484  0.161061
                     1796.667  0.240866  0.156181
                     1958.333  0.239311  0.154376
                     2225.000  0.237572  0.150464
                     2453.333  0.239441  0.149536
                     2726.667  0.237467  0.147303
                     2976.667  0.239446  0.147080
                     3203.333  0.241329  0.147320
                     3436.667  0.241883  0.147213
                     3710.000  0.241997  0.146411
                     3938.333  0.244743  0.147676
                     4188.333  0.243839  0.146685
                     4456.667  0.245067  0.147146
                     4698.333  0.246992  0.148069
                     4938.333  0.247589  0.148435];



DA4022_4B.Dynamic{1} = [0.306448  0.174728  0.133182  0.402046
                        0.384997  0.153948  0.124537  0.475918
                        0.467558  0.124802  0.109278  0.533975
                        0.538755  0.100249  0.095172  0.567497
                        0.616961  0.068499  0.075464  0.560011
                        0.700752  0.037511  0.055524  0.473407
                        0.790564  0.002484  0.031073  0.063196];

clear ASW_eta
Omegae_RPM = 2018
Omegae_rads = 2*pi*Omegae_RPM/60
D = 0.2286;
Re = D/2;
Ve1 = DA4022_4B.Dynamic{1}(:,1)*Omegae_RPM*2*Re/60
swirl_on = 1.0
J= DA4022_4B.Dynamic{1}(:,1);
% CDA1 = 28E-5;
% CDAEND = 5E-5;
% a1 = (CDA2-CDA1)/(J(end));
% a2 = CDA1;
% 
% CDAJ = polyval([a1 a2],J)
Ve1 = [0 ;Ve1];
CT_exp = [ 0.239311  ;DA4022_4B.Dynamic{1}(:,2)];
CP_exp = [0.154376 ;DA4022_4B.Dynamic{1}(:,3)];
J_exp = [0.0; DA4022_4B.Dynamic{1}(:,1)];
eta_exp = [0.0 ;DA4022_4B.Dynamic{1}(:,4)];

for i = 2 :length(Ve1)
CDA_reverse(i) = Find_CDA(Ve1(i),Omegae_RPM,Re,0.0002,CP_exp(i),swirl_on,CT_exp(i));
[CT_reverse(i),CP_reverse(i),eta_reverse(i),phi_reverse(i)] = Actuatir_disk(Ve1(i),Omegae_RPM,Re,CDA_reverse(i),CP_exp(i),swirl_on);
eta_reverse(i) = J_exp(i)*CT_reverse(i)/  CP_exp(i);
end

CDA_p_4B_2000 = polyfit(J_exp(2:end),CDA_reverse(2:end),2)

for i = 1 :length(Ve1) 
[CT_reverse2(i),CP_reverse2(i),eta_reverse2(i),phi_reverse2(i)] = Actuatir_disk(Ve1(i),Omegae_RPM,Re,polyval(CDA_p_4B_2000,J_exp(i)),CP_exp(i),swirl_on);
eta_reverse2(i) = J_exp(i)*CT_reverse2(i)/  CP_exp(i);
[CONST_INF_ASW_CT(i),Dynamic.RPM1.ASW_CP(i),Dynamic.RPM1.ASW_eta(i),Dynamic.RPM1.ASW_phi(i)] = Actuatir_disk(Ve1(i),Omegae_RPM,Re,polyval(CDA_p_4B_2000,0),CP_exp(i),swirl_on);
[CONST_SUP_ASW_CT(i),Dynamic.RPM1.ASW_CP(i),Dynamic.RPM1.ASW_eta(i),Dynamic.RPM1.ASW_phi(i)] = Actuatir_disk(Ve1(i),Omegae_RPM,Re,polyval(CDA_p_4B_2000,J_exp(end)),CP_exp(i),swirl_on);
CONST_ASW_ETA(i) =J_exp(i)*CONST_INF_ASW_CT(i)/  CP_exp(i);
CONST_SUP_ASW_ETA(i) =J_exp(i)*CONST_SUP_ASW_CT(i)/ CP_exp(i);
end
figure(4)
plot(J_exp,CT_exp,'ks',MarkerSize=8,MarkerFaceColor='k')
hold on
plot(J_exp,CT_reverse2,'-r',LineWidth=1.5)
hold on
plot(J_exp,CONST_INF_ASW_CT,'--b',LineWidth=1.5)
hold on
plot(J_exp,CONST_SUP_ASW_CT,'-.',Color=[0 0.5 0],LineWidth=1.5)
hold on
% plot(DA4022_4B.Dynamic{3}(:,1),CT_reverse,'*g')
% hold on
% plot(DA4022_4B.Dynamic{3}(:,1),CT_reverse2,'-g')
grid on 
xlabel('Advance ratio \lambda = V/nD')

ylabel('C_T')
title('DA4022-4B : 2000 RPM')
set(gca,'FontSize',14)
figure(5)
plot(J_exp,J_exp.*CT_exp./CP_exp,'ks',MarkerSize=8,MarkerFaceColor='k')
hold on
eta_reverse2(1) = 0.0;
CONST_ASW_ETA(1) = 0.0;
CONST_SUP_ASW_ETA(1) = 0.0;
plot(J_exp,eta_reverse2,'-r',LineWidth=1.5)
hold on
plot(J_exp,CONST_ASW_ETA,'-b',LineWidth=1.5)
hold on
plot(J_exp,CONST_SUP_ASW_ETA,'-.',Color=[0 0.5 0],LineWidth=1.5)
hold on
ylim([0 0.7])
% plot(DA4022_4B.Dynamic{3}(:,1),eta_reverse,'*g')
% hold on

grid on 
xlabel('Advance ratio \lambda = V/nD')
% legend('Exp','ASWING : CDA quadratic','CDA min','CDA max')
ylabel('\eta')
title('DA4022-4B : 2000 RPM')
leg1 = "CDA = " + num2str(CDA_p_4B_2000(1),'%1.1e')+"\lambda^2+" + num2str(CDA_p_4B_2000(2),'%1.1e')+"\lambda+"+ num2str(CDA_p_4B_2000(3),'%1.1e')
legend('Exp',leg1,'CDA(\lambda = 0)','CDA(\lambda_{max})')
set(gca,'FontSize',14)



figure(6)
plot(J_exp,CDA_reverse,'b')
hold on
plot(J_exp,polyval(CDA_p_4B_2000,J_exp),'g')



%% DA4022A 4 Blades : 4000 RPM CT(Lambda0) = 0.244743 ; CP(lambda0) = 0.147676
DA4022_4B.Static = [ 1505.000  0.243484  0.161061
                     1796.667  0.240866  0.156181
                     1958.333  0.239311  0.154376
                     2225.000  0.237572  0.150464
                     2453.333  0.239441  0.149536
                     2726.667  0.237467  0.147303
                     2976.667  0.239446  0.147080
                     3203.333  0.241329  0.147320
                     3436.667  0.241883  0.147213
                     3710.000  0.241997  0.146411
                     3938.333  0.244743  0.147676
                     4188.333  0.243839  0.146685
                     4456.667  0.245067  0.147146
                     4698.333  0.246992  0.148069
                     4938.333  0.247589  0.148435];


DA4022_4B.Dynamic{3} = [ 0.156489  0.214116  0.139587  0.240042
0.193350  0.204774  0.136585  0.289878
0.232206  0.196037  0.134303  0.338948
0.271184  0.186936  0.130923  0.387208
0.309893  0.175886  0.126578  0.430611
0.347519  0.165727  0.122636  0.469629
0.387024  0.155026  0.118286  0.507235
0.427295  0.143861  0.113407  0.542037
0.465105  0.130259  0.106488  0.568928
0.503741  0.117795  0.100181  0.592305
0.545675  0.103285  0.092347  0.610306
0.585350  0.089888  0.084829  0.620253
0.624772  0.075723  0.076195  0.620903
0.661849  0.059335  0.065643  0.598243
0.705512  0.041413  0.053825  0.542823
0.745692  0.022949  0.040799  0.419451
0.783812  0.005758  0.028256  0.159730];

clear ASW_eta
Omegae_RPM = 4042
Omegae_rads = 2*pi*Omegae_RPM/60
D = 0.2286;
Re = D/2;
Ve1 = DA4022_4B.Dynamic{3}(:,1)*Omegae_RPM*2*Re/60
swirl_on = 1.0
J= DA4022_4B.Dynamic{3}(:,1);
% CDA1 = 28E-5;
% CDAEND = 5E-5;
% a1 = (CDA2-CDA1)/(J(end));
% a2 = CDA1;
% 
% CDAJ = polyval([a1 a2],J)
Ve1 = [0 ;Ve1];
CT_exp = [0.244743 ;DA4022_4B.Dynamic{3}(:,2)];
CP_exp = [0.147676 ;DA4022_4B.Dynamic{3}(:,3)];
J_exp = [0.0; DA4022_4B.Dynamic{3}(:,1)];
eta_exp = [0.0 ;DA4022_4B.Dynamic{3}(:,4)];

for i = 2 :length(Ve1)
CDA_reverse(i) = Find_CDA(Ve1(i),4042,Re,0.0002,CP_exp(i),swirl_on,CT_exp(i));
[CT_reverse(i),CP_reverse(i),eta_reverse(i),phi_reverse(i)] = Actuatir_disk(Ve1(i),4042,Re,CDA_reverse(i),CP_exp(i),swirl_on);
eta_reverse(i) = J_exp(i)*CT_reverse(i)/  CP_exp(i);
end

CDA_p = polyfit(J_exp(2:end),CDA_reverse(2:end),2)
% CDA_p = CDA_p_4B_2000
for i = 1 :length(Ve1) 
[CT_reverse2(i),CP_reverse2(i),eta_reverse2(i),phi_reverse2(i)] = Actuatir_disk(Ve1(i),Omegae_RPM,Re,polyval(CDA_p,J_exp(i)),CP_exp(i),swirl_on);
eta_reverse2(i) = J_exp(i)*CT_reverse2(i)/  CP_exp(i);
[CONST_INF_ASW_CT(i),Dynamic.RPM1.ASW_CP(i),Dynamic.RPM1.ASW_eta(i),Dynamic.RPM1.ASW_phi(i)] = Actuatir_disk(Ve1(i),Omegae_RPM,Re,polyval(CDA_p,0),CP_exp(i),swirl_on);
[CONST_SUP_ASW_CT(i),Dynamic.RPM1.ASW_CP(i),Dynamic.RPM1.ASW_eta(i),Dynamic.RPM1.ASW_phi(i)] = Actuatir_disk(Ve1(i),Omegae_RPM,Re,polyval(CDA_p,J_exp(end)),CP_exp(i),swirl_on);
CONST_ASW_ETA(i) =J_exp(i)*CONST_INF_ASW_CT(i)/  CP_exp(i);
CONST_SUP_ASW_ETA(i) =J_exp(i)*CONST_SUP_ASW_CT(i)/ CP_exp(i);
end
figure(7)
plot(J_exp,CT_exp,'ks',MarkerSize=8,MarkerFaceColor='k')
hold on
plot(J_exp,CT_reverse2,'-r',LineWidth=1.5)
hold on
plot(J_exp,CONST_INF_ASW_CT,'--b',LineWidth=1.5)
hold on
plot(J_exp,CONST_SUP_ASW_CT,'-.',Color=[0 0.5 0],LineWidth=1.5)
hold on
% plot(DA4022_4B.Dynamic{3}(:,1),CT_reverse,'*g')
% hold on
% plot(DA4022_4B.Dynamic{3}(:,1),CT_reverse2,'-g')
grid on 
xlabel('Advance ratio \lambda = V/nD')

ylabel('C_T')
title('DA4022-4B : 4000 RPM')
set(gca,Fontsize = 14)

figure(8)
plot(J_exp,J_exp.*CT_exp./CP_exp,'ks',MarkerSize=8,MarkerFaceColor='k')
hold on
eta_reverse2(1) = 0.0;
CONST_ASW_ETA(1) = 0.0;
CONST_SUP_ASW_ETA(1) = 0.0;
plot(J_exp,eta_reverse2,'-r',LineWidth=1.5)
hold on
plot(J_exp,CONST_ASW_ETA,'-b',LineWidth=1.5)
hold on
plot(J_exp,CONST_SUP_ASW_ETA,'-.',Color=[0 0.5 0],LineWidth=1.5)
hold on
% plot(DA4022_4B.Dynamic{3}(:,1),eta_reverse,'*g')
% hold on

grid on 
xlabel('Advance ratio \lambda = V/nD')
% legend('Exp','ASWING : CDA quadratic','CDA min','CDA max')
ylabel('\eta')
title('DA4022-4B : 4000 RPM')
leg1 = "CDA = " + num2str(CDA_p(1),'%1.1e')+"\lambda^2+" + num2str(CDA_p(2),'%1.1e')+"\lambda+"+ num2str(CDA_p(3),'%1.1e')
legend('Exp',leg1,'CDA(\lambda = 0)','CDA(\lambda_{max})')
ylim([0 0.7])
set(gca,Fontsize = 14)
figure(9)
plot(J_exp,CDA_reverse,'b')
hold on
plot(J_exp,polyval(CDA_p,J_exp),'g')




