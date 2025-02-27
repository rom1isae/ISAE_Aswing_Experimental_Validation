clear all
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LEV Effect on the Mean lift Coefficient of a Plunging Airfoil
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A0 = readtable('Experimental_Data/A_A0_A0.csv','NumHeaderLines',3);
A5 = readtable('Experimental_Data/A_A0_A5.csv','NumHeaderLines',3);
A9 = readtable('Experimental_Data/A_A0_A9.csv','NumHeaderLines',3);

figure(1)

errorbar(A0.Var1,-0.03+(A0.Var2+A0.Var4)/2,-0.03+(A0.Var4-A0.Var2)/2,'dk',LineWidth=1.5,MarkerSize=10)
hold on
errorbar(A5.Var1,(A5.Var2+A5.Var4)/2,(A5.Var4-A5.Var2)/2,'ok',LineWidth=1.5,MarkerSize=10)
hold on
errorbar(A9.Var1,(A9.Var2+A9.Var4)/2,(A9.Var4-A9.Var2)/2,'sk',LineWidth=1.5,MarkerSize=10)
hold on
plot(A0.Var1, 2*pi*(0*pi/180)*ones(1,length(A0.Var1)),'-rd',LineWidth=1.5,MarkerSize=10)
hold on
plot(A5.Var1, 0.68*ones(1,length(A5.Var1)),'--ro',LineWidth=1.5,MarkerSize=10)
hold on
plot(A9.Var1, A9.Var6(1)*ones(1,length(A9.Var1)),'-.sr',LineWidth=1.5,MarkerSize=10)
grid on
xlabel('reduced frequency k')
ylabel('c_l average value')
ylim([-0.1 1.5])
legend('Exp \alpha = 0.0 ^\circ  (A/c \in [0.05 0.5])','Exp \alpha = 5.0 ^\circ  (A/c \in [0.05 0.5])', 'Exp \alpha = 9.0 ^\circ (A/c \in [0.05 0.5])')
set(gca,'Fontsize',14)