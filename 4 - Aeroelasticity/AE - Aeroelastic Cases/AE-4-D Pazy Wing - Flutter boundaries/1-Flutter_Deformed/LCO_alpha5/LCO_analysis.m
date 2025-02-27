clear all
close all
clc




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ALPHA 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RUN ASWING SIMULATION

% [status,result] = system('sh V_1.sh');
[status,result] = system('sh V_2.sh');
[status,result] = system('sh V_3.sh');
% [status,result] = system('sh V_4.sh');

%%
clear all


t = [];
Ry = [];
Theta = [];

for i = 1:4
    filename = "V1_"+num2str(i)+".txt";
    data_temp = readtable(filename,NumHeaderLines=3);
    t =  [t ; data_temp.Var2];
    Ry =  [Ry ; data_temp.Var5];
    Theta =  [Theta ; data_temp.Var6];
end

alpha_3_V1_t = t;
alpha_3_V1_Ry = Ry;
alpha_3_V1_Theta = Theta;


t = [];
Ry = [];
Theta = [];

for i = 1:4
    filename = "V2_"+num2str(i)+".txt";
    data_temp = readtable(filename,NumHeaderLines=3);
    t =  [t ; data_temp.Var2];
    Ry =  [Ry ; data_temp.Var5];
    Theta =  [Theta ; data_temp.Var6];
end

alpha_3_V2_t = t;
alpha_3_V2_Ry = Ry;
alpha_3_V2_Theta = Theta;

t = [];
Ry = [];
Theta = [];

for i = 1:4
    filename = "V3_"+num2str(i)+".txt";
    data_temp = readtable(filename,NumHeaderLines=3);
    t =  [t ; data_temp.Var2];
    Ry =  [Ry ; data_temp.Var5];
    Theta =  [Theta ; data_temp.Var6];
end

alpha_3_V3_t = t;
alpha_3_V3_Ry = Ry;
alpha_3_V3_Theta = Theta;

t = [];
Ry = [];
Theta = [];

for i = 1:4
    filename = "V4_"+num2str(i)+".txt";
    data_temp = readtable(filename,NumHeaderLines=3);
    t =  [t ; data_temp.Var2];
    Ry =  [Ry ; data_temp.Var5];
    Theta =  [Theta ; data_temp.Var6];
end

alpha_3_V4_t = t;
alpha_3_V4_Ry = Ry;
alpha_3_V4_Theta = Theta;

%%
figure(1)
plot(alpha_3_V1_t,-alpha_3_V1_Ry,'r',LineWidth=1.2)
hold on
plot(alpha_3_V2_t,-alpha_3_V2_Ry,'k',LineWidth=1.2)
hold on
plot(alpha_3_V3_t,-alpha_3_V3_Ry,'b',LineWidth=1.2)
hold on
plot(alpha_3_V4_t,-alpha_3_V4_Ry,Color=[0 0.5 0],LineWidth=1.2)
hold on
legend('V = 42.0 m/s','V = 45.0.0 m/s','V = 46.0 m/s','V = 48.0 m/s',Location='southeast')
xlabel('time in sec')
ylabel('tip position in m')
ylim([0.05 0.2])
xlim([0 4])
grid on
set(gca,"FontSize",14)
saveas(gcf,"LCO_alpha5",'epsc')


%%
figure(2)
f = 31
plot(360*f*(alpha_3_V2_t(2000:3000)-alpha_3_V2_t(2500)),...
    (-alpha_3_V2_Ry(2000:3000)-mean(-alpha_3_V2_Ry(2000:3000)))/...
    max(-alpha_3_V2_Ry(2000:3000)-mean(-alpha_3_V2_Ry(2000:3000))),'-r',LineWidth=1.5)
hold on
plot(360*f*(alpha_3_V2_t(2000:3000)-alpha_3_V2_t(2500)),...
    (alpha_3_V2_Theta(2000:3000)-mean(alpha_3_V2_Theta(2000:3000)))/...
    max(alpha_3_V2_Theta(2000:3000)-mean(alpha_3_V2_Theta(2000:3000))),...
    '-.k',LineWidth=1.5)
hold on
legend('\Delta z / \Delta z_{max}','\Delta \theta / \Delta \theta_{max}')
xlabel('phase in deg')
ylabel('\Delta z / \Delta z_{max} or \Delta \theta / \Delta \theta_{max}')
xlim([0.0 1440])
% xlim([0 4])
grid on
set(gca,"FontSize",14)
saveas(gcf,"LCO_alpha_5_V1_phase_lag",'epsc')


%     max(alpha_3_V2_Theta(2000:3000)-mean(alpha_3_V2_Theta(2000:3000)))/max(100*(-alpha_3_V2_Ry(2000:3000)-mean(-alpha_3_V2_Ry(2000:3000)))/0.55)
%     max(alpha_3_V2_Theta(2000:3000))/max(100*(-alpha_3_V2_Ry(2000:3000))/0.55)

    
figure(3)
f = 31
yyaxis left
plot(360*f*(alpha_3_V2_t(2000:3000)-alpha_3_V2_t(2500)),...
    100*(-alpha_3_V2_Ry(2000:3000)-mean(-alpha_3_V2_Ry(2000:3000)))/0.55...
    ,'-r',LineWidth=1.5)
hold on
yyaxis right
plot(360*f*(alpha_3_V2_t(2000:3000)-alpha_3_V2_t(2500)),...
    (alpha_3_V2_Theta(2000:3000)-mean(alpha_3_V2_Theta(2000:3000))),...
    '-.k',LineWidth=1.5)
hold on
legend('\Delta z / \Delta z_{max}','\Delta \theta / \Delta \theta_{max}')
xlabel('phase in deg')
ylabel('\Delta z / \Delta z_{max} or \Delta \theta / \Delta \theta_{max}')
xlim([0.0 1440])
% xlim([0 4])


