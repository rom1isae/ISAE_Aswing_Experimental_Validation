clear all
close all


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Veldhuis lift distribution : PROWIM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% system('sh ./PROWIM.sh')
Veldhuis = readtable("Veldhuis.csv",NumHeaderLines=2);

Veldhuis_exp = readtable("Velhuis2_lift.csv",NumHeaderLines=2);

ASWING_A0 = readtable("PROWINA0.txt",NumHeaderLines=33);

ASWING_A4 = readtable("PROWINA4.txt",NumHeaderLines=33);

ASWING_A10 = readtable("PROWINA10.txt",NumHeaderLines=33);

figure(2)
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
Veldhuis = readtable("Veldhuis.csv",NumHeaderLines=2);

Veldhuis_exp = readtable("Velhuis2_lift.csv",NumHeaderLines=2);

ASWING_A0 = readtable("PROWINA0d.txt",NumHeaderLines=33);

ASWING_A4 = readtable("PROWINA4d.txt",NumHeaderLines=33);

ASWING_A10 = readtable("PROWINA10d.txt",NumHeaderLines=33);

figure(3)
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

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Veldhuis finesse : APROPOS ALPHA 4.2 deg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear CL_CD1
clear y_p
% close all
APROPOS_ALPHA1 = readtable("Velhuis2_CL_CD2.csv",NumHeaderLines=2)

D = 0.236
R = D/2;


z_p = [-1.017 -0.508 0.0 0.508]*R;
% y_p = 0.0:0.05:1.0;
% y_p = y_p*0.64;

b = 0.64;
y_p1 = 0.0:0.01:0.20;
y_p = [APROPOS_ALPHA1.Var1*b];
x_p = -1.44*R;
% 
for i = 1:length(z_p)
    for j = 1:length(y_p)
        change_ppropeller_position('APROPOS1.asw',x_p,y_p(j),z_p(i));
        [out1,out2] = system('sh APROPOS1.sh');
        APROPOS_TEMP4 = readtable("APROPOS1_temp.csv",NumHeaderLines=3);
        CL_CD1(i,j) = APROPOS_TEMP4.Var11/APROPOS_TEMP4.Var17
    end
end
save("APROPOS1.mat","y_p","CL_CD1")
%%
load("APROPOS1.mat")
figure(10)
plot(APROPOS_ALPHA1.Var1,APROPOS_ALPHA1.Var2,'ko',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot(APROPOS_ALPHA1.Var3,APROPOS_ALPHA1.Var4,'ks',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot(APROPOS_ALPHA1.Var5,APROPOS_ALPHA1.Var6,'k^',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot(APROPOS_ALPHA1.Var7,APROPOS_ALPHA1.Var8,'ks',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot([0 0.25],[14.44 14.44],'-db',MarkerFaceColor='b',MarkerFaceColor='k',LineWidth=5.0,MarkerSize=8)

hold on 
plot(y_p/b,CL_CD1(1,:),'-ro',LineWidth=1.5,MarkerSize=8)
hold on 
plot(y_p/b,CL_CD1(2,:),'-rs',LineWidth=1.5,MarkerSize=8)
hold on 
plot(y_p/b,CL_CD1(3,:),'-r^',LineWidth=1.5,MarkerSize=8)
hold on 
plot(y_p/b,CL_CD1(4,:),'-rs',LineWidth=1.5,MarkerSize=8)
ylim([0 16])
title("\alpha = 1.05°, Exp (black), ASWING (red)")


grid on 
xlabel('2y_p/b')
ylabel('CL/CD')
grid on 
legend('z_p / R = -1.017','z_p / R = -0.508','z_p / R = 0.0','z_p / R = 0.508','Prop off','NumColumns',2)
xlim([0.0 1.01])
% ylim([12 30])

set(gca,Fontsize=14)


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Veldhuis finesse : APROPOS ALPHA 4.2 deg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear CL_CD4
clear y_p
% close all
APROPOS_ALPHA4 = readtable("Velhuis2_CL_CD.csv",NumHeaderLines=2)

D = 0.236
R = D/2;


z_p = [-1.017 -0.508 0.0 0.508 1.017]*R;
% y_p = 0.0:0.05:1.0;
% y_p = y_p*0.64;

b = 0.64;
y_p1 = 0.0:0.01:0.20;
y_p = [APROPOS_ALPHA4.Var1*b];
x_p = -1.44*R;
% 
for i = 1:length(z_p)
    for j = 1:length(y_p)
        change_ppropeller_position('APROPOS.asw',x_p,y_p(j),z_p(i));
        [out1,out2] = system('sh APROPOS4.sh');
        APROPOS_TEMP4 = readtable('APROPOS4_temp.csv',NumHeaderLines=3);
        CL_CD4(i,j) = APROPOS_TEMP4.Var11/APROPOS_TEMP4.Var17;
        CL(i,j) = APROPOS_TEMP4.Var11;
        CD(i,j) =  APROPOS_TEMP4.Var17;
    end
end

save("APROPOS4.mat","y_p","CL_CD4")
%%
load("APROPOS4.mat")
figure(11)
plot(APROPOS_ALPHA4.Var1,APROPOS_ALPHA4.Var2,'ko',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot(APROPOS_ALPHA4.Var3,APROPOS_ALPHA4.Var4,'ks',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot(APROPOS_ALPHA4.Var5,APROPOS_ALPHA4.Var6,'k^',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot(APROPOS_ALPHA4.Var7,APROPOS_ALPHA4.Var8,'ks',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on 
plot(APROPOS_ALPHA4.Var9,APROPOS_ALPHA4.Var10,'ko',MarkerFaceColor='k',LineWidth=1.5,MarkerSize=8)
hold on
plot([0 0.25],[28.73 28.73],'-db',MarkerFaceColor='b',LineWidth=5.0,MarkerSize=8)

hold on 
plot(y_p/b,CL_CD4(1,:),'-ro',MarkerFaceColor='r',LineWidth=1.5,MarkerSize=8)
hold on 
plot(y_p/b,CL_CD4(2,:),'-rs',MarkerFaceColor='r',LineWidth=1.5,MarkerSize=8)
hold on 
plot(y_p/b,CL_CD4(3,:),'-r^',LineWidth=1.5,MarkerSize=8)
hold on 
plot(y_p/b,CL_CD4(4,:),'-rs',LineWidth=1.5,MarkerSize=8)
hold on 
plot(y_p/b,CL_CD4(5,:),'-ro',LineWidth=1.5,MarkerSize=8)
ylim([14 29])
title("\alpha = 4.2°, Exp (black), ASWING (red)")


grid on 
xlabel('2y_p/b')
ylabel('CL/CD')
grid on 
legend('z_p / R = -1.017','z_p / R = -0.508','z_p / R = 0.0','z_p / R = 0.508','z_p / R = 1.017','Prop off','NumColumns',2)
xlim([0.0 1.01])
ylim([12 30])
set(gca,Fontsize=14)

%%
figure(12)
plot(y_p/b,CL(3,:)/2,'-b^')
hold on
figure(13)
plot(y_p/b,CD(3,:)/2,'-bo')
xlabel('2y_p/b')
ylabel('C_L')
grid on 
