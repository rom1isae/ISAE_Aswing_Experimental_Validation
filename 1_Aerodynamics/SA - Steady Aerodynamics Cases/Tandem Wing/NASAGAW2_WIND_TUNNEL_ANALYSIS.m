clear all
close all
clc


aircraft.Name = 'Tandem_GAW2_L163_G05';
L = 1.63;
G = 0.5;





N = 40;
b_canard = 1.29;
b_wing = 1.83;

c_canard = 0.22;
c_wing = 0.305;

L = L*c_wing;
G = G*c_wing;

twist_canard = 2;
twist_wing = 0;


canard_cdf = 0.006;
canard_cdp =  0.002;
% canard_clalpha = ;
canard_clalpha = 6.55;
canard_clmax = 1.7;
canard_clmin = -1.2;
canard_alpha0 = 4.125;
canard_cm = 0;



wing_cdf = 0.006;
wing_cdp = 0.002;
% wing_clalpha = 6.1994;
wing_clalpha = 6.55;
wing_clmax = 1.7;
wing_clmin = -1.2;
wing_alpha0 = 4.125;
wing_cm = 0;


theta = 0:pi/N:pi;



Wing.Status = true(1);
% Wing.Status = false(1);1
Wing.Name = "Canard";
Wing.BeamIndex = 1;
Wing.N = length(theta); % number of nodes
N = Wing.N;


%%%%%%%%%%%%%%%%%%%%%% Geometrical paramters: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Position of local csn frame origin  
Wing.x = zeros(N,1);
Wing.y = b_canard/4-(b_canard/4)*cos(theta);
Wing.y = Wing.y'
Wing.z = zeros(N,1);
Wing.t = Wing.y;
Wing.R = 0.00*c_canard*ones(N,1);
% local twist
Wing.twist = twist_canard*ones(N,1);
% position of center of gravity in the csn frame:
Wing.Ccg  = zeros(N,1);
Wing.Ncg  = zeros(N,1);
% second position of center of gravity in the csn frame: (wet wing)
Wing.DCcg  = zeros(N,1);
Wing.DNcg  = zeros(N,1);

% tension axis position in the csn frame:
Wing.Cta  = zeros(N,1);
Wing.Nta  = zeros(N,1);

% elastic axis position in the csn frame:
Wing.Cea  = zeros(N,1);
Wing.Nea  = zeros(N,1);

% Beam radius for both fuselage or wings:
% recover the volumic effect of airfoil thickness on local induced velocity
% using slender body theory.

% Wing.R = zeros(N,1);

% distance/chord from leading edge to s-axis (c,n origin):
Wing.Xax = 0.0*ones(N,1);

%%%%%%%%%%%%%%%%%%%%%%% Structural paramters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Wing.EIcc = zeros(N,1);
Wing.EInn = zeros(N,1);
Wing.EIcn = zeros(N,1);
Wing.EIcs = zeros(N,1);
Wing.EIsn = zeros(N,1);
Wing.GJ = zeros(N,1);
Wing.EA = zeros(N,1);
Wing.GKc = zeros(N,1);
Wing.GKn = zeros(N,1);
Wing.tdeps = zeros(N,1);
Wing.tdgam = zeros(N,1);

%%%%%%%%%%%%%%%%%%%%%%% mass and inertial parameters %%%%%%%%%%%%%%%%%%%%%%

% 1rst weigth over length:
Wing.mg = 0.1*ones(N,1);
% 1rst section rotational weight-inertia/length about it mass centroid:
Wing.mgcc = zeros(N,1);
Wing.mgnn = zeros(N,1);



% 2nd weigth over length :
Wing.Dmg = zeros(N,1);
% 2nd section rotational weight-inertia/length about it mass centroid:
Wing.Dmgcc = zeros(N,1);
Wing.Dmgnn = zeros(N,1);



%%%%%%%%%%%%%%%%%%%%%%% Aerodynamic parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% section profile friction drag coefficient:
Wing.Cdf = canard_cdf*ones(N,1);
% section profile pressure pressure drag coefficient
Wing.Cdp = canard_cdp*ones(N,1);


% wing chord:
Wing.chord = c_canard*ones(N,1);
% angle of section zero-lift line above c-axis:
Wing.alpha = canard_alpha0*ones(N,1);
% section pitching moment coefficient:
Wing.Cm = canard_cm*ones(N,1);
% section CL upper and lower limits:
Wing.CLmax = canard_clmax*ones(N,1);
Wing.CLmin = canard_clmin*ones(N,1);
% section lift-curve slope: 
Wing.dCLda = canard_clalpha*ones(N,1);
% section control derivative derivatives
Wing.dCLdF1 = zeros(N,1);
Wing.dCMdF1 = zeros(N,1);

