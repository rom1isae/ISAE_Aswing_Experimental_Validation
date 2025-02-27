clear all
close all
clc

Fig_7_12_A_data = readtable("Experimental_data/Folding_WINGTIP_7_12_A.csv",NumHeaderLines=2);
Fig_7_12_B_data = readtable("Experimental_data/Folding_WINGTIP_7_12_B.csv",NumHeaderLines=2);
Fig_7_12_C_data = readtable("Experimental_data/Folding_WINGTIP_7_12_C.csv",NumHeaderLines=2);

Fig_7_13_data = readtable("Experimental_data/Folding_WINGTIP_7_13.csv",NumHeaderLines=2);
Fig_7_14_data = readtable("Experimental_data/Folding_WINGTIP_7_14.csv",NumHeaderLines=2);

%%
% system('sh ./Flare_10_A0.sh')
% system('sh ./Flare_10_A5.sh')
% system('sh ./Flare_10_A10.sh')
% %%
% system('sh ./Flare_20_A0.sh')
% system('sh ./Flare_20_A5.sh')
% system('sh ./Flare_20_A10.sh')
% %%
% system('sh ./Flare_30_A0.sh')
% system('sh ./Flare_30_A5.sh')
% system('sh ./Flare_30_A10.sh')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Variation in the port coast angle with velocity at three angles of 
%%  attack and three flare angles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)

Flare10_A0 = readtable("Aswing_simulation/FFWT_Flare10_A0.txt",NumHeaderLines=3)
Flare10_A0_Phi = Flare10_A0.Var5;

Flare10_A5 = readtable("Aswing_simulation/FFWT_Flare10_A5.txt",NumHeaderLines=3)
Flare10_A5_Phi = Flare10_A5.Var5;


Flare10_A10 = readtable("Aswing_simulation/FFWT_Flare10_A10.txt",NumHeaderLines=3)
Flare10_A10_Phi = Flare10_A10.Var5;




plot(Fig_7_12_A_data.Var1,Fig_7_12_A_data.Var2,'rs',MarkerSize=10,...
     MarkerFaceColor='r',LineWidth=2)
hold on
plot(Fig_7_12_A_data.Var1,Flare10_A0_Phi,'--r',MarkerSize=10,...
     MarkerFaceColor='r',LineWidth=2)
plot(Fig_7_12_A_data.Var3,Fig_7_12_A_data.Var4,'bo',MarkerSize=10,...
     MarkerFaceColor='b',LineWidth=2)
hold on
plot(Fig_7_12_A_data.Var3,Flare10_A5_Phi,'-b',MarkerSize=10,...
     MarkerFaceColor='b',LineWidth=2)
plot(Fig_7_12_A_data.Var5,Fig_7_12_A_data.Var6,'d',MarkerSize=10,...
     MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0],LineWidth=1.5)
hold on
plot(Fig_7_12_A_data.Var5,Flare10_A10_Phi,'-.',MarkerSize=10,...
     Color=[0 0.5 0],LineWidth=2)
% legend('Exp \alpha = 0^\circ','Aswing \alpha = 0^\circ','Exp \alpha = 5^\circ','Aswing \alpha = 5^\circ','Exp \alpha = 10^\circ','Aswing \alpha = 10^\circ',...
%     Location='northwest')
grid on
xlabel('air speed in m/s')
ylabel('Coast angle \theta in ^\circ')
title('\Lambda =  10^\circ flare angle')
ylim([-50 50])
xlim([10 35])
set(gca, 'FontSize', 16);


figure(2)

Flare20_A0 = readtable("Aswing_simulation/FFWT_Flare20_A0.txt",NumHeaderLines=3)
Flare20_A0_Phi = Flare20_A0.Var5;

Flare20_A5 = readtable("Aswing_simulation/FFWT_Flare20_A5.txt",NumHeaderLines=3)
Flare20_A5_Phi = Flare20_A5.Var5;


Flare20_A10 = readtable("Aswing_simulation/FFWT_Flare20_A10.txt",NumHeaderLines=3)
Flare20_A10_Phi = Flare20_A10.Var5;

plot(Fig_7_12_B_data.Var1,Fig_7_12_B_data.Var2,'rs',MarkerSize=10,...
     MarkerFaceColor='r',LineWidth=2)
hold on
plot(Fig_7_12_B_data.Var1,Flare20_A0_Phi,'--r',MarkerSize=10,...
     MarkerFaceColor='r',LineWidth=2)
