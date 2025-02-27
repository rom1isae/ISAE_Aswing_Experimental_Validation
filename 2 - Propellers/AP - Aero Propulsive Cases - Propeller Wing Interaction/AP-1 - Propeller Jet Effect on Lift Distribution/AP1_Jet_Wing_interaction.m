clear all
close all


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Veldhuis lift distribution : PROWIM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% system('sh ./PROWIM.sh')
Veldhuis = readtable("Experimental_Data/Veldhuis.csv",NumHeaderLines=2);

Veldhuis_exp = readtable("Experimental_Data/Velhuis2_lift.csv",NumHeaderLines=2);

ASWING_A0 = readtable("Aswing_Simulation/PROWINA0.txt",NumHeaderLines=33);

ASWING_A4 = readtable("Aswing_Simulation/PROWINA4.txt",NumHeaderLines=33);

ASWING_A10 = readtable("Aswing_Simulation/PROWINA10.txt",NumHeaderLines=33);

figure(1)
plot(Veldhuis_exp.Var1,Veldhuis_exp.Var2,'ks',LineWidth=1.5,MarkerSize=8,MarkerFaceColor='k')
hold on
plot(Veldhuis_exp.Var5,Veldhuis_exp.Var6,'ko',LineWidth=1.5,MarkerSize=8,MarkerFaceColor='k')
hold on
plot(Veldhuis_exp.Var9,Veldhuis_exp.Var10,'kv',LineWidth=1.5,MarkerSize=8,MarkerFaceColor='k')
hold on
plot(Veldhuis.Var7,Veldhuis.Var8,'-b',LineWidth=1.5)
hold on
plot(Veldhuis.Var9,Veldhuis.Var10,'--b',LineWidth=1.5)
hold on
plot(Veldhuis.Var11,Veldhuis.Var12,'-.b',LineWidth=1.5)
hold on
plot(ASWING_A0.Var2/ASWING_A0.Var2(end),ASWING_A0.Var8,'-r',LineWidth=1.5)
hold on
plot(ASWING_A4.Var2/ASWING_A4.Var2(end),ASWING_A4.Var8,'--r',LineWidth=1.5)
hold on
plot(ASWING_A10.Var2/ASWING_A10.Var2(end),ASWING_A10.Var8,'-.r',LineWidth=1.5)
hold on
plot([0.3-0.236/2 0.3-0.236/2]/0.64, [-1 1.5],'--k',LineWidth=2.5)
hold on
plot([0.3+0.236/2 0.3+0.236/2]/0.64, [-1 1.5],'--k',LineWidth=2.5)
xlabel('normalized spanwize coordinate 2y/b')
ylabel('c_l')
ylim([-0.2 1.3])
xlim([0 1])
grid on 
legend('Exp \alpha = 0^\circ','Exp \alpha = 4^\circ','Exp \alpha = 10^\circ',"Goat" + ...
    "es's LLT \alpha = 0^\circ","Goates's LLT \alpha = 4^\circ","G" + ...
    "oates's LLT \alpha = 10^\circ",'NumColumns',2)

%%

% system('sh ./PROWIM_d.sh')
Veldhuis = readtable("Experimental_Data/Veldhuis.csv",NumHeaderLines=2);

Veldhuis_exp = readtable("Experimental_Data/Velhuis2_lift.csv",NumHeaderLines=2);

ASWING_A0 = readtable("Aswing_Simulation/PROWINA0d.txt",NumHeaderLines=33);

ASWING_A4 = readtable("Aswing_Simulation/PROWINA4d.txt",NumHeaderLines=33);

ASWING_A10 = readtable("Aswing_Simulation/PROWINA10d.txt",NumHeaderLines=33);

figure(2)
plot(Veldhuis_exp.Var3,Veldhuis_exp.Var4,'ks',LineWidth=1.5,MarkerSize=8,MarkerFaceColor='k')
hold on
plot(Veldhuis_exp.Var7,Veldhuis_exp.Var8,'ko',LineWidth=1.5,MarkerSize=8,MarkerFaceColor='k')
hold on
plot(Veldhuis_exp.Var11,Veldhuis_exp.Var12,'kv',LineWidth=1.5,MarkerSize=8,MarkerFaceColor='k')

hold on
plot(ASWING_A0.Var2/ASWING_A0.Var2(end),ASWING_A0.Var8,'-r',LineWidth=1.5)
hold on
plot(ASWING_A4.Var2/ASWING_A4.Var2(end),ASWING_A4.Var8,'--r',LineWidth=1.5)
hold on
plot(ASWING_A10.Var2/ASWING_A10.Var2(end),ASWING_A10.Var8,'-.r',LineWidth=1.5)
hold on
plot([0.3-0.236/2 0.3-0.236/2]/0.64, [-1 1.5],'--k',LineWidth=2.5)
hold on
plot([0.3+0.236/2 0.3+0.236/2]/0.64, [-1 1.5],'--k',LineWidth=2.5)
xlabel('normalized spanwize coordinate 2y/b')
ylabel('c_l')
ylim([-0.2 1.3])
xlim([0 1])
grid on 
legend('Exp \alpha = 0','Exp \alpha = 4','Exp \alpha = 10',"AS" + ...
    "WING \alpha = 0","ASWING \alpha = 4","ASWING \alpha = 10",'NumColumns',2)