Wing.dCLdF2 = zeros(N,1);
Wing.dCMdF2 = zeros(N,1);
aircraft.Wing = Wing


VTail.Status = true(1);
% VTail.Status = false(1);

VTail.Name = "VTail";
VTail.BeamIndex = 2;
VTail.N = length(theta); % number of nodes
N = VTail.N;


%%%%%%%%%%%%%%%%%%%%%% Geometrical paramters: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Position of local csn frame origin  
VTail.x = (0.25*(c_canard-c_wing)+L)*ones(N,1);
VTail.y = b_wing/4 - (b_wing/4)*cos(theta);
VTail.y = VTail.y';
VTail.z = G*ones(N,1);
VTail.t = VTail.y;
% local twist
VTail.twist = zeros(N,1);
% position of center of gravity in the csn frame:
VTail.Ccg  = zeros(N,1);
VTail.Ncg  = zeros(N,1);
% second position of center of gravity in the csn frame: (wet VTail)
VTail.DCcg  = zeros(N,1);
VTail.DNcg  = zeros(N,1);

% tension axis position in the csn frame:
VTail.Cta  = zeros(N,1);
VTail.Nta  = zeros(N,1);

% elastic axis position in the csn frame:
VTail.Cea  = zeros(N,1);
VTail.Nea  = zeros(N,1);

% Beam radius for both fuselage or VTails:
% recover the volumic effect of airfoil thickness on local induced velocity
% using slender body theory.

VTail.R = 0.0*c_wing*ones(N,1);

% distance/chord from leading edge to s-axis (c,n origin):
VTail.Xax = zeros(N,1);

%%%%%%%%%%%%%%%%%%%%%%% Structural paramters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
VTail.EIcc = zeros(N,1);
VTail.EInn = zeros(N,1);
VTail.EIcn = zeros(N,1);
VTail.EIcs = zeros(N,1);
VTail.EIsn = zeros(N,1);
VTail.GJ = zeros(N,1);
VTail.EA = zeros(N,1);
VTail.GKc = zeros(N,1);
VTail.GKn = zeros(N,1);
VTail.tdeps = zeros(N,1);
VTail.tdgam = zeros(N,1);

%%%%%%%%%%%%%%%%%%%%%%% mass and inertial parameters %%%%%%%%%%%%%%%%%%%%%%

% 1rst weigth over length:
VTail.mg = 0.1*ones(N,1);
% 1rst section rotational weight-inertia/length about it mass centroid:
VTail.mgcc = zeros(N,1);
VTail.mgnn = zeros(N,1);



% 2nd weigth over length :
VTail.Dmg = zeros(N,1);
% 2nd section rotational weight-inertia/length about it mass centroid:
VTail.Dmgcc = zeros(N,1);
VTail.Dmgnn = zeros(N,1);



%%%%%%%%%%%%%%%%%%%%%%% Aerodynamic parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% section profile friction drag coefficient:
VTail.Cdf = wing_cdf*ones(N,1);
% section profile pressure pressure drag coefficient
VTail.Cdp = wing_cdp*ones(N,1);



% VTail chord:
VTail.chord = c_wing*ones(N,1);
% angle of section zero-lift line above c-axis:
VTail.alpha = wing_alpha0*ones(N,1);
% section pitching moment coefficient:
VTail.Cm = wing_cm*ones(N,1);
% section CL upper and lower limits:
VTail.CLmax = wing_clmax*ones(N,1);
VTail.CLmin = wing_clmin*ones(N,1);
% section lift-curve slope: 
VTail.dCLda = wing_clalpha*ones(N,1);
% section control derivative derivatives
VTail.dCLdF3 = zeros(N,1);
VTail.dCMdF3= zeros(N,1);

VTail.dCLdF4 = VTail.dCLdF3
VTail.dCMdF4 = VTail.dCMdF3
aircraft.VTail = VTail


aircraft.Fuselage.Status = false(1);

aircraft.Struts.Status = false(1);
aircraft.engines.Status = false(1);
aircraft.Sensor.Status = false(1);


aircraft.Reference.Sref =c_wing*b_wing;
aircraft.Reference.Cref = c_wing;
aircraft.Reference.Bref = b_wing;
aircraft.Reference.Xmom = 0;
aircraft.Reference.Ymom = 0.0;
aircraft.Reference.Zmom = 0.0;
aircraft.Reference.Xacc = 0;
aircraft.Reference.Yacc = 0.0;
aircraft.Reference.Zacc = 0.0;
aircraft.Reference.Xvel = 0;
aircraft.Reference.Yvel = 0.0;
aircraft.Reference.Zvel = 0.0;

