clear all 
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RUN simulation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

system("./JW_1_30lb_90_10.sh")

system("./JW_1_30lb_80_20.sh")

system("./JW_1_20lb_90_10.sh")

system("./JW_1_20lb_80_20.sh")

system("./JW_1_FW_30lb.sh")

system("./JW_1_FW_20lb.sh")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Comparaison
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


b = 2*40;
y = linspace(0,b/2,100)


L0_cos = pi/b;
L_cos = L0_cos*cos((pi/2)*2*y/b);


L0_ellip =  8/(pi*b);
L_ellip = L0_ellip*sqrt(1-(2*y/b).^2);

dy = y(2)-y(1);
figure(1)
plot(y,L_cos,'-r')
hold on
plot(y,L_ellip,'--b')
xlabel('y')
ylabel('lift distribution')
legend('cosinus','elliptical')
grid on


sum(dy*L_ellip)
sum(dy*L_cos)
% FW
b = 2*3.335;

y = linspace(0,b/2,25)
dy = y(2)-y(1);
L0_ellip =  8/(pi*b);
L_ellip = L0_ellip*sqrt(1-(2*y/b).^2);


[y'/y(end) 2*L_ellip'/2.295 zeros(length(L_ellip),1) zeros(length(L_ellip),1) zeros(length(L_ellip),1) zeros(length(L_ellip),1)]

b = 2*2.001;

y = linspace(0,b/2,25)
dy = y(2)-y(1);
L0_ellip =  8/(pi*b);
L_ellip = L0_ellip*sqrt(1-(2*y/b).^2);


[y'/y(end) 2*L_ellip'/2.438 zeros(length(L_ellip),1)   zeros(length(L_ellip),1) zeros(length(L_ellip),1) zeros(length(L_ellip),1)]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%











% list of index to extract the data:
% 1 - t
% 2 - (x-x0)
% 3 - y
% 4 - (z-z0)
% 5 - phi
% 6 - (tw-tw0)
% 7 - psi
% 8 - Mc'
% 9 - Ms'
% 10 - Mn'
% 11 - Fc
% 12 - Fs
% 13 - Fn
% 14 - ux
% 15 - uy
% 16 - uz
% 17 - wc
% 18 - ws
% 19 - wn
% 20 - eps
% 21 - tau
% 22 - chord
% 23 - cl
% 24 - cm
% 25 - f_aero
% 26 - f_reac
% 27 - da_eff
% 28 - a_flap



% transformation matrices

theta = 0*pi/180;
psi = -30*pi/180;
phi = 5*pi/180;



R1 = [cos(theta) 0 -sin(theta); 0 1 0; sin(theta) 0 cos(theta)];
R2 = [cos(psi) sin(psi) 0; -sin(psi) cos(psi) 0; 0 0 1];
R3 = [1 0 0; 0 cos(phi) sin(phi); 0 -sin(phi) cos(phi)];


FW_T = R1*R2*R3;
FW_T_inv = inv(FW_T);


theta = 0*pi/180;
psi = 30*pi/180;
phi = -20*pi/180;



R1 = [cos(theta) 0 -sin(theta); 0 1 0; sin(theta) 0 cos(theta)];
R2 = [cos(psi) sin(psi) 0; -sin(psi) cos(psi) 0; 0 0 1];
R3 = [1 0 0; 0 cos(phi) sin(phi); 0 -sin(phi) cos(phi)];


RW_T = R1*R2*R3;
RW_T_inv = FW_T';

%%



extract_local_distribution_data('JW_1_30lb_90_10.txt');
load("JW_1_30lb_90_10.mat");
exp_data_fig_A3 = readtable("../Exp_data/Figure_A_3.csv",NumHeaderLines=2);

inch2ft = 0.0833333;
ft2inch = 1/inch2ft;

FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;


FW_phi = beam_data{1}(:,5)*pi/180;
FW_theta = beam_data{1}(:,6)*pi/180;
FW_psi = beam_data{1}(:,7)*pi/180;

FW_Mx = zeros(1,length(FW_y));
FW_My = zeros(1,length(FW_y));
FW_Mz = zeros(1,length(FW_y));