hold on
plot(Fig_7_12_B_data.Var3,Fig_7_12_B_data.Var4,'bo',MarkerSize=10,...
     MarkerFaceColor='b',LineWidth=2)
hold on
plot(Fig_7_12_B_data.Var3,Flare20_A5_Phi,'-b',MarkerSize=10,...
     MarkerFaceColor='b',LineWidth=2)
hold on
plot(Fig_7_12_B_data.Var5,Fig_7_12_B_data.Var6,'d',MarkerSize=10,...
     MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0],LineWidth=2)
hold on
plot(Fig_7_12_B_data.Var5,Flare20_A10_Phi,'-.',MarkerSize=10,...
     Color=[0 0.5 0],LineWidth=2)
% legend('Exp \alpha = 0^\circ','Aswing \alpha = 0^\circ','Exp \alpha = 5^\circ','Aswing \alpha = 5^\circ','Exp \alpha = 10^\circ','Aswing \alpha = 10^\circ',...
%     Location='northwest')
grid on
xlabel('air speed in m/s')
ylabel('Coast angle \theta in ^\circ')
title('\Lambda = 20^\circ flare angle')
ylim([-50 50])
xlim([10 35])
set(gca, 'FontSize', 16); % Change 12 to your desired font size

figure(3)


Flare30_A0 = readtable("Aswing_simulation/FFWT_Flare30_A0.txt",NumHeaderLines=3)
Flare30_A0_Phi = Flare30_A0.Var5;

Flare30_A5 = readtable("Aswing_simulation/FFWT_Flare30_A5.txt",NumHeaderLines=3)
Flare30_A5_Phi = Flare30_A5.Var5;


Flare30_A10 = readtable("Aswing_simulation/FFWT_Flare30_A10.txt",NumHeaderLines=3)
Flare30_A10_Phi = Flare30_A10.Var5;

plot(Fig_7_12_C_data.Var1,Fig_7_12_C_data.Var2,'rs',MarkerSize=10,...
     MarkerFaceColor='r',LineWidth=2)
hold on
plot(Fig_7_12_C_data.Var3,Fig_7_12_C_data.Var4,'bo',MarkerSize=10,...
     MarkerFaceColor='b',LineWidth=2)
hold on
plot(Fig_7_12_C_data.Var5,Fig_7_12_C_data.Var6,'d',MarkerSize=10,...
     MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0],LineWidth=2)
hold on
plot(Fig_7_12_C_data.Var1,Flare30_A0_Phi,'--r',MarkerSize=10,...
     MarkerFaceColor='r',LineWidth=2)
hold on
plot(Fig_7_12_C_data.Var3,Flare30_A5_Phi,'-b',MarkerSize=10,...
     MarkerFaceColor='b',LineWidth=2)
hold on
plot(Fig_7_12_C_data.Var5,Flare30_A10_Phi,'-.',MarkerSize=10,...
     Color=[0 0.5 0],LineWidth=1.5)
lgd = legend('Exp \alpha = 0^\circ','Exp \alpha = 5^\circ','Exp \alpha = 10^\circ','ASW \alpha = 0^\circ','ASW \alpha = 5^\circ','ASW \alpha = 10^\circ',...
    Location='northwest')

lgd = legend;
lgd.NumColumns = 2; % Set the number of columns
grid on
xlabel('air speed in m/s')
ylabel('Coast angle \theta in ^\circ')
title('\Lambda = 30^\circ flare angle')
ylim([-50 50])
xlim([10 35])
set(gca, 'FontSize', 16); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variation in the port coast angle with AoA, at a wind speed of 22 m/s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(4)
plot(Fig_7_13_data.Var1,Fig_7_13_data.Var2,'rs',MarkerSize=10,...
     MarkerFaceColor='r',LineWidth=1.5)
hold on
plot(Fig_7_13_data.Var3,Fig_7_13_data.Var4,'bo',MarkerSize=10,...
     MarkerFaceColor='b',LineWidth=1.5)
hold on
plot(Fig_7_13_data.Var5,Fig_7_13_data.Var6,'d',MarkerSize=10,...
     MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0],LineWidth=1.5)
legend('\Lambda = 10^\circ','\Lambda = 20^\circ','\Lambda = 30^\circ',...
    Location='northwest')
