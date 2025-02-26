clear all ; close all ; clc

MIT_1 = readtable('Exp_data/Figure4_1.csv','NumHeaderLines',2);
MIT_2 = readtable('Exp_data/Figure4_2.csv','NumHeaderLines',2);
MIT_3 = readtable('Exp_data/Figure4_3.csv','NumHeaderLines',2);
MIT_4 = readtable('Exp_data/Figure4_4.csv','NumHeaderLines',2);
MIT_5 = readtable('Exp_data/Figure4_5.csv','NumHeaderLines',2);
MIT_6 = readtable('Exp_data/Figure4_6.csv','NumHeaderLines',2);
MIT_7 = readtable('Exp_data/Figure4_7.csv','NumHeaderLines',2);
MIT_8 = readtable('Exp_data/Figure4_8.csv','NumHeaderLines',2);
MIT_9 = readtable('Exp_data/Figure4_9.csv','NumHeaderLines',2);
MIT_10 = readtable('Exp_data/Figure4_10.csv','NumHeaderLines',2);
MIT_11 = readtable('Exp_data/Figure4_11.csv','NumHeaderLines',2);
MIT_12 = readtable('Exp_data/Figure4_12.csv','NumHeaderLines',2);
MIT_13 = readtable('Exp_data/Figure4_13.csv','NumHeaderLines',2);
MIT_14 = readtable('Exp_data/Figure4_14.csv','NumHeaderLines',2);
%%
close all
clear U
clear V
clear W
M = [0 0.02 0.05 0.075 0.1 0.15 0.2 0.4];
for i = 1:length(M)
    change_mass('[0_90]_3s.asw',M(i),0)
    system('sh ./\[0_90\]_3s.sh')
    opts = detectImportOptions('beam.txt');
    opts.CommentStyle = {'#'};
    opts.Delimiter = {'\t'};
    opts.DataLines = [3 Inf];
    Data = readtable('beam.txt',opts);
    Data.Var1{1}
    UVW = str2num(Data.Var1{1})
    U(i) = UVW(3);
    V(i) = UVW(4);
    W(i) = UVW(5);
end
for i = 2:length(M)
    U(i) = U(i)-U(1);
    V(i) = V(i)-V(1);
    W(i) = W(i)-W(1);
end

U(1) = 0;
V(1) = 0;
W(1) = 0;
%%
fig = figure(1)
err_u = 0.005*ones(size(MIT_1.Var1));
err_v = 0.005*ones(size(MIT_1.Var3));
err_w = 0.005*ones(size(MIT_1.Var5));
errorbar(MIT_1.Var4,MIT_1.Var3,err_v,'bo','MarkerFaceColor','b',MarkerSize=8)
hold on
errorbar(MIT_1.Var2,MIT_1.Var1,err_u,'rs','MarkerFaceColor','r',MarkerSize=8)
hold on 
errorbar(MIT_1.Var6,MIT_1.Var5,err_w,'kd','MarkerFaceColor','k',MarkerSize=8)
hold on
plot(M(1:end),abs(U(1:end)),'--b','linewidth',1.5)
hold on
plot(M(1:end),abs(V(1:end)),'-.r','linewidth',1.5)
hold on
plot(M(1:end),abs(W(1:end)),'-k','linewidth',1.5)
xlabel('load in kg')
ylabel('delfection in m')
grid on
legend('Exp \Delta x','Exp \Delta y','Exp \Delta z','ASWING \Delta x','ASWING \Delta y','ASWING \Delta z','Location','northwest')
title('[0/90]3s Beam, Root angle 0°')
fontsize(fig, 14, "points")
fontsize(gca, 14, "points")

% saveas(gcf,'images/[0_90]3s_theta_0','epsc')

% figure(2)
% plot(M(2:end),abs(100*(abs(U(2:end))-abs(0*MIT_1.Var3(2:end)'))./MIT_1.Var3(2:end)'),'-bo','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(V(2:end))-abs(MIT_1.Var1(2:end)'))./MIT_1.Var1(2:end)'),'-rs','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(W(2:end))-abs(MIT_1.Var5(2:end)'))./MIT_1.Var5(2:end)'),'-k*','linewidth',1)
% xlabel('load in kg')
% ylabel('\epsilon_\Delta prediction error in %')
% ylim([0 100])
% grid on
% legend('\epsilon_{\Delta_x}','\epsilon_{\Delta_y}','\epsilon_{\Delta_z}','Location','northeast')
% title('[0/90]3s Beam, Root angle 0°')
% saveas(gcf,'images/[0_90]3s_theta_0_err','epsc')