for i = 1:length(FW_y)
    R1 = [cos(FW_theta(i)) 0 -sin(FW_theta(i)); 0 1 0; sin(FW_theta(i)) 0 cos(FW_theta(i))];
    R2 = [cos(FW_psi(i)) sin(FW_psi(i)) 0; -sin(FW_psi(i)) cos(FW_psi(i)) 0; 0 0 1];
    R3 = [1 0 0; 0 cos(FW_phi(i)) sin(FW_phi(i)); 0 -sin(FW_phi(i)) cos(FW_phi(i))];
    FW_T = R1*R2*R3;
    FW_T_inv = FW_T';
    FW_M = FW_T_inv*[FW_Mc(i) ; FW_Ms(i) ; FW_Mn(i)];
    FW_Mx(i) = FW_M(1);
    FW_My(i) = FW_M(2);
    FW_Mz(i) = FW_M(3);
end

RW_y = beam_data{2}(:,3)*ft2inch;    
RW_Mc = beam_data{2}(:,8)*ft2inch;
RW_Ms = beam_data{2}(:,9)*ft2inch;
RW_Mn = beam_data{2}(:,10)*ft2inch;


RW_phi = beam_data{2}(:,5)*pi/180;
RW_theta = beam_data{2}(:,6)*pi/180;
RW_psi = beam_data{2}(:,7)*pi/180;

RW_Mx = zeros(1,length(RW_y));
RW_My = zeros(1,length(RW_y));
RW_Mz = zeros(1,length(RW_y));

for i = 1:length(RW_y)
    R1 = [cos(RW_theta(i)) 0 -sin(RW_theta(i)); 0 1 0; sin(RW_theta(i)) 0 cos(RW_theta(i))];
    R2 = [cos(RW_psi(i)) sin(RW_psi(i)) 0; -sin(RW_psi(i)) cos(RW_psi(i)) 0; 0 0 1];
    R3 = [1 0 0; 0 cos(RW_phi(i)) sin(RW_phi(i)); 0 -sin(RW_phi(i)) cos(RW_phi(i))];
    RW_T = R1*R2*R3;
    RW_T_inv = RW_T';
    RW_M = RW_T_inv*[RW_Mc(i) ; RW_Ms(i) ; RW_Mn(i)];
    RW_Mx(i) = RW_M(1);
    RW_My(i) = RW_M(2);
    RW_Mz(i) = RW_M(3);
end




figure(1)

plot(FW_y,FW_Mx,'-r',LineWidth=1.5)
hold on
plot(RW_y,RW_Mx,'--b',LineWidth=1.5)
hold on
xlabel('y/b')
ylabel('M_c in lb.ft')
grid on
xlim([0 40])
hold on

inch2ft = 0.0833333;
exp_y = exp_data_fig_A3.Var1;
exp_Mc = exp_data_fig_A3.Var2;

exp_y2 = exp_data_fig_A3.Var5;
exp_Mc2 = exp_data_fig_A3.Var6;
plot(exp_y,exp_Mc,'sr',MarkerFaceColor='r')
hold on
plot(exp_y2,exp_Mc2,'ob',MarkerFaceColor='b')
hold on


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% JW_1_20lb_80_20lb
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

extract_local_distribution_data('JW_1_30lb_80_20.txt');
load("JW_1_30lb_80_20.mat");
exp_data_fig_A3 = readtable("../Exp_data/Figure_A_5.csv",NumHeaderLines=2);

inch2ft = 0.0833333;
ft2inch = 1/inch2ft;

FW_y = beam_data{1}(:,1)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;


FW_phi = beam_data{1}(:,5)*pi/180;
FW_theta = beam_data{1}(:,6)*pi/180;
FW_psi = beam_data{1}(:,7)*pi/180;

FW_Mx = zeros(1,length(FW_y));
FW_My = zeros(1,length(FW_y));
FW_Mz = zeros(1,length(FW_y));