grid on
xlabel('\alpha in ^\circ')
ylabel('Coast angle \theta in ^\circ')
title('V = 22m/s')
ylim([-90 75])
xlim([-20 30])
set(gca, 'FontSize', 16); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variation in the port coast angle with AoA, at a wind speed of 22 m/s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% system('sh ./Flare_10_V22.sh')
% system('sh ./Flare_20_V22.sh')
% system('sh ./Flare_30_V22.sh')

%%

Flare10_V22 = readtable("Aswing_simulation/FFWT_Flare10_V22.txt",NumHeaderLines=3)
Flare10_V22_Phi = Flare10_V22.Var5;

Flare20_V22 = readtable("Aswing_simulation/FFWT_Flare20_V22.txt",NumHeaderLines=3)
Flare20_V22_Phi = Flare20_V22.Var5;


Flare30_V22 = readtable("Aswing_simulation/FFWT_Flare30_V22.txt",NumHeaderLines=3)
Flare30_V22_Phi = Flare30_V22.Var5;

figure(4)
plot(Fig_7_13_data.Var1,Fig_7_13_data.Var2,'rs',MarkerSize=10,...
     MarkerFaceColor='r',LineWidth=2)
hold on
plot(Fig_7_13_data.Var1,Flare10_V22_Phi,'--r',MarkerSize=10,...
     MarkerFaceColor='r',LineWidth=2)
hold on
plot(Fig_7_13_data.Var3,Fig_7_13_data.Var4,'bo',MarkerSize=10,...
     MarkerFaceColor='b',LineWidth=2)
plot(Fig_7_13_data.Var3,Flare20_V22_Phi,'-b',MarkerSize=10,...
     MarkerFaceColor='b',LineWidth=2)
hold on
plot(Fig_7_13_data.Var5,Fig_7_13_data.Var6,'d',MarkerSize=10,...
     MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0],LineWidth=2)
hold on
plot(Fig_7_13_data.Var5,Flare30_V22_Phi,'-.',MarkerSize=10,...
     Color=[0 0.5 0],MarkerEdgeColor=[0 0.5 0],LineWidth=2)
legend('Exp \Lambda = 10^\circ','Aswing \Lambda = 10^\circ','Exp \Lambda = 20^\circ','Aswing \Lambda = 20^\circ','Exp \Lambda = 30^\circ','Aswing \Lambda = 30^\circ',...
    Location='northwest')
grid on
xlabel('\alpha in ^\circ')
ylabel('Coast angle \theta in ^\circ')
title('V = 22m/s')
ylim([-90 75])
xlim([-20 30])
set(gca, 'FontSize', 16); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variation in the port coast angle with AoA and sideslip angle, at a wind
%% speed of 22 m/s and a flare angle of 20 deg.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% system('sh ./Flare_20_V22_B_AM3.sh')
% system('sh ./Flare_20_V22_B_A0.sh')
% system('sh ./Flare_20_V22_B_A3.sh')
% system('sh ./Flare_20_V22_B_A6.sh')
% system('sh ./Flare_20_V22_B_A9.sh')
% system('sh ./Flare_20_V22_B_A12.sh')

%%
Flare20_V22_B_AM3 = readtable("Aswing_simulation/FFWT_Flare20_V22_B_AM3.txt",NumHeaderLines=3)
Flare20_V22_B_AM3_Phi = -Flare20_V22_B_AM3.Var5;
Flare20_V22_B_AM3_Beta = Flare20_V22_B_AM3.Var3;


Flare20_V22_B_A0 = readtable("Aswing_simulation/FFWT_Flare20_V22_B_A0.txt",NumHeaderLines=3)
Flare20_V22_B_A0_Phi = -Flare20_V22_B_A0.Var5;
Flare20_V22_B_A0_Beta = Flare20_V22_B_A0.Var3;


Flare20_V22_B_A3 = readtable("Aswing_simulation/FFWT_Flare20_V22_B_A3.txt",NumHeaderLines=3)
Flare20_V22_B_A3_Phi = -Flare20_V22_B_A3.Var5;
Flare20_V22_B_A3_Beta = Flare20_V22_B_A3.Var3;


Flare20_V22_B_A6 = readtable("Aswing_simulation/FFWT_Flare20_V22_B_A6.txt",NumHeaderLines=3)
Flare20_V22_B_A6_Phi = -Flare20_V22_B_A6.Var5;
Flare20_V22_B_A6_Beta = Flare20_V22_B_A6.Var3;


