clear all
close all
clc

tic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RUN aswing script
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 

system('sh ./divergence_speed.sh')
system('sh ./alpha_0.sh')
system('sh ./alpha_0_25.sh')
system('sh ./alpha_0_5.sh')
system('sh ./alpha_1.sh')
system('sh ./alpha_2.sh')
system('sh ./alpha_2_5.sh')
system('sh ./alpha_3.sh')
system('sh ./alpha_4.sh')
system('sh ./alpha_5.sh')
system('sh ./alpha_6.sh')
system('sh ./alpha_7.sh')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FLUTTER DETECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


[alpha_0_V1,alpha_0_V2,alpha_0_f1,alpha_0_f2] = ...
                                    find_flutter_speeds('alpha_0_eig.txt');

[alpha_0_25_V1,alpha_0_25_V2,alpha_0_25_f1,alpha_0_25_f2] = ...
                                 find_flutter_speeds('alpha_0_25_eig.txt');

[alpha_0_5_V1,alpha_0_5_V2,alpha_0_5_f1,alpha_0_5_f2] = ...
                                  find_flutter_speeds('alpha_0_5_eig.txt');


[alpha_1_V1,alpha_1_V2,alpha_1_f1,alpha_1_f2] = ...
                                    find_flutter_speeds('alpha_1_eig.txt');

[alpha_2_V1,alpha_2_V2,alpha_2_f1,alpha_2_f2] = ...
                                    find_flutter_speeds('alpha_2_eig.txt');

[alpha_2_5_V1,alpha_2_5_V2,alpha_2_5_f1,alpha_2_5_f2] = ...
                                  find_flutter_speeds('alpha_2_5_eig.txt');

[alpha_3_V1,alpha_3_V2,alpha_3_f1,alpha_3_f2] = ...
                                    find_flutter_speeds('alpha_3_eig.txt');

[alpha_4_V1,alpha_4_V2,alpha_4_f1,alpha_4_f2] = ...
                                    find_flutter_speeds('alpha_4_eig.txt');

[alpha_5_V1,alpha_5_V2,alpha_5_f1,alpha_5_f2] = ...
                                    find_flutter_speeds('alpha_5_eig.txt');

[alpha_6_V1,alpha_6_V2,alpha_6_f1,alpha_6_f2] = ...
                                    find_flutter_speeds('alpha_6_eig.txt');

[alpha_7_V1,alpha_7_V2,alpha_7_f1,alpha_7_f2] = ...
                                    find_flutter_speeds('alpha_7_eig.txt');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PLOTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% flutter speed
figure(1)
plot([alpha_0_V1 alpha_0_25_V1 alpha_0_5_V1 ...
    alpha_1_V1 alpha_2_V1 alpha_2_5_V1 alpha_3_V1 alpha_4_V1 alpha_5_V1 ...
    alpha_6_V1 alpha_7_V1],[0 0.25 0.5 1 2 2.5 3 4 5 6 7],'--sb',...
                                                MarkerSize=8,LineWidth=1.5)
hold on 
plot([alpha_0_V2 alpha_0_25_V2 alpha_0_5_V2 ...
    alpha_1_V2 alpha_2_V2 alpha_2_5_V2 alpha_3_V2 alpha_4_V2 alpha_5_V2 ...
    alpha_6_V2 alpha_7_V2],[0 0.25 0.5 1 2 2.5 3 4 5 6 7]...
    ,'-.dr',MarkerSize=8,LineWidth=1.5)
hold on
plot(105,0,'o',MarkerSize=8,MarkerEdgeColor=[0 0.5 0],LineWidth=1.5)
hold on
plot([49.2 42.9 38.7],[3 5 7],'ks',MarkerSize=8,MarkerFaceColor='k')
hold on
plot([62.2 58.4 55.2 46.5], [2 2.5 3 5],'kd',...
                                          MarkerSize=8,MarkerFaceColor='k')
hold on 
plot(67.3009,0,'bs',MarkerSize=8,MarkerFaceColor='b')
hold on
plot(100.9657,0,'o',MarkerSize=8,MarkerFaceColor=[0 0.5 0],...
                                                 MarkerEdgeColor=[0 0.5 0])


y1 = [0 0.25 0.5 1 2 2.5 3 4 5 6 7];


x1 = [alpha_0_V1 alpha_0_25_V1 alpha_0_5_V1 ...
    alpha_1_V1 alpha_2_V1 alpha_2_5_V1 alpha_3_V1 alpha_4_V1 alpha_5_V1 ...
    alpha_6_V1 alpha_7_V1];

x2 = [alpha_0_V2 alpha_0_25_V2 alpha_0_5_V2 ...
    alpha_1_V2 alpha_2_V2 alpha_2_5_V2 alpha_3_V2 alpha_4_V2 alpha_5_V2 ...
    alpha_6_V2 alpha_7_V2];