for i = 1:length(FW_y)
    R1 = [cos(FW_theta(i)) 0 -sin(FW_theta(i)); 0 1 0; sin(FW_theta(i)) 0 cos(FW_theta(i))];
    R2 = [cos(FW_psi(i)) sin(FW_psi(i)) 0; -sin(FW_psi(i)) cos(FW_psi(i)) 0; 0 0 1];
    R3 = [1 0 0; 0 cos(FW_phi(i)) sin(FW_phi(i)); 0 -sin(FW_phi(i)) cos(FW_phi(i))];
    FW_T = R1*R2*R3;
    FW_T_inv = FW_T';
    FW_M = FW_T_inv*[FW_Mc(i) ; FW_Ms(i) ; FW_Mn(i)];
    FW_Mx(i) = FW_M(1);
    FW_My(i) = FW_M(2);
    FW_Mz(i) = FW_M(3);
end

RW_y = beam_data{2}(:,1)*ft2inch;    
RW_Mc = beam_data{2}(:,8)*ft2inch;
RW_Ms = beam_data{2}(:,9)*ft2inch;
RW_Mn = beam_data{2}(:,10)*ft2inch;


RW_phi = beam_data{2}(:,5)*pi/180;
RW_theta = beam_data{2}(:,6)*pi/180;
RW_psi = beam_data{2}(:,7)*pi/180;

RW_Mx = zeros(1,length(RW_y));
RW_My = zeros(1,length(RW_y));
RW_Mz = zeros(1,length(RW_y));

for i = 1:length(RW_y)
    R1 = [cos(RW_theta(i)) 0 -sin(RW_theta(i)); 0 1 0; sin(RW_theta(i)) 0 cos(RW_theta(i))];
    R2 = [cos(RW_psi(i)) sin(RW_psi(i)) 0; -sin(RW_psi(i)) cos(RW_psi(i)) 0; 0 0 1];
    R3 = [1 0 0; 0 cos(RW_phi(i)) sin(RW_phi(i)); 0 -sin(RW_phi(i)) cos(RW_phi(i))];
    RW_T = R1*R2*R3;
    RW_T_inv = RW_T';
    RW_M = RW_T_inv*[RW_Mc(i) ; RW_Ms(i) ; RW_Mn(i)];
    RW_Mx(i) = RW_M(1);
    RW_My(i) = RW_M(2);
    RW_Mz(i) = RW_M(3);
end
figure(2)
plot(FW_y/FW_y(end),FW_Mx,'-r',LineWidth=1.5)
hold on
plot(FW_y/FW_y(end),FW_Mc,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),RW_Mx,'-b',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),RW_Mc,'--b',LineWidth=1.5)

hold on
xlabel('y/b')
ylabel('M_c in lb.ft')
grid on
hold on

inch2ft = 0.0833333;
exp_y = exp_data_fig_A3.Var1;
exp_Mc = exp_data_fig_A3.Var2;

exp_y2 = exp_data_fig_A3.Var7;
exp_Mc2 = exp_data_fig_A3.Var8
plot(exp_y/exp_y(end),exp_Mc,'sr',MarkerFaceColor='r')
hold on
plot(exp_y2/exp_y(end),exp_Mc2,'ob',MarkerFaceColor='b')
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% JW_1_FW_30lb
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
extract_local_distribution_data('JW_1_FW_30lb.txt');
load("JW_1_FW_30lb.mat");
exp_data_fig_A3 = readtable("../Exp_data/Figure_A_1.csv",NumHeaderLines=2);


inch2ft = 0.0833333;
ft2inch = 1/inch2ft;

FW_y = beam_data{1}(:,1)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;


FW_phi = beam_data{1}(:,5)*pi/180;
FW_theta = beam_data{1}(:,6)*pi/180;
FW_psi = beam_data{1}(:,7)*pi/180;

FW_Mx = zeros(1,length(FW_y));
FW_My = zeros(1,length(FW_y));
FW_Mz = zeros(1,length(FW_y));


for i = 1:length(FW_y)
    R1 = [cos(FW_theta(i)) 0 -sin(FW_theta(i)); 0 1 0; sin(FW_theta(i)) 0 cos(FW_theta(i))];
    R2 = [cos(FW_psi(i)) sin(FW_psi(i)) 0; -sin(FW_psi(i)) cos(FW_psi(i)) 0; 0 0 1];
    R3 = [1 0 0; 0 cos(FW_phi(i)) sin(FW_phi(i)); 0 -sin(FW_phi(i)) cos(FW_phi(i))];
    FW_T = R1*R2*R3;
    FW_T_inv = FW_T';
    FW_M = FW_T_inv*[FW_Mc(i) ; FW_Ms(i) ; FW_Mn(i)];
    FW_Mx(i) = FW_M(1);
    FW_My(i) = FW_M(2);
    FW_Mz(i) = FW_M(3);