aircraft.Point_Mass.Status = false(1);
aircraft.Ground.Nbeam = 1;
aircraft.Ground.t = 0.0;
aircraft.Ground.Kground = 0;

aircraft.Joint.Status = true(1);
aircraft.Joint.N = 1;
aircraft.Joint.Nbeam1 = [1]';
aircraft.Joint.Nbeam2 = [2]';
aircraft.Joint.t1 = [0.0]';
aircraft.Joint.t2 = [0.0]';


aircraft_to_aswing(aircraft)

%%
aircraft.Name = 'Tandem_GAW2_L163_G05_Fore_Only';


Wing.Status = true(1);
% Wing.Status = false(1);
Wing.Name = "Canard";
Wing.BeamIndex = 1;
Wing.N = length(theta); % number of nodes
N = Wing.N;


%%%%%%%%%%%%%%%%%%%%%% Geometrical paramters: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Position of local csn frame origin  
Wing.x = zeros(N,1);
Wing.y = b_canard/4-(b_canard/4)*cos(theta);
Wing.y = Wing.y'
Wing.z = zeros(N,1);
Wing.t = Wing.y;
Wing.R = 0.08*c_canard*ones(N,1);
% local twist
Wing.twist = twist_canard*ones(N,1);
% position of center of gravity in the csn frame:
Wing.Ccg  = zeros(N,1);
Wing.Ncg  = zeros(N,1);
% second position of center of gravity in the csn frame: (wet wing)
Wing.DCcg  = zeros(N,1);
Wing.DNcg  = zeros(N,1);

% tension axis position in the csn frame:
Wing.Cta  = zeros(N,1);
Wing.Nta  = zeros(N,1);

% elastic axis position in the csn frame:
Wing.Cea  = zeros(N,1);
Wing.Nea  = zeros(N,1);

% Beam radius for both fuselage or wings:
% recover the volumic effect of airfoil thickness on local induced velocity
% using slender body theory.

% Wing.R = zeros(N,1);

% distance/chord from leading edge to s-axis (c,n origin):
Wing.Xax = 0.0*ones(N,1);

%%%%%%%%%%%%%%%%%%%%%%% Structural paramters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Wing.EIcc = zeros(N,1);
Wing.EInn = zeros(N,1);
Wing.EIcn = zeros(N,1);
Wing.EIcs = zeros(N,1);
Wing.EIsn = zeros(N,1);
Wing.GJ = zeros(N,1);
Wing.EA = zeros(N,1);
Wing.GKc = zeros(N,1);
Wing.GKn = zeros(N,1);
Wing.tdeps = zeros(N,1);
Wing.tdgam = zeros(N,1);

%%%%%%%%%%%%%%%%%%%%%%% mass and inertial parameters %%%%%%%%%%%%%%%%%%%%%%

% 1rst weigth over length:
Wing.mg = 0.1*ones(N,1);
% 1rst section rotational weight-inertia/length about it mass centroid:
Wing.mgcc = zeros(N,1);
Wing.mgnn = zeros(N,1);



% 2nd weigth over length :
Wing.Dmg = zeros(N,1);
% 2nd section rotational weight-inertia/length about it mass centroid:
Wing.Dmgcc = zeros(N,1);
Wing.Dmgnn = zeros(N,1);



%%%%%%%%%%%%%%%%%%%%%%% Aerodynamic parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% section profile friction drag coefficient:
Wing.Cdf = canard_cdf*ones(N,1);
% section profile pressure pressure drag coefficient
Wing.Cdp = canard_cdp*ones(N,1);


% wing chord:
Wing.chord = c_canard*ones(N,1);
% angle of section zero-lift line above c-axis:
Wing.alpha = canard_alpha0*ones(N,1);
% section pitching moment coefficient:
Wing.Cm = canard_cm*ones(N,1);
% section CL upper and lower limits:
Wing.CLmax = canard_clmax*ones(N,1);
Wing.CLmin = canard_clmin*ones(N,1);
% section lift-curve slope: 
Wing.dCLda = canard_clalpha*ones(N,1);
% section control derivative derivatives
Wing.dCLdF1 = zeros(N,1);
Wing.dCMdF1 = zeros(N,1);

Wing.dCLdF2 = zeros(N,1);
Wing.dCMdF2 = zeros(N,1);
aircraft.Wing = Wing



VTail.Status = false(1);
aircraft.VTail = VTail


aircraft.Fuselage.Status = false(1);

