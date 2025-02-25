clear all
close all
clc




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plunging AIRFOIL - Leading Edge Vortices Effect on Mean Lift
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A0 = readtable('Experimental Data/A0_A0.csv','NumHeaderLines',3);
A5 = readtable('Experimental Data/A0_A5.csv','NumHeaderLines',3);
A9 = readtable('Experimental Data/A0_A9.csv','NumHeaderLines',3);

figure(1)
plot(A0.Var1, 0.85*2*pi*(0*pi/180)*ones(1,length(A0.Var1)),'-rd',LineWidth=1.5,MarkerSize=10)
hold on
plot(A5.Var1, 0.85*2*pi*(5*pi/180)*ones(1,length(A5.Var1)),'--ro',LineWidth=1.5,MarkerSize=10)
hold on
plot(A9.Var1, 0.85*2*pi*(9*pi/180)*ones(1,length(A9.Var1)),'-.sr',LineWidth=1.5,MarkerSize=10)
hold on
errorbar(A0.Var1,(A0.Var2+A0.Var4)/2,(A0.Var4-A0.Var2)/2,'dk',LineWidth=1.5,MarkerSize=10,MarkerFaceColor='k')
hold on
errorbar(A5.Var1,(A5.Var2+A5.Var4)/2,(A5.Var4-A5.Var2)/2,'ok',LineWidth=1.5,MarkerSize=10,MarkerFaceColor='k')
hold on
errorbar(A9.Var1,(A9.Var2+A9.Var4)/2,(A9.Var4-A9.Var2)/2,'sk',LineWidth=1.5,MarkerSize=10,MarkerFaceColor='k')

ylim([-0.1 1.5])
grid on
xlabel('reduced frequency k')
ylabel('C_L average value')
legend('ASW \alpha = 0.0 ^\circ  (A/c \in [0.05 0.5])','ASW \alpha = 5.0 ^\circ  (A/c \in [0.05 0.5])','ASW \alpha = 9.0 ^\circ  (A/c \in [0.05 0.5])')



