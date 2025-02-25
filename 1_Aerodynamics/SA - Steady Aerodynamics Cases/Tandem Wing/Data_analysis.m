clear all
close all



%% Airframe impact
T = readtable('Airframe_impact.csv','NumHeaderLines',2);
T1 = readtable('Tandem_Airframe_NACA4309.txt','NumHeaderLines',3)
figure(1)
plot(T1.Var3,T1.Var6,'-gd')
hold on
plot(T.Var1,T.Var2,'-ro')
hold on 
plot(T.Var7,T.Var8,'--bo')
hold on
plot(T.Var3,T.Var4,'-r+')
hold on 
plot(T.Var9,T.Var10,'--b+')
hold on
plot(T.Var5,T.Var6,'-rd')
hold on 
plot(T.Var11,T.Var12,'--bd')
grid on
xlim([-7 13])
ylim([-0.3 1.3])
legend('ASWING LLT','CFD fore wing','LLT fore wing','CFD hind wing','LLT hind wing','CFD total','LLT total')
xlabel("angle of attack \alpha in degree")
ylabel("CL lift coefficient")
title("CL VS \alpha for configuration with airframe")

%% JED-EJ75%
T = readtable('JED-EJ75.csv','NumHeaderLines',2);

figure(2)
plot(T.Var1,T.Var2,'-ro')
hold on 
plot(T.Var9,T.Var10,'--bo')
hold on
plot(T.Var3,T.Var4,'-r+')
hold on 
plot(T.Var7,T.Var8,'--b+')
hold on
plot(T.Var5,T.Var6,'-rd')
hold on 
plot(T.Var11,T.Var12,'--bd')
grid on
xlim([-8 16])
ylim([-0.2 1.6])
legend('LLT fore wing','CFD fore wing','LLT Hinge wing','CFD Hinge wing','LLT total','CFD total')
xlabel("angle of attack \alpha in degree")
ylabel("CL lift coefficient")
title("CL VS \alpha for JED-EJ75 airfoil")

%% NASA/LANGLEY
T1 = readtable('Tandem_Airframe_NACA4309.txt','NumHeaderLines',3)
T = readtable('NASA-LANGLEYLS10413.csv','NumHeaderLines',2);

figure(3)
plot(T1.Var3,T1.Var6,'-gd')
hold on
plot(T.Var1,T.Var2,'-rd')
hold on 
plot(T.Var3,T.Var4,'--bd')
hold on 
plot(T.Var5,T.Var6,'-.kd')
hold on
plot(T.Var7,T.Var8,'-r+')
hold on 
plot(T.Var9,T.Var10,'--b+')
hold on 
plot(T.Var11,T.Var12,'-.k+')
hold on
plot(T.Var13,T.Var14,'-ro')
hold on 
plot(T.Var15,T.Var16,'--bo')
hold on 
plot(T.Var17,T.Var18,'-.ko')
grid on
xlim([-7.5 12.5])
ylim([-0.2 1.8])
legend('ASWING_LLT','LLT total','CFD total','Experimental total','LLT hinge','CFD hinge','Experimental hinge','LLT wing','CFD wing','Experimental wing')
xlabel("angle of attack \alpha in degree")
ylabel("CL lift coefficient")
title("CL VS \alpha for NASA/Langley airfoil")

%% Wortman FX63-137

T = readtable('WortmanFX63-163-airfoil.csv','NumHeaderLines',2);

figure(4)
plot(T.Var9,T.Var10,'-ro')
hold on 
plot(T.Var3,T.Var4,'--bo')
hold on
plot(T.Var5,T.Var6,'-r+')
hold on 
plot(T.Var7,T.Var8,'--b+')
hold on
plot(T.Var11,T.Var12,'-rd')
hold on 
plot(T.Var1,T.Var2,'--bd')
grid on
xlim([- 8 16])
ylim([-0.1 0.9])
legend('LLT fore wing','CFD fore wing','LLT Hinge wing','CFD Hinge wing','LLT total','CFD total')
xlabel("angle of attack \alpha in degree")
ylabel("CL lift coefficient")
title("CL VS alpha for WortmanFX63-163 airfoil")
%%
% close all
Wing = readtable('local_cl_wing.txt','NumHeaderLines',2);
Canard = readtable('local_cl_canard.txt','NumHeaderLines',2);

figure(10)
plot(Wing.Var2/max(Wing.Var2),Wing.Var8,'-rd')
hold on
plot(Canard.Var2/max(Canard.Var2),Canard.Var8,'-bd')
xlabel('s/s_{max}')
ylabel('local lift coeficient cl(s)')
grid on
legend('Backward wing','Forward Wing')
