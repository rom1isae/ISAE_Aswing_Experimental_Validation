clear all
close all
clc




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ALPHA 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RUN ASWING SIMULATION

[status,result] = system('sh V_1.sh');
[status,result] = system('sh V_2.sh');
[status,result] = system('sh V_3.sh');
[status,result] = system('sh V_4.sh');

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
legend('V = 49.0 m/s','V = 52.5 m/s','V = 55.5 m/s','V = 57.0 m/s',Location='southeast')
xlabel('time in sec')
ylabel('tip position in m')
ylim([0.05 0.2])
xlim([0 4])
grid on
set(gca,"FontSize",14)
saveas(gcf,"LCO_alpha3",'epsc')