end

figure(3)
plot(FW_y,FW_Mx,'-r',LineWidth=1.5)
hold on
plot(FW_y,FW_Mc,'--r',LineWidth=1.5)
hold on
xlabel('y/b')
ylabel('M_c in lb.ft')
grid on
xlim([0 40])
hold on

exp_y = exp_data_fig_A3.Var1;
exp_Mc = exp_data_fig_A3.Var2;
plot(exp_y,exp_Mc,'sk',MarkerFaceColor='k')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LOAD cases comparison (highlight the advantages of joined wing)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




lbintoNm = 0.0112984833;

figure(4)
subplot(3,2,1)
extract_local_distribution_data('JW_1_FW_30lb.txt');
load("JW_1_FW_30lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;

plot(FW_y/FW_y(end),lbintoNm*FW_Mc,'-r',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_30lb_90_10.txt');
load("JW_1_30lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Mc = beam_data{2}(:,8)*ft2inch;
RW_Ms = beam_data{2}(:,9)*ft2inch;
RW_Mn = beam_data{2}(:,10)*ft2inch;

hold on
plot(FW_y/FW_y(end),lbintoNm*FW_Mc,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lbintoNm*RW_Mc,'--b',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_30lb_80_20.txt');
load("JW_1_30lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Mc = beam_data{2}(:,8)*ft2inch;
RW_Ms = beam_data{2}(:,9)*ft2inch;
RW_Mn = beam_data{2}(:,10)*ft2inch;

hold on
plot(FW_y/FW_y(end),lbintoNm*FW_Mc,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lbintoNm*RW_Mc,'-.b',LineWidth=1.5)
hold on

xlabel('y/b')
ylabel('M_c in Nm')
grid on
xlim([0 1])
ylim([-lbintoNm*10 lbintoNm*500])
title('30 lbs (13.6 kg)')




subplot(3,2,2)
extract_local_distribution_data('JW_1_FW_20lb.txt');
load("JW_1_FW_20lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;

plot(FW_y/40,lbintoNm*FW_Mc,'-r',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_20lb_90_10.txt');
load("JW_1_20lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Mc = beam_data{2}(:,8)*ft2inch;
RW_Ms = beam_data{2}(:,9)*ft2inch;
RW_Mn = beam_data{2}(:,10)*ft2inch;

hold on
plot(FW_y/40,lbintoNm*FW_Mc,'--r',LineWidth=1.5)
hold on
plot(RW_y/40,lbintoNm*RW_Mc,'--b',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_20lb_80_20.txt');
load("JW_1_20lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Mc = beam_data{2}(:,8)*ft2inch;
RW_Ms = beam_data{2}(:,9)*ft2inch;
RW_Mn = beam_data{2}(:,10)*ft2inch;

hold on
plot(FW_y/FW_y(end),lbintoNm*FW_Mc,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lbintoNm*RW_Mc,'-.b',LineWidth=1.5)
hold on

xlabel('y/b')
ylabel('M_c in Nm')
grid on
xlim([0 1])
ylim([-lbintoNm*10 lbintoNm*500])
title('20 lbs (9 kg)')
legend('Cantilever wing 100%','Forward wing: FW 90% RW 10%','Rear wing: FW 90% RW 10%','Forward wing: FW 80% RW 20%','Rear wing: FW 80% RW 20%')

subplot(3,2,3)
extract_local_distribution_data('JW_1_FW_30lb.txt');
load("JW_1_FW_30lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;

plot(FW_y/FW_y(end),lbintoNm*FW_Ms,'-r',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_30lb_90_10.txt');
load("JW_1_30lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Mc = beam_data{2}(:,8)*ft2inch;
RW_Ms = beam_data{2}(:,9)*ft2inch;
RW_Mn = beam_data{2}(:,10)*ft2inch;

hold on
plot(FW_y/FW_y(end),lbintoNm*FW_Ms,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lbintoNm*RW_Ms,'--b',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_30lb_80_20.txt');
load("JW_1_30lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Mc = beam_data{2}(:,8)*ft2inch;
RW_Ms = beam_data{2}(:,9)*ft2inch;
RW_Mn = beam_data{2}(:,10)*ft2inch;

hold on
plot(FW_y/FW_y(end),lbintoNm*FW_Ms,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lbintoNm*RW_Ms,'-.b',LineWidth=1.5)
hold on

xlabel('y/b')
ylabel('M_s in Nm')
grid on
xlim([0 1])
ylim([-lbintoNm*30 lbintoNm*40])
title('30 lbs (13.6 kg)')




subplot(3,2,4)
extract_local_distribution_data('JW_1_FW_20lb.txt');
load("JW_1_FW_20lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;

plot(FW_y/FW_y(end),lbintoNm*FW_Ms,'-r',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_20lb_90_10.txt');
load("JW_1_20lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Mc = beam_data{2}(:,8)*ft2inch;
RW_Ms = beam_data{2}(:,9)*ft2inch;
RW_Mn = beam_data{2}(:,10)*ft2inch;

hold on
plot(FW_y/FW_y(end),lbintoNm*FW_Ms,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lbintoNm*RW_Ms,'--b',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_20lb_80_20.txt');
load("JW_1_20lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Mc = beam_data{2}(:,8)*ft2inch;
RW_Ms = beam_data{2}(:,9)*ft2inch;
RW_Mn = beam_data{2}(:,10)*ft2inch;

hold on
plot(FW_y/FW_y(end),lbintoNm*FW_Ms,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lbintoNm*RW_Ms,'-.b',LineWidth=1.5)
hold on

xlabel('y/b')
ylabel('M_s in Nm')
grid on
xlim([0 1])
ylim([-lbintoNm*30 lbintoNm*40])
title('20 lbs (9 kg)')

subplot(3,2,5)
extract_local_distribution_data('JW_1_FW_30lb.txt');
load("JW_1_FW_30lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;

plot(FW_y/FW_y(end),lbintoNm*FW_Mn,'-r',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_30lb_90_10.txt');
load("JW_1_30lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Mc = beam_data{2}(:,8)*ft2inch;
RW_Ms = beam_data{2}(:,9)*ft2inch;
RW_Mn = beam_data{2}(:,10)*ft2inch;

hold on
plot(FW_y/FW_y(end),lbintoNm*FW_Mn,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lbintoNm*RW_Mn,'--b',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_30lb_80_20.txt');
load("JW_1_30lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Mc = beam_data{2}(:,8)*ft2inch;
RW_Ms = beam_data{2}(:,9)*ft2inch;
RW_Mn = beam_data{2}(:,10)*ft2inch;

hold on
plot(FW_y/FW_y(end),lbintoNm*FW_Mn,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lbintoNm*RW_Mn,'-.b',LineWidth=1.5)
hold on

xlabel('y/b')
ylabel('M_n in Nm')
grid on
xlim([0 1])
ylim([-lbintoNm*10 lbintoNm*600])
title('30 lbs  (13.6 kg)')




subplot(3,2,6)
extract_local_distribution_data('JW_1_FW_20lb.txt');
load("JW_1_FW_20lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;

plot(FW_y/FW_y(end),lbintoNm*FW_Mn,'-r',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_20lb_90_10.txt');
load("JW_1_20lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Mc = beam_data{2}(:,8)*ft2inch;
RW_Ms = beam_data{2}(:,9)*ft2inch;
RW_Mn = beam_data{2}(:,10)*ft2inch;

hold on
plot(FW_y/FW_y(end),lbintoNm*FW_Mn,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lbintoNm*RW_Mn,'--b',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_20lb_80_20.txt');
load("JW_1_20lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Mc = beam_data{1}(:,8)*ft2inch;
FW_Ms = beam_data{1}(:,9)*ft2inch;
FW_Mn = beam_data{1}(:,10)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Mc = beam_data{2}(:,8)*ft2inch;
RW_Ms = beam_data{2}(:,9)*ft2inch;
RW_Mn = beam_data{2}(:,10)*ft2inch;

hold on
plot(FW_y/FW_y(end),lbintoNm*FW_Mn,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lbintoNm*RW_Mn,'-.b',LineWidth=1.5)
hold on

xlabel('y/b')
ylabel('M_n in Nm')
grid on
xlim([0 1])
ylim([-lbintoNm*10 lbintoNm*600])
title('20 lbs (9 kg)')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Shear forces 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




lb2N = 4.4482216153;

figure(5)
subplot(3,2,1)
extract_local_distribution_data('JW_1_FW_30lb.txt');
load("JW_1_FW_30lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;

plot(FW_y/FW_y(end),lb2N*FW_Fc,'-r',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_30lb_90_10.txt');
load("JW_1_30lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Fc = beam_data{2}(:,11)*ft2inch;
RW_Fs = beam_data{2}(:,12)*ft2inch;
RW_Fn = beam_data{2}(:,13)*ft2inch;

hold on
plot(FW_y/FW_y(end),lb2N*FW_Fc,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lb2N*RW_Fc,'--b',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_30lb_80_20.txt');
load("JW_1_30lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Fc = beam_data{2}(:,11)*ft2inch;
RW_Fs = beam_data{2}(:,12)*ft2inch;
RW_Fn = beam_data{2}(:,13)*ft2inch;

hold on
plot(FW_y/FW_y(end),lb2N*FW_Fc,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lb2N*RW_Fc,'-.b',LineWidth=1.5)
hold on

xlabel('y/b')
ylabel('F_c in N')
grid on
xlim([0 1])
ylim([-1100 0])
title('30 lbs (13.6 kg)')




subplot(3,2,2)
extract_local_distribution_data('JW_1_FW_20lb.txt');
load("JW_1_FW_20lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;

plot(FW_y/FW_y(end),lb2N*FW_Fc,'-r',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_20lb_90_10.txt');
load("JW_1_20lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Fc = beam_data{2}(:,11)*ft2inch;
RW_Fs = beam_data{2}(:,12)*ft2inch;
RW_Fn = beam_data{2}(:,13)*ft2inch;

hold on
plot(FW_y/FW_y(end),lb2N*FW_Fc,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lb2N*RW_Fc,'--b',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_20lb_80_20.txt');
load("JW_1_20lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Fc = beam_data{2}(:,11)*ft2inch;
RW_Fs = beam_data{2}(:,12)*ft2inch;
RW_Fn = beam_data{2}(:,13)*ft2inch;

hold on
plot(FW_y/FW_y(end),lb2N*FW_Fc,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lb2N*RW_Fc,'-.b',LineWidth=1.5)
hold on

xlabel('y/b')
ylabel('F_c in N')
grid on
xlim([0 1])
ylim([-1100 0])
title('20 lbs (9 kg)')
legend('Cantilever wing 100%','Forward wing: FW 90% RW 10%','Rear wing: FW 90% RW 10%','Forward wing: FW 80% RW 20%','Rear wing: FW 80% RW 20%')

subplot(3,2,3)
extract_local_distribution_data('JW_1_FW_30lb.txt');
load("JW_1_FW_30lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;

plot(FW_y/FW_y(end),lb2N*FW_Fs,'-r',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_30lb_90_10.txt');
load("JW_1_30lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Fc = beam_data{2}(:,11)*ft2inch;
RW_Fs = beam_data{2}(:,12)*ft2inch;
RW_Fn = beam_data{2}(:,13)*ft2inch;

hold on
plot(FW_y/FW_y(end),lb2N*FW_Fs,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lb2N*RW_Fs,'--b',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_30lb_80_20.txt');
load("JW_1_30lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Fc = beam_data{2}(:,11)*ft2inch;
RW_Fs = beam_data{2}(:,12)*ft2inch;
RW_Fn = beam_data{2}(:,13)*ft2inch;

hold on
plot(FW_y/FW_y(end),lb2N*FW_Fs,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lb2N*RW_Fs,'-.b',LineWidth=1.5)
hold on

xlabel('y/b')
ylabel('F_s in N')
grid on
xlim([0 1])
ylim([-1200 700])
title('30 lbs (13.6 kg)')




subplot(3,2,4)
extract_local_distribution_data('JW_1_FW_20lb.txt');
load("JW_1_FW_20lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;

plot(FW_y/FW_y(end),lb2N*FW_Fs,'-r',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_20lb_90_10.txt');
load("JW_1_20lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Fc = beam_data{2}(:,11)*ft2inch;
RW_Fs = beam_data{2}(:,12)*ft2inch;
RW_Fn = beam_data{2}(:,13)*ft2inch;

hold on
plot(FW_y/FW_y(end),lb2N*FW_Fs,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lb2N*RW_Fs,'--b',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_20lb_80_20.txt');
load("JW_1_20lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Fc = beam_data{2}(:,11)*ft2inch;
RW_Fs = beam_data{2}(:,12)*ft2inch;
RW_Fn = beam_data{2}(:,13)*ft2inch;

hold on
plot(FW_y/FW_y(end),lb2N*FW_Fs,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lb2N*RW_Fs,'-.b',LineWidth=1.5)
hold on

xlabel('y/b')
ylabel('F_s in N')
grid on
xlim([0 1])
ylim([-1200 700])
title('20 lbs (9 kg)')

subplot(3,2,5)
extract_local_distribution_data('JW_1_FW_30lb.txt');
load("JW_1_FW_30lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;

plot(FW_y/FW_y(end),lb2N*FW_Fn,'-r',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_30lb_90_10.txt');
load("JW_1_30lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Fc = beam_data{2}(:,11)*ft2inch;
RW_Fs = beam_data{2}(:,12)*ft2inch;
RW_Fn = beam_data{2}(:,13)*ft2inch;

hold on
plot(FW_y/FW_y(end),lb2N*FW_Fn,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lb2N*RW_Fn,'--b',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_30lb_80_20.txt');
load("JW_1_30lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Fc = beam_data{2}(:,11)*ft2inch;
RW_Fs = beam_data{2}(:,12)*ft2inch;
RW_Fn = beam_data{2}(:,13)*ft2inch;

hold on
plot(FW_y/FW_y(end),lb2N*FW_Fn,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lb2N*RW_Fn,'-.b',LineWidth=1.5)
hold on

xlabel('y/b')
ylabel('F_n in N')
grid on
xlim([0 1])
ylim([-0 1600])
title('30 lbs  (13.6 kg)')




subplot(3,2,6)
extract_local_distribution_data('JW_1_FW_20lb.txt');
load("JW_1_FW_20lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;

plot(FW_y/FW_y(end),lb2N*FW_Fn,'-r',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_20lb_90_10.txt');
load("JW_1_20lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Fc = beam_data{2}(:,11)*ft2inch;
RW_Fs = beam_data{2}(:,12)*ft2inch;
RW_Fn = beam_data{2}(:,13)*ft2inch;

hold on
plot(FW_y/FW_y(end),lb2N*FW_Fn,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lb2N*RW_Fn,'--b',LineWidth=1.5)
hold on

extract_local_distribution_data('JW_1_20lb_80_20.txt');
load("JW_1_20lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_Fc = beam_data{1}(:,11)*ft2inch;
FW_Fs = beam_data{1}(:,12)*ft2inch;
FW_Fn = beam_data{1}(:,13)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_Fc = beam_data{2}(:,11)*ft2inch;
RW_Fs = beam_data{2}(:,12)*ft2inch;
RW_Fn = beam_data{2}(:,13)*ft2inch;

hold on
plot(FW_y/FW_y(end),lb2N*FW_Fn,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),lb2N*RW_Fn,'-.b',LineWidth=1.5)
hold on

xlabel('y/b')
ylabel('F_n in N')
grid on
xlim([0 1])
ylim([-0 1600])
title('20 lbs (9 kg)')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% shear stress / strains
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure(6)
subplot(2,2,1)

extract_local_distribution_data('JW_1_FW_30lb.txt');
load("JW_1_FW_30lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_eps = beam_data{1}(:,20)*ft2inch;
plot(FW_y/FW_y(end),FW_eps,'-r',LineWidth=1.5)
hold on
extract_local_distribution_data('JW_1_30lb_90_10.txt');
load("JW_1_30lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_eps = beam_data{1}(:,20)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_eps = beam_data{2}(:,20)*ft2inch;

hold on
plot(FW_y/FW_y(end),FW_eps,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),RW_eps,'--b',LineWidth=1.5)
hold on

hold on
extract_local_distribution_data('JW_1_30lb_80_20.txt');
load("JW_1_30lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_eps = beam_data{1}(:,20)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_eps = beam_data{2}(:,20)*ft2inch;

hold on
plot(FW_y/FW_y(end),FW_eps,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),RW_eps,'-.b',LineWidth=1.5)
hold on
grid on 
xlabel('y/b')
ylabel('\epsilon_m')

subplot(2,2,2)

extract_local_distribution_data('JW_1_FW_20lb.txt');
load("JW_1_FW_20lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_eps = beam_data{1}(:,20)*ft2inch;
plot(FW_y/FW_y(end),FW_eps,'-r',LineWidth=1.5)
hold on
extract_local_distribution_data('JW_1_20lb_90_10.txt');
load("JW_1_20lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_eps = beam_data{1}(:,20)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_eps = beam_data{2}(:,20)*ft2inch;

hold on
plot(FW_y/FW_y(end),FW_eps,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),RW_eps,'--b',LineWidth=1.5)
hold on

hold on
extract_local_distribution_data('JW_1_20lb_80_20.txt');
load("JW_1_20lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_eps = beam_data{1}(:,20)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_eps = beam_data{2}(:,20)*ft2inch;

hold on
plot(FW_y/FW_y(end),FW_eps,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),RW_eps,'-.b',LineWidth=1.5)
hold on
grid on 
xlabel('y/b')
ylabel('\epsilon_m')


subplot(2,2,3)

extract_local_distribution_data('JW_1_FW_30lb.txt');
load("JW_1_FW_30lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_tau = beam_data{1}(:,21)*ft2inch;
plot(FW_y/FW_y(end),FW_tau,'-r',LineWidth=1.5)
hold on
extract_local_distribution_data('JW_1_30lb_90_10.txt');
load("JW_1_30lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_tau = beam_data{1}(:,21)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_tau = beam_data{2}(:,21)*ft2inch;

hold on
plot(FW_y/FW_y(end),FW_tau,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),RW_tau,'--b',LineWidth=1.5)
hold on

hold on
extract_local_distribution_data('JW_1_30lb_80_20.txt');
load("JW_1_30lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_tau = beam_data{1}(:,21)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_tau = beam_data{2}(:,21)*ft2inch;

hold on
plot(FW_y/FW_y(end),FW_tau,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),RW_tau,'-.b',LineWidth=1.5)
hold on
grid on 
xlabel('y/b')
ylabel('\tau_m')

subplot(2,2,4)

extract_local_distribution_data('JW_1_FW_20lb.txt');
load("JW_1_FW_20lb.mat")
FW_y = beam_data{1}(:,3)*ft2inch;
FW_tau = beam_data{1}(:,21)*ft2inch;
plot(FW_y/FW_y(end),FW_tau,'-r',LineWidth=1.5)
hold on
extract_local_distribution_data('JW_1_20lb_90_10.txt');
load("JW_1_20lb_90_10.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_tau = beam_data{1}(:,21)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_tau = beam_data{2}(:,21)*ft2inch;

hold on
plot(FW_y/FW_y(end),FW_tau,'--r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),RW_tau,'--b',LineWidth=1.5)
hold on

hold on
extract_local_distribution_data('JW_1_20lb_80_20.txt');
load("JW_1_20lb_80_20.mat");
FW_y = beam_data{1}(:,3)*ft2inch;
FW_tau = beam_data{1}(:,21)*ft2inch;
RW_y = beam_data{2}(:,3)*ft2inch;
RW_tau = beam_data{2}(:,21)*ft2inch;

hold on
plot(FW_y/FW_y(end),FW_tau,'-.r',LineWidth=1.5)
hold on
plot(RW_y/FW_y(end),RW_tau,'-.b',LineWidth=1.5)
hold on
grid on 
xlabel('y/b')
ylabel('\tau_m')