%%
 
clear M
clear U
clear V
clear W
M = [0 0.02 0.05 0.075 0.2 0.4];
for i = 1:length(M)
    change_mass('[0_90]_3s.asw',M(i),-45)
    system('sh ./\[0_90\]_3s.sh')
    opts = detectImportOptions('beam.txt');
    opts.CommentStyle = {'#'};
    opts.Delimiter = {'\t'};
    opts.DataLines = [3 Inf];
    Data = readtable('beam.txt',opts);
    Data.Var1{1}
    UVW = str2num(Data.Var1{1})
    U(i) = UVW(3)
    V(i) = UVW(4)
    W(i) = UVW(5);

end

for i = 2:length(M)
    U(i) = U(i)-U(1)
    V(i) = V(i)-V(1)
    W(i) = W(i)-W(1)
end

U(1) = 0.0;
V(1) = 0.0;
W(1) = 0.0;
try
close figure(1)
end

fig = figure(1); 

err_u = 0.001*ones(size(MIT_2.Var1));
err_v = 0.001*ones(size(MIT_2.Var2));
err_w = 0.0005*ones(size(MIT_2.Var3));
errorbar(MIT_2.Var4,MIT_2.Var3,err_v,'bo','MarkerFaceColor','b',MarkerSize=8)
hold on
errorbar(MIT_2.Var2,MIT_2.Var1,err_u,'rs','MarkerFaceColor','r',MarkerSize=8)
hold on 
errorbar(MIT_2.Var6,MIT_2.Var5,err_w,'kd','MarkerFaceColor','k',MarkerSize=8)
hold on
plot(M(1:end),abs(U(1:end)),'--b','linewidth',1.5)
hold on
plot(M(1:end),abs(V(1:end)),'-.r','linewidth',1.5)
hold on
plot(M(1:end),abs(W(1:end)),'-k','linewidth',1.5)
xlabel('load in kg')
ylabel('delfection in m')
grid on
legend('Exp \Delta x','Exp \Delta y','Exp \Delta z','ASWING \Delta x','ASWING \Delta y','ASWING \Delta z','Location','northwest')
title('[0/90]3s Beam, Root angle 45°')
fontsize(fig, 14, "points")
% saveas(gcf,'images/[0_90]3s_theta_45','epsc')

Mx = [0 0.02 0.075 0.2 0.4];
% figure(2)
% plot(Mx(2:end),abs(100*(abs([U(2:3) U(5:end)])-abs(MIT_2.Var3(2:end-1)'))./MIT_2.Var3(2:end-1)'),'-bo','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(V(2:end))-abs(MIT_2.Var1(2:end)'))./MIT_2.Var1(2:end)'),'-rs','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(W(2:end))-abs(MIT_2.Var5(2:end)'))./MIT_2.Var5(2:end)'),'-k*','linewidth',1)
% xlabel('load in kg')
% ylabel('\epsilon_\Delta prediction error in %')
% ylim([0 100])
% grid on
% legend('\epsilon_{\Delta_x}','\epsilon_{\Delta_y}','\epsilon_{\Delta_z}','Location','northeast')
% title('[0/90]3s Beam, Root angle 45°')
% saveas(gcf,'images/[0_90]3s_theta_45_err','epsc')

%% [45_0]_3s \theta = 0
clear M
clear U
clear V
clear W

M = [0 0.02 0.05 0.1 0.2 0.3 0.4];
for i = 1:length(M)
    change_mass('[45_0]_3s.asw',M(i),0)
    system('sh ./\[45_0\]_3s.sh')
    opts = detectImportOptions('[45_0]_3s.txt');
    opts.CommentStyle = {'#'};
    opts.Delimiter = {'\t'};
    opts.DataLines = [3 Inf];
    Data = readtable('[45_0]_3s.txt',opts);
    Data.Var1{1}
    UVW = str2num(Data.Var1{1})
    U(i) = UVW(3)
    V(i) = UVW(4)
    W(i) = UVW(5);

end