aircraft.Struts.Status = false(1);
aircraft.engines.Status = false(1);
aircraft.Sensor.Status = false(1);


aircraft.Reference.Sref =c_wing*b_wing;
aircraft.Reference.Cref = c_wing;
aircraft.Reference.Bref = b_wing;
aircraft.Reference.Xmom = 0;
aircraft.Reference.Ymom = 0.0;
aircraft.Reference.Zmom = 0.0;
aircraft.Reference.Xacc = 0;
aircraft.Reference.Yacc = 0.0;
aircraft.Reference.Zacc = 0.0;
aircraft.Reference.Xvel = 0;
aircraft.Reference.Yvel = 0.0;
aircraft.Reference.Zvel = 0.0;

aircraft.Point_Mass.Status = false(1);
aircraft.Ground.Nbeam = 1;
aircraft.Ground.t = 0.0;
aircraft.Ground.Kground = 0;

aircraft.Joint.Status = false(1)
aircraft.Joint.N = 1;
aircraft.Joint.Nbeam1 = [1 1]';
aircraft.Joint.Nbeam2 = [2 3]';
aircraft.Joint.t1 = [0.0 0.0]';
aircraft.Joint.t2 = [0.0 0.0]';


aircraft_to_aswing(aircraft)

%% RUN SIMULATION

system('./Tandem_GAW2_L163_G05.sh')
%%
system('./Tandem_GAW2_L163_G05_Fore_Only.sh')

%% Airframe impact
close all
T2 = readtable('Tandem_GAW2_L163_G05_Fore_Only.txt','NumHeaderLines',3);
T1 = readtable('Tandem_GAW2_L163_G05.txt','NumHeaderLines',3);
T = readtable('NASA-LANGLEYLS10413.csv','NumHeaderLines',2);
T3 = readtable('NASA_Tandem_l163_g05.csv','NumHeaderLines',2);



figure(1)

x = T.Var5;
y = T.Var6;
p= polyfit(x,y,1);
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'--k',LineWidth=1)
leg1 = "$cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on


x = T1.Var3(1:end-11);
y = T1.Var6(1:end-11);
p_ASW= polyfit(x,y,1);
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'-r',LineWidth=1)
err_ASW = 100*(p_ASW(1)-p(1))/p(1);
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on

x = T.Var1(1:end-5)
y = T.Var2(1:end-5);
p_LLT= polyfit(x,y,1);
yfit = polyval(p_LLT,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,':b',LineWidth=1)
err_LLT= 100*(p_LLT(1)-p(1))/p(1);
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";
hold on

x = T.Var3(1:end-5)
y = T.Var4(1:end-5);
p_CFD= polyfit(x,y,1);
yfit = polyval(p_CFD,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'Color',[0 0.5 0],LineWidth=1,LineStyle='-.')
err_CFD = 100*(p_CFD(1)-p(1))/p(1);
leg4 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_CFD)+ "\%)$";
hold on



plot(T.Var5,T.Var6,'ks',LineWidth=1,MarkerSize=10)
hold on
plot(T1.Var3,T1.Var6,'r*',LineWidth=1,MarkerSize=10)
hold on
plot(T.Var1,T.Var2,'bd',LineWidth=1,MarkerSize=10)
hold on 
plot(T.Var3,T.Var4,'o','Color',[0 0.5 0],LineWidth=1,MarkerSize=10)
hold on 
grid on


xlim([-7.5 12.5])
ylim([-0.2 1.8])
legend(leg1,leg2,leg3,leg4,"Exp","ASWING 5.96","Cheng & Wang's LLT","Cheng & Wang's CFD",'Interpreter','latex',Location='southoutside')
xlabel("\alpha in deg")
ylabel("C_L")

%%



figure(2)

x = T3.Var3(1:end-14);
y = T3.Var4(1:end-14);
p= polyfit(x,y,1);
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'--k',LineWidth=1)
leg1 = "$cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on



x = T2.Var3(1:end-12);
y = T2.Var6(1:end-12);
p_ASW= polyfit(x,y,1);
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'-r',LineWidth=1)
err_ASW = 100*(p_ASW(1)-p(1))/p(1);
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on

x = T.Var7(1:end-5);
y = T.Var8(1:end-5);
p_LLT= polyfit(x,y,1);
yfit = polyval(p_LLT,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,':b',LineWidth=1)
err_LLT= 100*(p_LLT(1)-p(1))/p(1);
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";
hold on

x = T.Var9(1:end-5)
y = T.Var10(1:end-5);
p_CFD= polyfit(x,y,1);
yfit = polyval(p_CFD,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'Color',[0 0.5 0],LineWidth=1,LineStyle='-.')
err_CFD = 100*(p_CFD(1)-p(1))/p(1);
leg4 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_CFD)+ "\%)$";
hold on