fill([flip(x1), x2], [fliplr(y1), (y1)], [0 0.5 0], 'FaceAlpha',...
                                                   0.5,'EdgeColor','none');

xlabel('Airspeed in m/s')
ylabel('\alpha in ^\circ')
grid on 
legend('ASWING Sweep up','ASWING Sweep down','ASWING divergence',...
       'Exp Sweep up','Exp Sweep down','Hi-fi Sweep up',...
       'Hi-fi divergence','1^{rst} flutter region')
set(gca,"FontSize",14)
saveas(gcf,"Angle_of_attack_VS_Vf",'pdf')

Exp_V_sweep_up = [49.2 42.9 38.7];
Aswing_sweep_up = [alpha_3_V1 alpha_5_V1 alpha_7_V1];
Error_sweep_up = 100*(Aswing_sweep_up-Exp_V_sweep_up)./Exp_V_sweep_up

Exp_V_sweep_down = [62.2 58.4 55.2 46.5];
Aswing_sweep_down = [alpha_2_V2 alpha_2_5_V2 alpha_3_V2 alpha_5_V2 ];
Error_sweep_down = 100*(Aswing_sweep_down-...
                                        Exp_V_sweep_down)./Exp_V_sweep_down



% flutter frequency error calculation:

exp_alpha_2_5_f2 = 27.2;


exp_alpha_3_f1 = 30.0;
exp_alpha_3_f2 = 28.2;

exp_alpha_5_f1 = 29.9;
exp_alpha_5_f2 = 26.7;

exp_alpha_7_f1 = 29.4;

freq_ASWING = [alpha_2_5_f2 alpha_3_f1 alpha_3_f2  ...
                alpha_5_f1 alpha_5_f2 alpha_7_f2];
freq_exp = [exp_alpha_2_5_f2 exp_alpha_3_f1 exp_alpha_3_f2 ...
                             exp_alpha_5_f1 exp_alpha_5_f2 exp_alpha_7_f1];

Error_freq = 100*(freq_ASWING-freq_exp)./freq_exp



T = toc;
message = sprintf(['This script took %f seconds to run ' ...
                                   '(including the ASWING simulation)'],T);
disp(message)

%% Modes damping aginst 

alpha_0_data = readtable('divergence_alpha_0_eig.txt',NumHeaderLines=3)
alpha_3_data = readtable('alpha_3_eig.txt',NumHeaderLines=3)
alpha_5_data = readtable('alpha_5_eig.txt',NumHeaderLines=3)
alpha_7_data = readtable('alpha_7_eig.txt',NumHeaderLines=3)



[mode_alpha0 damp_alpha0 freq_alpha0 ]  = damp(alpha_0_data.Var2+j*alpha_0_data.Var3);
[mode_alpha3 damp_alpha3 freq_alpha3 ]  = damp(alpha_3_data.Var2+j*alpha_3_data.Var3);
[mode_alpha5 damp_alpha5 freq_alpha5 ]  = damp(alpha_5_data.Var2+j*alpha_5_data.Var3);
[mode_alpha7 damp_alpha7 freq_alpha7 ]  = damp(alpha_7_data.Var2+j*alpha_7_data.Var3);

V_alpha0 = alpha_0_data.Var1;
V_alpha3 = alpha_3_data.Var1;
V_alpha5 = alpha_5_data.Var1;
V_alpha7 = alpha_7_data.Var1;

figure(1)
for i = 1:length(damp_alpha0)
    hold on
    h1 = plot(60+V_alpha0(i),damp_alpha0(i),'o',MarkerSize=6,...
                      MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0]);
    ylim([-1 1])

end

for i = 1:length(damp_alpha3)
    hold on
    h2 = plot(V_alpha3(i),damp_alpha3(i),'bs',MarkerSize=6,...
                                                      MarkerFaceColor='b');
    ylim([-1 1])

end

for i = 1:length(damp_alpha5)
    hold on
    h3 = plot(V_alpha5(i),damp_alpha5(i),'kd',MarkerSize=6,...
                                                      MarkerFaceColor='k');
    ylim([-1 1])

end

% for i = 1:length(damp_alpha7)
%     hold on
%     plot(V_alpha7(i),damp_alpha7(i),'v',MarkerSize=6,...
%                      MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0])
% ylim([-1 1])
% 
% end


figure(1)

hold on
h4 = fill([-100 200 200 -100], [0 0 -300 -300], [1 0 0], 'FaceAlpha',...
                                                   0.2,'EdgeColor','none');
grid on 
xlabel('Speed in m/s')
ylabel('damping factor')
ylim([-0.05 0.1])
xlim([20 110])
legend([h1 h2 h3 h4],{'\alpha = 0^\circ','\alpha = 3^\circ',...
                                   '\alpha = 5^\circ','unstable'});
set(gca,"FontSize",14)
saveas(gcf,"damping_factor_VS_speed",'pdf')