for i = 2:length(M)
    U(i) = U(i)-U(1)
    V(i) = V(i)-V(1)
    W(i) = W(i)-W(1)
end

U(1) = 0.0;
V(1) = 0.0;
W(1) = 0.0;


fig = figure(5)

err_u = 0.001*ones(size(MIT_5.Var1));
err_v = 0.001*ones(size(MIT_5.Var2));
err_w = 0.0005*ones(size(MIT_5.Var3));
errorbar(MIT_5.Var4,MIT_5.Var3,err_v,'bo','MarkerFaceColor','b',MarkerSize=8)
hold on
errorbar(MIT_5.Var2,MIT_5.Var1,err_u,'rs','MarkerFaceColor','r',MarkerSize=8)
hold on 
errorbar(MIT_5.Var6,MIT_5.Var5,err_w,'kd','MarkerFaceColor','k',MarkerSize=8)
hold on
plot(M(1:end),abs(U(1:end)),'--b','linewidth',1.5)
hold on
plot(M(1:end),abs(V(1:end)),'-.r','linewidth',1.5)
hold on
plot(M(1:end),abs(W(1:end)),'-k','linewidth',1.5)
xlabel('load in kg')
ylabel('delfection in m')
grid on
legend('Exp \Delta x','Exp \Delta y','Exp \Delta z','ASWING \Delta x','ASWING \Delta y','ASWING \Delta z','Location','northwest')
title('[45/0]3s Beam, Root angle 0°')
fontsize(fig, 14, "points")
% saveas(gcf,'images/[45_0]3s_theta_0','epsc')

% 
% figure(2)
% plot(M(2:end),abs(100*(abs(U(2:end))-abs(MIT_5.Var3(2:end)'))./MIT_5.Var3(2:end)'),'-bo','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(V(2:end))-abs(MIT_5.Var1(2:end)'))./MIT_5.Var1(2:end)'),'-rs','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(W(2:end))-abs(MIT_5.Var5(2:end)'))./MIT_5.Var5(2:end)'),'-k*','linewidth',1)
% xlabel('load in kg')
% ylabel('\epsilon_\Delta prediction error in %')
% ylim([0 100])
% grid on
% legend('\epsilon_{\Delta_x}','\epsilon_{\Delta_y}','\epsilon_{\Delta_z}','Location','northeast')
% title('[45/0]3s Beam, Root angle 0°')
% saveas(gcf,'images/[45_0]3s_theta_0_err','epsc')


%% [45_0]_3s \theta = 45
clear M
clear U
clear V
clear W
M = [0 0.02 0.05 0.1 0.2 0.3 0.4];
for i = 1:length(M)
    change_mass('[45_0]_3s.asw',M(i),-45)
    system('sh ./\[45_0\]_3s.sh')
    opts = detectImportOptions('[45_0]_3s.txt');
    opts.CommentStyle = {'#'};
    opts.Delimiter = {'\t'};
    opts.DataLines = [3 Inf];
    Data = readtable('[45_0]_3s.txt',opts);
    Data.Var1{1}
    UVW = str2num(Data.Var1{1})
    U(i) = UVW(3)
    V(i) = UVW(4)
    W(i) = UVW(5);

end

for i = 2:length(M)
    U(i) = U(i)-U(1)
    V(i) = V(i)-V(1)
    W(i) = W(i)-W(1)
end

U(1) = 0.0;
V(1) = 0.0;
W(1) = 0.0;

figure(6)

err_u = 0.001*ones(size(MIT_6.Var1));
err_v = 0.001*ones(size(MIT_6.Var2));
err_w = 0.0005*ones(size(MIT_6.Var3));
errorbar(MIT_6.Var4,MIT_6.Var3,err_v,'bo',MarkerFaceColor='b',MarkerSize=8)
hold on
errorbar(MIT_6.Var2,MIT_6.Var1,err_u,'rs',MarkerFaceColor='r',MarkerSize=8)
hold on 
errorbar(MIT_6.Var6,MIT_6.Var5,err_w,'kd',MarkerFaceColor='k',MarkerSize=8)
plot(M(1:end),abs(U(1:end)),'--b','linewidth',1.5)
hold on
plot(M(1:end),abs(V(1:end)),'-.r','linewidth',1.5)
hold on
plot(M(1:end),abs(W(1:end)),'-k','linewidth',1.5)
xlabel('load in kg')
ylabel('delfection in m')
grid on
legend('Exp \Delta x','Exp \Delta y','Exp \Delta z','ASWING \Delta x','ASWING \Delta y','ASWING \Delta z','Location','northwest')
title('[45/0]3s Beam, Root angle 45°')
fontsize(gca, 14, "points")