plot(T3.Var3,T3.Var4,'ks',MarkerSize=10)
hold on
plot(T2.Var3,T2.Var6,'r*',MarkerSize=10)
hold on
plot(T.Var7,T.Var8,'bd',MarkerSize=10)
hold on 
plot(T.Var9,T.Var10,'o','Color',[0 0.5 0],LineWidth=1,MarkerSize=10)
hold on 
% xlim([-7.5 12.5])
% ylim([-0.2 1.8])
legend(leg1,leg2,leg3,leg4,"Exp","ASWING 5.96","Cheng & Wang's LLT","Cheng & Wang's CFD ",'Interpreter','latex',Location='southoutside')
grid on
xlabel("\alpha in deg")
ylabel("C_L")
%%

figure(3)


x = T.Var17;
y = T.Var18;
p= polyfit(x,y,1);
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'--k',LineWidth=1)
leg1 = "$cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on


x = T1.Var3(1:end-11);
y = T1.Var6(1:end-11)-T2.Var6(1:end-11);
p_ASW= polyfit(x,y,1);
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'-r',LineWidth=1)
err_ASW = 100*(p_ASW(1)-p(1))/p(1);
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on
% 
x = T.Var13(1:end-5);
y = T.Var14(1:end-5);
p_LLT= polyfit(x,y,1);
yfit = polyval(p_LLT,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,':b',LineWidth=1)
err_LLT= 100*(p_LLT(1)-p(1))/p(1);
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";
hold on
% 
x = T.Var15(1:end-5)
y = T.Var16(1:end-5);
p_CFD= polyfit(x,y,1);
yfit = polyval(p_CFD,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'Color',[0 0.5 0],LineWidth=1,LineStyle='-.')
err_CFD = 100*(p_CFD(1)-p(1))/p(1);
leg4 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_CFD)+ "\%)$";
hold on



hold on
plot(T.Var17,T.Var18,'ks',MarkerSize=10)
hold on
plot(T1.Var3(1:end-11),T1.Var6(1:end-11)-T2.Var6(1:end-11),'r*',MarkerSize=10)
hold on
plot(T.Var13,T.Var14,'bd',MarkerSize=10)
hold on 
plot(T.Var15,T.Var16,'o','Color',[0 0.5 0],LineWidth=1,MarkerSize=10)
hold on 

grid on


% xlim([-7.5 12.5])
% ylim([-0.2 1.8])
legend(leg1,leg2,leg3,leg4,"Exp","ASWING 5.96","Cheng & Wang's LLT","Cheng & Wang's CFD ",'Interpreter','latex',Location='southoutside')
xlabel("\alpha in deg")
ylabel("C_L")
% title("CL VS \alpha for NASA/Langley airfoil")


%% CD_VS_CL

T = readtable('NASA_Tandem_CD_VS_CL_l163_g05.csv','NumHeaderLines',2);
figure(4)
plot(T.Var4,T.Var1,'bs',MarkerSize=10)
hold on
plot(T.Var2,T.Var3,'ks',MarkerSize=10)
hold on
plot(T1.Var7(2:end-11),T1.Var6(2:end-11),'-r*',MarkerSize=10)
grid on
xlabel('C_D')
ylabel('C_L')
legend('Experiment : Uncorrected', 'Experiment : Corrected','ASWING 5.96')
% 
figure(5)
% plot(T3.Var1(1:length(T.Var2)-1),T.Var4(2:end),'r--o')
% hold on
plot(T3.Var1(1:length(T.Var2)-1),T.Var2(2:end),'-rs')
hold on
plot(T1.Var3(2:end-11),T1.Var7(2:end-11),'-b*')
grid on
xlabel('\alpha in degree')
ylabel('CD')
legend( 'Experiment : Corrected','ASWING LLT prediction')


figure(6)
plot(T3.Var1(1:length(T.Var2)-1),T.Var3(2:end)./T.Var4(2:end),'-bs')
hold on
plot(T3.Var1(1:length(T.Var2)-1),T.Var1(2:end)./T.Var2(2:end),'-kd')
hold on
plot(T1.Var3(2:end-11),T1.Var6(2:end-11)./T1.Var7(2:end-11),'-go')
grid on
xlabel('\alpha')
ylabel('CL/CD')
legend('Experiment : Uncorrected', 'Experiment : Corrected','ASWING LLT prediction')
title("CL/CD VS \alpha: ASWING LLT prediction agreement with experimental data")