Flare20_V22_B_A9 = readtable("Aswing_simulation/FFWT_Flare20_V22_B_A9.txt",NumHeaderLines=3)
Flare20_V22_B_A9_Phi = -Flare20_V22_B_A9.Var5;
Flare20_V22_B_A9_Beta = Flare20_V22_B_A9.Var3;


Flare20_V22_B_A12 = readtable("Aswing_simulation/FFWT_Flare20_V22_B_A12.txt",NumHeaderLines=3)
Flare20_V22_B_A12_Phi = -Flare20_V22_B_A12.Var5;
Flare20_V22_B_A12_Beta = Flare20_V22_B_A12.Var3;



figure(6)
plot(Fig_7_14_data.Var1,Fig_7_14_data.Var2,'s',MarkerSize=10,...
     MarkerFaceColor=[0 0 1],MarkerEdgeColor=[0 0 1])
hold on 
plot(Fig_7_14_data.Var3,Fig_7_14_data.Var4,'o',MarkerSize=10,...
     MarkerFaceColor=[0 0.4470 0.7410],MarkerEdgeColor=[0 0.4470 0.7410])
hold on
plot(Fig_7_14_data.Var5,Fig_7_14_data.Var6,'d',MarkerSize=10,...
     MarkerFaceColor=[0.3010 0.7450 0.9330],MarkerEdgeColor=...
     [0.3010 0.7450 0.9330])

hold on
plot(Fig_7_14_data.Var7,Fig_7_14_data.Var8,'v',MarkerSize=10,...
     MarkerFaceColor=[0.9290 0.6940 0.1250],MarkerEdgeColor=...
     [0.9290 0.6940 0.1250])

hold on
plot(Fig_7_14_data.Var9,Fig_7_14_data.Var10,'^',MarkerSize=10,...
     MarkerFaceColor=[0.8500 0.3250 0.0980],MarkerEdgeColor=...
     [0.8500 0.3250 0.0980])

hold on
plot(Fig_7_14_data.Var11,Fig_7_14_data.Var12,'>',MarkerSize=10,...
     MarkerFaceColor=[0.6350 0.0780 0.1840],MarkerEdgeColor=...
     [0.6350 0.0780 0.1840])
hold on
plot(Flare20_V22_B_AM3_Beta,Flare20_V22_B_AM3_Phi,'-',MarkerSize=10,...
     Color=[0 0 1],MarkerEdgeColor=[0 0 1],LineWidth=2)
hold on
plot(Flare20_V22_B_A0_Beta,Flare20_V22_B_A0_Phi,'-',MarkerSize=10,...
     Color=[0 0.4470 0.7410],MarkerEdgeColor=[0 0.4470 0.7410],LineWidth=2)
hold on
plot(Flare20_V22_B_A3_Beta,Flare20_V22_B_A3_Phi,'-',MarkerSize=10,...
     Color=[0.3010 0.7450 0.9330],MarkerEdgeColor=...
     [0.3010 0.7450 0.9330],LineWidth=2)
hold on
plot(Flare20_V22_B_A6_Beta,Flare20_V22_B_A6_Phi,'-',MarkerSize=10,...
     Color=[0.9290 0.6940 0.1250],MarkerEdgeColor=...
     [0.9290 0.6940 0.1250],LineWidth=2)
hold on
plot(Flare20_V22_B_A9_Beta,Flare20_V22_B_A9_Phi,'-',MarkerSize=10,...
     Color=[0.8500 0.3250 0.0980],MarkerEdgeColor=...
     [0.8500 0.3250 0.0980],LineWidth=2)
hold on
plot(Flare20_V22_B_A12_Beta,Flare20_V22_B_A12_Phi,'-',MarkerSize=10,...
     Color=[0.6350 0.0780 0.1840],MarkerEdgeColor=...
     [0.6350 0.0780 0.1840],LineWidth=2)
legend('\alpha = -3^\circ','\alpha = 0^\circ','\alpha = 3^\circ',...
    '\alpha = 6^\circ','\alpha = 9^\circ','\alpha = 12^\circ',...
    Location='northwest',NumColumns=2)
grid on
xlabel('\beta in ^\circ')
ylabel('Coast angle \theta in ^\circ')
title('V = 22m/s')
ylim([-150 150])
xlim([-10 30])
set(gca, 'FontSize', 16); 