% saveas(gcf,'images/[45_0]3s_theta_45','epsc')


% figure(2)
% plot(M(2:end),abs(100*(abs(U(2:end))-abs(MIT_6.Var3(2:end)'))./MIT_6.Var3(2:end)'),'-bo','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(V(2:end))-abs(MIT_6.Var1(2:end)'))./MIT_6.Var1(2:end)'),'-rs','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(W(2:end))-abs(MIT_6.Var5(2:end)'))./MIT_6.Var5(2:end)'),'-k*','linewidth',1)
% xlabel('load in kg')
% ylabel('\epsilon_\Delta prediction error in %')
% ylim([0 100])
% grid on
% legend('\epsilon_{\Delta_x}','\epsilon_{\Delta_y}','\epsilon_{\Delta_z}','Location','northeast')
% title('[45/0]3s Beam, Root angle 45°')
% saveas(gcf,'images/[45_0]3s_theta_45_err','epsc')
%% [45_0]_3s \theta = -45
clear M
clear U
clear V
clear W
M = [0 0.02 0.05 0.1 0.2 0.3 0.4];
for i = 1:length(M)
    change_mass('[45_0]_3s.asw',M(i),45)
    system('sh ./\[45_0\]_3s.sh')
    opts = detectImportOptions('[45_0]_3s.txt');
    opts.CommentStyle = {'#'};
    opts.Delimiter = {'\t'};
    opts.DataLines = [3 Inf];
    Data = readtable('[45_0]_3s.txt',opts);
    Data.Var1{1}
    UVW = str2num(Data.Var1{1})
    U(i) = UVW(3)
    V(i) = UVW(4)
    W(i) = UVW(5);

end

for i = 2:length(M)
    U(i) = U(i)-U(1)
    V(i) = V(i)-V(1)
    W(i) = W(i)-W(1)
end
U(1) = 0.0;
V(1) = 0.0;
W(1) = 0.0;

figure(7)

