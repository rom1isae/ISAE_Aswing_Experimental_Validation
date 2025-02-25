clear all ; close all ; clc

CFD1 = readtable('Figure9a.csv','NumHeaderLines',2);
CFD2 = readtable('Figure9b.csv','NumHeaderLines',2);
CFD3 = readtable('Figure11a.csv','NumHeaderLines',2);
CFD4 = readtable('Figure11b.csv','NumHeaderLines',2);
CFD5 = readtable('Figure12.csv','NumHeaderLines',2);
CFD6 = readtable('Figure13.csv','NumHeaderLines',2);
CFD7 = readtable('Figure14a.csv','NumHeaderLines',2);
CFD8 = readtable('Figure14b.csv','NumHeaderLines',2);
CFD9 = readtable('Figure14c.csv','NumHeaderLines',2);
CFD10 = readtable('Figure14d.csv','NumHeaderLines',2);
ASWING1 =  readtable('E1E2_A9.txt','NumHeaderLines',34)




inch2meter = 0.0254;


figure(1)
plot(inch2meter*CFD1.Var1,CFD1.Var2,'ko','linewidth',1)
hold on
plot(inch2meter*CFD1.Var3,CFD1.Var4,'bs','linewidth',1)
hold on
plot(inch2meter*CFD1.Var5,CFD1.Var6,'rd','linewidth',1)
hold on
plot(ASWING1.Var2(floor(end/2):end),ASWING1.Var9(floor(end/2):end)/ASWING1.Var9(floor(end/2)),'-k','linewidth',1)
hold on
plot(inch2meter*CFD1.Var3,CFD1.Var4,'-b','linewidth',1)
hold on
plot(inch2meter*CFD1.Var5,CFD1.Var6,'-r','linewidth',1)
grid on 

xlabel('span distribution in m')
ylabel('normalized lift/length l(y)/l(0) N/m')
legend('CFD E1 = E2 = Off','CFD E1 = On','CFD E2 = On','ASWING E1 = E2 = Off','ASWING E1 = On','ASWING E2 = On')

saveas(gcf,'CASE1','epsc')
%%

figure(2)
plot(inch2meter*CFD2.Var1,CFD2.Var2,'-ko','linewidth',1)
hold on
plot(inch2meter*CFD2.Var3,CFD2.Var4,'-bs','linewidth',1)
hold on
plot(inch2meter*CFD2.Var5,CFD2.Var6,'-rd','linewidth',1)
grid on 
xlabel('span distribution in m')
ylabel('normalized lift/length l(y)/l(0) N/m')
saveas(gcf,'CASE2','epsc')
legend('CFD E1 = E2 = Off','CFD E1 = On','CFD E2 = On')



%%
figure(3)
plot(inch2meter*CFD3.Var1,CFD3.Var2,'-ko','linewidth',1)
hold on
plot(inch2meter*CFD3.Var3,CFD3.Var4,'-bs','linewidth',1)
hold on
plot(inch2meter*CFD3.Var5,CFD3.Var6,'-rd','linewidth',1)
grid on 
xlabel('span distribution in m')
ylabel('normalized lift/length l(y)/l(0) N/m')
saveas(gcf,'CASE3','epsc')

legend('CFD E1 = E2 = Off','CFD E1 = On, \beta_0 = 20^°','CFD E1 = On,\beta_0 = 28^°')



%%
figure(4)
plot(inch2meter*CFD4.Var1,CFD4.Var2,'-ko','linewidth',1)
hold on
plot(inch2meter*CFD4.Var3,CFD4.Var4,'-bs','linewidth',1)
hold on
plot(inch2meter*CFD4.Var5,CFD4.Var6,'-rd','linewidth',1)
grid on 
xlabel('span distribution in m')
ylabel('normalized lift/length l(y)/l(0) N/m')
legend('CFD E1 = E2 = Off','CFD E2 = On, \beta_0 = 20^°','CFD E2 = On,\beta_0 = 28^°')
saveas(gcf,'CASE4','epsc')
%%
figure(5)
plot(inch2meter*CFD5.Var1,CFD5.Var2,'-ko','linewidth',1)
hold on
plot(inch2meter*CFD5.Var3,CFD5.Var4,'-bs','linewidth',1)
hold on
plot(inch2meter*CFD5.Var5,CFD5.Var6,'-rd','linewidth',1)
hold on
plot(inch2meter*CFD5.Var7,CFD5.Var8,'-*','Color',[0 0.5 0])
grid on 
xlabel('span distribution in m')
ylabel('normalized lift/length l(y)/l(0) N/m')
legend('CFD E1 = E2 = Off','CFD E1 = On','CFD E2 = On','CFD E1 = E2 = On')
saveas(gcf,'CASE5','epsc')

