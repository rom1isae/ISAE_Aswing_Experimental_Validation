clear all
close all
clc


Fig_7_34_A_data = readtable("Experimental_data/Folding_WINGTIP_7_34_A.csv",NumHeaderLines=2);
Fig_7_34_C_data = readtable("Experimental_data/Folding_WINGTIP_7_34_C.csv",NumHeaderLines=2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variation in the port coast angle with AoA and sideslip angle, at a wind
%% speed of 22 m/s and a flare angle of 20 deg. Wingtip twist = -6 degrees
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% system('sh ./Flare_20_TM6_V22_B_AM3.sh')
% system('sh ./Flare_20_TM6_V22_B_A0.sh')
% system('sh ./Flare_20_TM6_V22_B_A3.sh')
% system('sh ./Flare_20_TM6_V22_B_A6.sh')
% system('sh ./Flare_20_TM6_V22_B_A9.sh')
% system('sh ./Flare_20_TM6_V22_B_A12.sh')

%%
Flare20_V22_TM6_B_AM3 = readtable("Aswing_simulation/FFWT_Flare20_TM6_V22_B_AM3.txt",NumHeaderLines=3)
Flare20_V22_TM6_B_AM3_Phi = -Flare20_V22_TM6_B_AM3.Var5(1:18);
Flare20_V22_TM6_B_AM3_Beta = Flare20_V22_TM6_B_AM3.Var3(1:18);


Flare20_V22_TM6_B_A0 = readtable("Aswing_simulation/FFWT_Flare20_TM6_V22_B_A0.txt",NumHeaderLines=3)
Flare20_V22_TM6_B_A0_Phi = -Flare20_V22_TM6_B_A0.Var5(1:18);
Flare20_V22_TM6_B_A0_Beta = Flare20_V22_TM6_B_A0.Var3(1:18);


Flare20_V22_TM6_B_A3 = readtable("Aswing_simulation/FFWT_Flare20_TM6_V22_B_A3.txt",NumHeaderLines=3)
Flare20_V22_TM6_B_A3_Phi = -Flare20_V22_TM6_B_A3.Var5(1:19);
Flare20_V22_TM6_B_A3_Beta = Flare20_V22_TM6_B_A3.Var3(1:19);


Flare20_V22_TM6_B_A6 = readtable("Aswing_simulation/FFWT_Flare20_TM6_V22_B_A6.txt",NumHeaderLines=3)
Flare20_V22_TM6_B_A6_Phi = -Flare20_V22_TM6_B_A6.Var5(1:21);
Flare20_V22_TM6_B_A6_Beta = Flare20_V22_TM6_B_A6.Var3(1:21);


Flare20_V22_TM6_B_A9 = readtable("Aswing_simulation/FFWT_Flare20_TM6_V22_B_A9.txt",NumHeaderLines=3)
Flare20_V22_TM6_B_A9_Phi = -Flare20_V22_TM6_B_A9.Var5;
Flare20_V22_TM6_B_A9_Beta = Flare20_V22_TM6_B_A9.Var3;


Flare20_V22_TM6_B_A12 = readtable("Aswing_simulation/FFWT_Flare20_TM6_V22_B_A12.txt",NumHeaderLines=3)
Flare20_V22_TM6_B_A12_Phi = -Flare20_V22_TM6_B_A12.Var5(1:26);
Flare20_V22_TM6_B_A12_Beta = Flare20_V22_TM6_B_A12.Var3(1:26);



figure(1)
plot(Fig_7_34_A_data.Var1,Fig_7_34_A_data.Var2,'s',MarkerSize=10,...
     MarkerFaceColor=[0 0 1],MarkerEdgeColor=[0 0 1])
hold on 
plot(Fig_7_34_A_data.Var3,Fig_7_34_A_data.Var4,'o',MarkerSize=10,...
     MarkerFaceColor=[0 0.4470 0.7410],MarkerEdgeColor=[0 0.4470 0.7410])
hold on
plot(Fig_7_34_A_data.Var5,Fig_7_34_A_data.Var6,'d',MarkerSize=10,...
     MarkerFaceColor=[0.3010 0.7450 0.9330],MarkerEdgeColor=...
     [0.3010 0.7450 0.9330])

hold on
plot(Fig_7_34_A_data.Var7,Fig_7_34_A_data.Var8,'v',MarkerSize=10,...
     MarkerFaceColor=[0.9290 0.6940 0.1250],MarkerEdgeColor=...
     [0.9290 0.6940 0.1250])

hold on
plot(Fig_7_34_A_data.Var9,Fig_7_34_A_data.Var10,'^',MarkerSize=10,...
     MarkerFaceColor=[0.8500 0.3250 0.0980],MarkerEdgeColor=...
     [0.8500 0.3250 0.0980])

hold on
plot(Fig_7_34_A_data.Var11,Fig_7_34_A_data.Var12,'>',MarkerSize=10,...
     MarkerFaceColor=[0.6350 0.0780 0.1840],MarkerEdgeColor=...
     [0.6350 0.0780 0.1840])
hold on
plot(Flare20_V22_TM6_B_AM3_Beta,Flare20_V22_TM6_B_AM3_Phi,'-',MarkerSize=10,...
     Color=[0 0 1],MarkerEdgeColor=[0 0 1],LineWidth=2)
hold on
plot(Flare20_V22_TM6_B_A0_Beta,Flare20_V22_TM6_B_A0_Phi,'-',MarkerSize=10,...
     Color=[0 0.4470 0.7410],MarkerEdgeColor=[0 0.4470 0.7410],LineWidth=2)
hold on
plot(Flare20_V22_TM6_B_A3_Beta,Flare20_V22_TM6_B_A3_Phi,'-',MarkerSize=10,...
     Color=[0.3010 0.7450 0.9330],MarkerEdgeColor=...
     [0.3010 0.7450 0.9330],LineWidth=2)
hold on
plot(Flare20_V22_TM6_B_A6_Beta,Flare20_V22_TM6_B_A6_Phi,'-',MarkerSize=10,...
     Color=[0.9290 0.6940 0.1250],MarkerEdgeColor=...
     [0.9290 0.6940 0.1250],LineWidth=2)
hold on
plot(Flare20_V22_TM6_B_A9_Beta,Flare20_V22_TM6_B_A9_Phi,'-',MarkerSize=10,...
     Color=[0.8500 0.3250 0.0980],MarkerEdgeColor=...
     [0.8500 0.3250 0.0980],LineWidth=2)
hold on
plot(Flare20_V22_TM6_B_A12_Beta,Flare20_V22_TM6_B_A12_Phi,'-',MarkerSize=10,...
     Color=[0.6350 0.0780 0.1840],MarkerEdgeColor=...
     [0.6350 0.0780 0.1840],LineWidth=2)
legend('\alpha = -3^\circ','\alpha = 0^\circ','\alpha = 3^\circ',...
    '\alpha = 6^\circ','\alpha = 9^\circ','\alpha = 12^\circ',...
    Location='northwest',NumColumns=2)
grid on
xlabel('\beta in ^\circ')
ylabel('Coast angle \theta in ^\circ')
title('V = 22m/s, \vartheta = -6^\circ')
ylim([-150 150])
xlim([0 30])
set(gca, 'FontSize', 16); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variation in the port coast angle with AoA and sideslip angle, at a wind
%% speed of 22 m/s and a flare angle of 20 deg. Wingtip twist = 9 degrees
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% system('sh ./Flare_20_T9_V22_B_AM3.sh')
% system('sh ./Flare_20_T9_V22_B_A0.sh')
% system('sh ./Flare_20_T9_V22_B_A3.sh')
% system('sh ./Flare_20_T9_V22_B_A6.sh')
% system('sh ./Flare_20_T9_V22_B_A9.sh')
% system('sh ./Flare_20_T9_V22_B_A12.sh')

%%
Flare20_V22_T9_B_AM3 = readtable("Aswing_simulation/FFWT_Flare20_T9_V22_B_AM3.txt",NumHeaderLines=3)
Flare20_V22_T9_B_AM3_Phi = -Flare20_V22_T9_B_AM3.Var5;
Flare20_V22_T9_B_AM3_Beta = Flare20_V22_T9_B_AM3.Var3;


Flare20_V22_T9_B_A0 = readtable("Aswing_simulation/FFWT_Flare20_T9_V22_B_A0.txt",NumHeaderLines=3)
Flare20_V22_T9_B_A0_Phi = -Flare20_V22_T9_B_A0.Var5;
Flare20_V22_T9_B_A0_Beta = Flare20_V22_T9_B_A0.Var3;


Flare20_V22_T9_B_A3 = readtable("Aswing_simulation/FFWT_Flare20_T9_V22_B_A3.txt",NumHeaderLines=3)
Flare20_V22_T9_B_A3_Phi = -Flare20_V22_T9_B_A3.Var5(1:15);
Flare20_V22_T9_B_A3_Beta = Flare20_V22_T9_B_A3.Var3(1:15);


Flare20_V22_T9_B_A6 = readtable("Aswing_simulation/FFWT_Flare20_T9_V22_B_A6.txt",NumHeaderLines=3)
Flare20_V22_T9_B_A6_Phi = -Flare20_V22_T9_B_A6.Var5(1:15);
Flare20_V22_T9_B_A6_Beta = Flare20_V22_T9_B_A6.Var3(1:15);


Flare20_V22_T9_B_A9 = readtable("Aswing_simulation/FFWT_Flare20_T9_V22_B_A9.txt",NumHeaderLines=3)
Flare20_V22_T9_B_A9_Phi = -Flare20_V22_T9_B_A9.Var5(1:15);
Flare20_V22_T9_B_A9_Beta = Flare20_V22_T9_B_A9.Var3(1:15);


Flare20_V22_T9_B_A12 = readtable("Aswing_simulation/FFWT_Flare20_T9_V22_B_A12.txt",NumHeaderLines=3)
Flare20_V22_T9_B_A12_Phi = -Flare20_V22_T9_B_A12.Var5(1:14);
Flare20_V22_T9_B_A12_Beta = Flare20_V22_T9_B_A12.Var3(1:14);



figure(2)
plot(Fig_7_34_C_data.Var1,Fig_7_34_C_data.Var2,'s',MarkerSize=10,...
     MarkerFaceColor=[0 0 1],MarkerEdgeColor=[0 0 1])
hold on 
plot(Fig_7_34_C_data.Var3,Fig_7_34_C_data.Var4,'o',MarkerSize=10,...
     MarkerFaceColor=[0 0.4470 0.7410],MarkerEdgeColor=[0 0.4470 0.7410])
hold on
plot(Fig_7_34_C_data.Var5,Fig_7_34_C_data.Var6,'d',MarkerSize=10,...
     MarkerFaceColor=[0.3010 0.7450 0.9330],MarkerEdgeColor=...
     [0.3010 0.7450 0.9330])

hold on
plot(Fig_7_34_C_data.Var7,Fig_7_34_C_data.Var8,'v',MarkerSize=10,...
     MarkerFaceColor=[0.9290 0.6940 0.1250],MarkerEdgeColor=...
     [0.9290 0.6940 0.1250])

hold on
plot(Fig_7_34_C_data.Var9,Fig_7_34_C_data.Var10,'^',MarkerSize=10,...
     MarkerFaceColor=[0.8500 0.3250 0.0980],MarkerEdgeColor=...
     [0.8500 0.3250 0.0980])

hold on
plot(Fig_7_34_C_data.Var11,Fig_7_34_C_data.Var12,'>',MarkerSize=10,...
     MarkerFaceColor=[0.6350 0.0780 0.1840],MarkerEdgeColor=...
     [0.6350 0.0780 0.1840])
hold on
plot(Flare20_V22_T9_B_AM3_Beta,Flare20_V22_T9_B_AM3_Phi,'-',MarkerSize=10,...
     Color=[0 0 1],MarkerEdgeColor=[0 0 1],LineWidth=2)
hold on
plot(Flare20_V22_T9_B_A0_Beta,Flare20_V22_T9_B_A0_Phi,'-',MarkerSize=10,...
     Color=[0 0.4470 0.7410],MarkerEdgeColor=[0 0.4470 0.7410],LineWidth=2)
hold on
plot(Flare20_V22_T9_B_A3_Beta,Flare20_V22_T9_B_A3_Phi,'-',MarkerSize=10,...
     Color=[0.3010 0.7450 0.9330],MarkerEdgeColor=...
     [0.3010 0.7450 0.9330],LineWidth=2)
hold on
plot(Flare20_V22_T9_B_A6_Beta,Flare20_V22_T9_B_A6_Phi,'-',MarkerSize=10,...
     Color=[0.9290 0.6940 0.1250],MarkerEdgeColor=...
     [0.9290 0.6940 0.1250],LineWidth=2)
hold on
plot(Flare20_V22_T9_B_A9_Beta,Flare20_V22_T9_B_A9_Phi,'-',MarkerSize=10,...
     Color=[0.8500 0.3250 0.0980],MarkerEdgeColor=...
     [0.8500 0.3250 0.0980],LineWidth=2)
hold on
plot(Flare20_V22_T9_B_A12_Beta,Flare20_V22_T9_B_A12_Phi,'-',MarkerSize=10,...
     Color=[0.6350 0.0780 0.1840],MarkerEdgeColor=...
     [0.6350 0.0780 0.1840],LineWidth=2)
% legend('\alpha = -3^\circ','\alpha = 0^\circ','\alpha = 3^\circ',...
%     '\alpha = 6^\circ','\alpha = 9^\circ','\alpha = 12^\circ',...
%     Location='northwest',NumColumns=2)
grid on
xlabel('\beta in ^\circ')
ylabel('Coast angle \theta in ^\circ')
title('V = 22m/s, \vartheta = 9^\circ')
ylim([-150 150])
xlim([0 30])
set(gca, 'FontSize', 16); 