err_u = 0.001*ones(size(MIT_7.Var1));
err_v = 0.001*ones(size(MIT_7.Var2));
err_w = 0.0005*ones(size(MIT_7.Var3));
errorbar(MIT_7.Var4,MIT_7.Var3,err_v,'bo',MarkerFaceColor='b',MarkerSize=8)
hold on
errorbar(MIT_7.Var2,MIT_7.Var1,err_u,'rs',MarkerFaceColor='r',MarkerSize=8)
hold on 
errorbar(MIT_7.Var6,MIT_7.Var5,err_w,'kd',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(M(1:end),abs(U(1:end)),'--b','linewidth',1.5)
hold on
plot(M(1:end),abs(V(1:end)),'-.r','linewidth',1.5)
hold on
plot(M(1:end),abs(W(1:end)),'k','linewidth',1.5)
xlabel('load in kg')
ylabel('delfection in m')
grid on
legend('Exp \Delta x','Exp \Delta y','Exp \Delta z','ASWING \Delta x','ASWING \Delta y','ASWING \Delta z','Location','northwest')
title('[45/0]3s Beam, Root angle -45°')
fontsize(gca, 14, "points")

% saveas(gcf,'images/[45_0]3s_theta_m45','epsc')

% figure(2)
% plot(M(2:end),abs(100*(abs(U(2:end))-abs(MIT_7.Var3(2:end)'))./MIT_7.Var3(2:end)'),'-bo','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(V(2:end))-abs(MIT_7.Var1(2:end)'))./MIT_7.Var1(2:end)'),'-rs','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(W(2:end))-abs(MIT_7.Var5(2:end)'))./MIT_7.Var5(2:end)'),'-k*','linewidth',1)
% xlabel('load in kg')
% ylabel('\epsilon_\Delta prediction error in %')
% ylim([0 100])
% grid on
% legend('\epsilon_{\Delta_x}','\epsilon_{\Delta_y}','\epsilon_{\Delta_z}','Location','northeast')
% title('[45/0]3s Beam, Root angle -45°')
% saveas(gcf,'images/[45_0]3s_theta_m45_err','epsc')






%% [20_m70_20]_2a\theta = 0
clear M
clear U
clear V
clear W
M = [0 0.02 0.05 0.1 0.2 0.3 0.4 0.5];
for i = 1:length(M)
    change_mass('[20_m70_20]_2a.asw',M(i),0)
    system('sh ./\[20_m70_20\]_2a.sh')
    opts = detectImportOptions('[20_m70_20]_2a.txt');
    opts.CommentStyle = {'#'};
    opts.Delimiter = {'\t'};
    opts.DataLines = [3 Inf];
    Data = readtable('[20_m70_20]_2a.txt',opts);
    Data.Var1{1}
    UVW = str2num(Data.Var1{1})
    U(i) = UVW(3)
    V(i) = UVW(4)
    W(i) = UVW(5);

end

for i = 2:length(M)
    U(i) = U(i)-U(1)
    V(i) = V(i)-V(1)
    W(i) = W(i)-W(1)
end

U(1) = 0.0;
V(1) = 0.0;
W(1) = 0.0;


figure(11)

err_u = 0.001*ones(size(MIT_11.Var1));
err_v = 0.001*ones(size(MIT_11.Var2));
err_w = 0.0005*ones(size(MIT_11.Var3));
errorbar(MIT_11.Var4,MIT_11.Var3,err_v,'bo',MarkerFaceColor='b',MarkerSize=8)
hold on
errorbar(MIT_11.Var2,MIT_11.Var1,err_u,'rs',MarkerFaceColor='r',MarkerSize=8)
hold on 
errorbar(MIT_11.Var6,MIT_11.Var5,err_w,'kd',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(M(1:end),abs(U(1:end)),'--b','linewidth',1.5)
hold on
plot(M(1:end),abs(V(1:end)),'-.r','linewidth',1.5)
hold on
plot(M(1:end),abs(W(1:end)),'-k','linewidth',1.5)
xlabel('load in kg')
ylabel('delfection in m')
grid on
legend('Exp \Delta x','Exp \Delta y','Exp \Delta z','ASWING \Delta x','ASWING \Delta y','ASWING \Delta z','Location','northwest')
title('[20/-70/-70/50]3s Beam, Root angle 0°')
fontsize(gca, 14, "points")

saveas(gcf,'images/[20_m70_m70_50]3s_theta_0','epsc')

% 
% figure(2)
% plot(M(2:end),abs(100*(abs(U(2:end))-0*abs(MIT_11.Var3(2:end)'))./MIT_11.Var3(2:end)'),'-bo','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(V(2:end))-abs(MIT_11.Var1(2:end)'))./MIT_11.Var1(2:end)'),'-rs','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(W(2:end))-abs(MIT_11.Var5(2:end)'))./MIT_11.Var5(2:end)'),'-k*','linewidth',1)
% xlabel('load in kg')
% ylabel('\epsilon_\Delta prediction error in %')
% ylim([0 100])
% grid on
% legend('\epsilon_{\Delta_x}','\epsilon_{\Delta_y}','\epsilon_{\Delta_z}','Location','northeast')
% title('[20/-70/-70/50]2a Beam, Root angle 0°')
% saveas(gcf,'images/[20_m70_m70_50]2a_theta_0_err','epsc')

%% [20_m70_20]_2a\theta = 45
clear M
clear U
clear V
clear W
M = [0 0.02 0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7];
for i = 1:length(M)
    change_mass2('[20_m70_20]_2a.asw',M(i),45)
    system('sh ./\[20_m70_20\]_2a.sh')
    opts = detectImportOptions('[20_m70_20]_2a.txt');
    opts.CommentStyle = {'#'};
    opts.Delimiter = {'\t'};
    opts.DataLines = [3 Inf];
    Data = readtable('[20_m70_20]_2a.txt',opts);
    Data.Var1{1}
    UVW = str2num(Data.Var1{1})
    U(i) = UVW(3)
    V(i) = UVW(4)
    W(i) = UVW(5);

end

for i = 2:length(M)
    U(i) = U(i)-U(1)
    V(i) = V(i)-V(1)
    W(i) = W(i)-W(1)
end
U(1) = 0.0;
V(1) = 0.0;
W(1) = 0.0;

figure(12)

err_u = 0.001*ones(size(MIT_12.Var1));
err_v = 0.001*ones(size(MIT_12.Var2));
err_w = 0.0005*ones(size(MIT_12.Var3));
errorbar(MIT_12.Var4,MIT_12.Var3,err_v,'bo',MarkerFaceColor='b',MarkerSize=8)
hold on
errorbar(MIT_12.Var2,MIT_12.Var1,err_u,'rs',MarkerFaceColor='r',MarkerSize=8)
hold on 
errorbar(MIT_12.Var6,MIT_12.Var5,err_w,'kd',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(M(1:end),abs(U(1:end)),'--b','linewidth',1.5)
hold on
plot(M(1:end),abs(V(1:end)),'-.r','linewidth',1.5)
hold on
plot(M(1:end),abs(W(1:end)),'-k','linewidth',1.5)
xlabel('load in kg')
ylabel('delfection in m')
grid on
legend('Exp \Delta x','Exp \Delta y','Exp \Delta z','ASWING \Delta x','ASWING \Delta y','ASWING \Delta z','Location','northwest')
% title('[20/-70/-70/50]3s Beam, Root angle 0°')
% saveas(gcf,'images/[20_m70_m70_50]3s_theta_45','epsc')
title('[20/-70/-70/50]3s Beam, Root angle 45°')
fontsize(gca, 14, "points")
saveas(gcf,'images/[20_m70_m70_50]3s_theta_45','epsc')

% figure(2)
% plot(M(2:end),abs(100*(abs(U(2:end))-abs(MIT_12.Var3(2:end)'))./MIT_12.Var3(2:end)'),'-bo','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(V(2:end))-abs(MIT_12.Var1(2:end)'))./MIT_12.Var1(2:end)'),'-rs','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(W(2:end))-abs(MIT_12.Var5(2:end)'))./MIT_12.Var5(2:end)'),'-k*','linewidth',1)
% xlabel('load in kg')
% ylabel('\epsilon_\Delta prediction error in %')
% ylim([0 100])
% grid on
% legend('\epsilon_{\Delta_x}','\epsilon_{\Delta_y}','\epsilon_{\Delta_z}','Location','northeast')
% title('[20/-70/-70/50]2a Beam, Root angle 45°')
% saveas(gcf,'images/[20_m70_m70_50]2a_theta_45_err','epsc')

%% [45_0]_3a \theta = 0
clear M
clear U
clear V
clear W
M = [0 0.02 0.05 0.1 0.2 0.3 0.4];
for i = 1:length(M)
    change_mass2('[45_0]_3a.asw',M(i),-45) % particular case (no twist) 
    system('sh ./\[45_0\]_3a.sh')
    opts = detectImportOptions('[45_0]_3a.txt');
    opts.CommentStyle = {'#'};
    opts.Delimiter = {'\t'};
    opts.DataLines = [3 Inf];
    Data = readtable('[45_0]_3a.txt',opts);
    Data.Var1{1}
    UVW = str2num(Data.Var1{1})
    U(i) = UVW(3);
    V(i) = UVW(4);
    W(i) = UVW(5);

end

for i = 2:length(M)
    U(i) = U(i)-U(1)
    V(i) = V(i)-V(1)
    W(i) = W(i)-W(1)
end

U(1) = 0.0;
V(1) = 0.0;
W(1) = 0.0;


figure(13)

err_u = 0.001*ones(size(MIT_13.Var1));
err_v = 0.001*ones(size(MIT_13.Var2));
err_w = 0.0005*ones(size(MIT_13.Var3));
errorbar(MIT_13.Var4,MIT_13.Var3,err_v,'bo',MarkerFaceColor='b',MarkerSize=8)
hold on
errorbar(MIT_13.Var2,MIT_13.Var1,err_u,'rs',MarkerFaceColor='r',MarkerSize=8)
hold on 
errorbar(MIT_13.Var6,MIT_13.Var5,err_w,'kd',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(M(1:end),abs(U(1:end)),'--b','linewidth',1.5)
hold on
plot(M(1:end),abs(V(1:end)),'-.r','linewidth',1.5)
hold on
plot(M(1:end),abs(W(1:end)),'-k','linewidth',1.5)
xlabel('load in kg')
ylabel('delfection in m')
grid on
legend('Exp \Delta x','Exp \Delta y','Exp \Delta z','ASWING \Delta x','ASWING \Delta y','ASWING \Delta z','Location','northwest')
title('[45/0]3a Beam, Root angle 0°')
fontsize(gca, 14, "points")
% saveas(gcf,'images/[45_0]3a_theta_0','epsc')


% 
% figure(2)
% plot(M(2:end),abs(100*(abs(U(2:end))-abs(MIT_13.Var3(2:end)'))./MIT_13.Var3(2:end)'),'-bo','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(V(2:end))-abs(MIT_13.Var1(2:end)'))./MIT_13.Var1(2:end)'),'-rs','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(W(2:end))-abs(MIT_13.Var5(2:end)'))./MIT_13.Var5(2:end)'),'-k*','linewidth',1)
% xlabel('load in kg')
% ylabel('\epsilon_\Delta prediction error in %')
% ylim([0 100])
% grid on
% legend('\epsilon_{\Delta_x}','\epsilon_{\Delta_y}','\epsilon_{\Delta_z}','Location','northeast')
% title('[45/0]3a Beam, Root angle 0°')
% saveas(gcf,'images/[45_0]3a_theta_0_err','epsc')

%% [45_0]_3a \theta = 45

clear M
clear U
clear V
clear W

M = [0 0.02 0.05 0.1  0.2 0.3 0.4];
for i = 1:length(M)
    change_mass2('[45_0]_3a.asw',M(i),0)
    system('sh ./\[45_0\]_3a.sh')
    opts = detectImportOptions('[45_0]_3a.txt');
    opts.CommentStyle = {'#'};
    opts.Delimiter = {'\t'};
    opts.DataLines = [3 Inf];
    Data = readtable('[45_0]_3a.txt',opts);
    Data.Var1{1}
    UVW = str2num(Data.Var1{1})
    U(i) = UVW(3)
    V(i) = UVW(4)
    W(i) = UVW(5);

end

for i = 2:length(M)
    U(i) = U(i)-U(1)
    V(i) = V(i)-V(1)
    W(i) = W(i)-W(1)
end
U(1) = 0.0;
V(1) = 0.0;
W(1) = 0.0;


figure(14)

err_u = 0.001*ones(size(MIT_14.Var1));
err_v = 0.001*ones(size(MIT_14.Var2));
err_w = 0.0005*ones(size(MIT_14.Var3));
errorbar(MIT_14.Var4,MIT_14.Var3,err_v,'bo',MarkerFaceColor='b',MarkerSize=8)
hold on
errorbar(MIT_14.Var2,MIT_14.Var1,err_u,'rs',MarkerFaceColor='r',MarkerSize=8)
hold on 
errorbar(MIT_14.Var6,MIT_14.Var5,err_w,'kd',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(M(1:end),abs(U(1:end)),'--b','linewidth',1.5)
hold on
plot(M(1:end),abs(V(1:end)),'-.r','linewidth',1.5)
hold on
plot(M(1:end),abs(W(1:end)),'-k','linewidth',1.5)
xlabel('load in kg')
ylabel('delfection in m')
grid on
legend('Exp \Delta x','Exp \Delta y','Exp \Delta z','ASWING \Delta x','ASWING \Delta y','ASWING \Delta z','Location','northwest')
title('[45/0]3a Beam, Root angle 45°')
fontsize(gca, 14, "points")

% saveas(gcf,'images/[45_0]3a_theta_45','epsc')

% figure(2)
% plot(M(2:end),abs(100*(abs(U(2:end))-abs(MIT_14.Var3(2:end)'))./MIT_14.Var3(2:end)'),'-bo','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(V(2:end))-abs(MIT_14.Var1(2:end)'))./MIT_14.Var1(2:end)'),'-rs','linewidth',1)
% hold on
% plot(M(2:end),abs(100*(abs(W(2:end))-abs(MIT_14.Var5(2:end)'))./MIT_14.Var5(2:end)'),'-k*','linewidth',1)
% xlabel('load in kg')
% ylabel('\epsilon_\Delta prediction error in %')
% ylim([0 100])
% grid on
% legend('\epsilon_{\Delta_x}','\epsilon_{\Delta_y}','\epsilon_{\Delta_z}','Location','northeast')
% title('[45/0]3a Beam, Root angle 45°')
% saveas(gcf,'images/[45_0]3a_theta_45_err','epsc')