%%
figure(6)
plot(inch2meter*CFD6.Var1,CFD6.Var2,'-ko','linewidth',1)
hold on
plot(inch2meter*CFD6.Var3,CFD6.Var4,'-bs','linewidth',1)
hold on
plot(inch2meter*CFD6.Var5,CFD6.Var6,'-rd','linewidth',1)
hold on
plot(inch2meter*CFD6.Var7,CFD6.Var8,'-*','Color',[0 0.5 0])
grid on 
xlabel('span distribution in m')
ylabel('normalized lift/length l(y)/l(0) N/m')
legend('CFD E1 = E2 = Off','CFD E1 (CCW), E2 (CCW)','CFD E1 (CW), E2 (CCW)','CFD E1 (CCW), E2 (CW)','Location','southwest')
saveas(gcf,'CASE6','epsc')

%%
figure(7)
plot(inch2meter*CFD7.Var1,CFD7.Var2,'-ko','linewidth',1)
hold on
plot(inch2meter*CFD7.Var3,CFD7.Var4,'-bs','linewidth',1)
hold on
plot(inch2meter*CFD7.Var5,CFD7.Var6,'-rd','linewidth',1)
hold on
plot(inch2meter*CFD7.Var7,CFD7.Var8,'-*','Color',[0 0.5 0])
grid on 
xlabel('span distribution in m')
ylabel('normalized lift/length l(y)/l(0) N/m')
legend('CFD E1 = OFF, E2 = Off, \alpha = 9^°','CFD E1 = OFF, E2 = Off, \alpha = 10^°','CFD E1 = OFF, E2 = Off, \alpha = 11^°','CFD E1 = OFF, E2 = Off, \alpha = 12^°','Location','southwest')
saveas(gcf,'CASE7','epsc')

%%
figure(8)
plot(inch2meter*CFD8.Var1,CFD8.Var2,'-ko','linewidth',1)
hold on
plot(inch2meter*CFD8.Var3,CFD8.Var4,'-bs','linewidth',1)
hold on
plot(inch2meter*CFD8.Var5,CFD8.Var6,'-rd','linewidth',1)
hold on
plot(inch2meter*CFD8.Var7,CFD8.Var8,'-*','Color',[0 0.5 0])
grid on 
xlabel('span distribution in m')
ylabel('normalized lift/length l(y)/l(0) N/m')
legend('CFD E1 = ON, E2 = Off, \alpha = 9^°','CFD E1 = ON, E2 = Off, \alpha = 10^°','CFD E1 = ON, E2 = Off, \alpha = 11^°','CFD E1 = ON, E2 = Off, \alpha = 12^°','Location','southwest')
saveas(gcf,'CASE8','epsc')

%%
figure(9)
plot(inch2meter*CFD9.Var1,CFD9.Var2,'-ko','linewidth',1)
hold on
plot(inch2meter*CFD9.Var3,CFD9.Var4,'-bs','linewidth',1)
hold on
plot(inch2meter*CFD9.Var5,CFD9.Var6,'-rd','linewidth',1)
hold on
plot(inch2meter*CFD9.Var7,CFD9.Var8,'-*','Color',[0 0.5 0])
grid on 
xlabel('span distribution in m')
ylabel('normalized lift/length l(y)/l(0) N/m')
legend('CFD E1 = OFF, E2 = ON, \alpha = 9^°','CFD E1 = OFF, E2 = ON, \alpha = 10^°','CFD E1 = OFF, E2 = ON, \alpha = 11^°','CFD E1 = OFF, E2 = ON, \alpha = 12^°','Location','southwest')
saveas(gcf,'CASE9','epsc')

%%
figure(10)
plot(inch2meter*CFD9.Var1,CFD9.Var2,'-ko','linewidth',1)
hold on
plot(inch2meter*CFD9.Var3,CFD9.Var4,'-bs','linewidth',1)
hold on
plot(inch2meter*CFD9.Var5,CFD9.Var6,'-rd','linewidth',1)
hold on
plot(inch2meter*CFD9.Var7,CFD9.Var8,'-*','Color',[0 0.5 0])
grid on 
xlabel('span distribution in m')
ylabel('normalized lift/length l(y)/l(0) N/m')
legend('CFD E1 = ON, E2 = ON, \alpha = 9^°','CFD E1 = ON, E2 = ON, \alpha = 10^°','CFD E1 = ON, E2 = ON, \alpha = 11^°','CFD E1 = ON, E2 = ON, \alpha = 12^°','Location','southwest')
saveas(gcf,'CASE10','epsc')