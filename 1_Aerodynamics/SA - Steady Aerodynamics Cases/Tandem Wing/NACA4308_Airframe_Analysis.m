clear all
close all
clc


aircraft.Name = 'Tandem_Airframe_NACA4309';
L = 0.89;
G = -0.101;





N = 40;
b_canard = 2.1805;
b_wing = 2.0425;

c_canard = .129;
c_wing = .129;

% L = L*c_wing;
% G = G*c_wing;

twist_canard = 0;
twist_wing = 0;


canard_cdf = 0.006;
canard_cdp =  0.0140;
% canard_clalpha = ;
canard_clalpha = 6.11;
canard_clmax = 1.2;
canard_clmin = -.3;
canard_alpha0 = 3.9;
canard_cm = 0;



wing_cdf = 0.006;
wing_cdp = 0.0140;
% wing_clalpha = 6.1994;
wing_clalpha = 6.11;
wing_clmax = 1.2;
wing_clmin = -.3;
wing_alpha0 = 3.9;
wing_cm = 0;


theta = 0:pi/N:pi;



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
Wing.mg = 0.0*ones(N,1);
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
VTail.mg = 0.0*ones(N,1);
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

% aircraft.Fuselage.Status = false(1);
aircraft.Fuselage.Name = 'Airframe'
aircraft.Fuselage.BeamIndex = 3;
aircraft.Fuselage.Status = true(1);
aircraft.Fuselage.x = -0.1:0.05:0.89+(3/4)*c_wing;
aircraft.Fuselage.x = aircraft.Fuselage.x'
aircraft.Fuselage.y = zeros(length(aircraft.Fuselage.x),1);
aircraft.Fuselage.t = aircraft.Fuselage.x
aircraft.Fuselage.z = -abs(0.129)/2*ones(length(aircraft.Fuselage.x),1);
R_begin = 0:0.129/20:0.129/2;
R_fin = 0.129/2:-0.129/20:0;
aircraft.Fuselage.R = [abs(0.129)/2*ones(length(aircraft.Fuselage.x),1)];
N = length(aircraft.Fuselage.x);

aircraft.Fuselage.Ccg  = zeros(N,1);
aircraft.Fuselage.Ncg  = zeros(N,1);

% second position of center of gravity in the csn frame: (wet Fuselage)
aircraft.Fuselage.DCcg  = zeros(N,1);
aircraft.Fuselage.DNcg  = zeros(N,1);

% tension axis position in the csn frame:
aircraft.Fuselage.Cta  = zeros(N,1);
aircraft.Fuselage.Nta  = zeros(N,1);

% elastic axis position in the csn frame:
aircraft.Fuselage.Cea  = zeros(N,1);
aircraft.Fuselage.Nea  = zeros(N,1);




%%%%%%%%%%%%%%%%%%%%%%% Structural paramters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
aircraft.Fuselage.EIcc = zeros(N,1);
aircraft.Fuselage.EInn = zeros(N,1);
aircraft.Fuselage.EIcn = zeros(N,1);
aircraft.Fuselage.EIcs = zeros(N,1);
aircraft.Fuselage.EIsn = zeros(N,1);
aircraft.Fuselage.GJ = zeros(N,1);
aircraft.Fuselage.EA = zeros(N,1);
aircraft.Fuselage.GKc = zeros(N,1);
aircraft.Fuselage.GKn = zeros(N,1);
aircraft.Fuselage.tdeps = zeros(N,1);
aircraft.Fuselage.tdgam = zeros(N,1);

%%%%%%%%%%%%%%%%%%%%%%% mass and inertial parameters %%%%%%%%%%%%%%%%%%%%%%

% 1rst weigth over length:
aircraft.Fuselage.mg = 0.1*ones(N,1);
% 1rst section rotational weight-inertia/length about it mass centroid:
aircraft.Fuselage.mgcc = zeros(N,1);
aircraft.Fuselage.mgnn = zeros(N,1);



% 2nd weigth over length :
aircraft.Fuselage.Dmg = zeros(N,1);
% 2nd section rotational weight-inertia/length about it mass centroid:
aircraft.Fuselage.Dmgcc = zeros(N,1);
aircraft.Fuselage.Dmgnn = zeros(N,1);



%%%%%%%%%%%%%%%%%%%%%%% Aerodynamic parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% section profile friction drag coefficient:
aircraft.Fuselage.Cdf = 0.005*ones(N,1);
% section profile pressure pressure drag coefficient
aircraft.Fuselage.Cdp = 0.012*ones(N,1);


aircraft.Struts.Status = false(1);
aircraft.engines.Status = false(1);
aircraft.Sensor.Status = false(1);


aircraft.Reference.Sref =(b_wing*c_wing+b_canard*c_canard);
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
aircraft.Joint.Nbeam1 = [1 1]';
aircraft.Joint.Nbeam2 = [2 3]';
aircraft.Joint.t1 = [0.0 0.0]';
aircraft.Joint.t2 = [0.0 0.0]';


aircraft_to_aswing(aircraft)

%%
aircraft.Name = 'Tandem_Airframe_NACA4309_Fore_Only';


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
Wing.mg = 0.0*ones(N,1);
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


aircraft.Reference.Sref =(b_wing*c_wing+b_canard*c_canard);
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

system('./Tandem_Airframe_NACA4309.sh')
% system('./Tandem_Airframe_NACA4309_Fore_Only.sh')

%% Airframe impact
T = readtable('Airframe_impact.csv','NumHeaderLines',2);
T1 = readtable('Tandem_Airframe_NACA4309.txt','NumHeaderLines',3)
T2 = readtable('Tandem_Airframe_NACA4309_Fore_Only.txt','NumHeaderLines',3)
close all

% figure(1)
% plot(T1.Var3,T1.Var6,'-gd')
% hold on 
% plot(T.Var13,T.Var14,'--bd')
% hold on
% plot(T.Var5,T.Var6,'-rd')
% hold on
% plot(T.Var11,T.Var12,'-kd')
% hold on
% plot(T.Var1,T.Var2,'-ro')
% hold on 
% plot(T.Var15,T.Var16,'--bo')
% hold on
% plot(T2.Var3,T2.Var6,'--go')
% hold on
% plot(T.Var7,T.Var8,'-ko')
% hold on
% plot(T.Var3,T.Var4,'-r+')
% hold on 
% plot(T.Var17,T.Var18,'--b+')
% hold on
% plot(T2.Var3,T1.Var6-T2.Var6,'--g+')
% hold on
% plot(T.Var9,T.Var10,'--k+')
% grid on
% xlim([-7 13])
% ylim([-0.3 1.3])
% % legend('ASWING LLT total',"Cheng & Wang's CFD (2018) total without airframe","Cheng & Wang's CFD (2018) total with airframe","Cheng & Wang's LLT (2018)   total",...
% %     'ASWING LLT fore',"Cheng & Wang's CFD (2018) fore without airframe","Cheng & Wang's CFD (2018) fore with airframe","Cheng & Wang's LLT (2018)  fore",...
% %     'ASWING LLT hinge',"Cheng & Wang's CFD (2018) hinge without airframe","Cheng & Wang's CFD (2018) hinge with airframe","Cheng & Wang's LLT (2018)   hinge")
% xlabel("angle of attack \alpha in degree")
% ylabel("CL lift coefficient")
% title("CL VS \alpha for configuration with airframe")



figure(2)

x = T.Var15(2:end-2);
y = T.Var16(2:end-2);
p_CFD= polyfit(x,y,1);
yfit = polyval(p_CFD,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'--k')
leg1 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on

x = T2.Var3(3:end-4);
y = T2.Var6(3:end-4);
p_ASW= polyfit(x,y,1)
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'-r')
err_ASW = 100*(p_ASW(1)-p_CFD(1))/p_CFD(1);
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on

x = T.Var7(2:end-2);
y = T.Var8(2:end-2);
p_LLT= polyfit(x,y,1);
yfit = polyval(p_LLT,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'-.b')
err_LLT = 100*(p_LLT(1)-p_CFD(1))/p_CFD(1);
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";


hold on
plot(T.Var15,T.Var16,'ks',MarkerSize=10)
hold on
plot(T2.Var3,T2.Var6,'r*',MarkerSize=10)
hold on
plot(T.Var7,T.Var8,'bo',MarkerSize=10)
legend(leg1,leg2,leg3,"Cheng & al's CFD","ASWING 5.96","Cheng & al's LLT",'Interpreter','latex',Location='southoutside')
grid on
xlabel("\alpha in deg")
ylabel("Lift Coefficient")
title("Foward wing")

figure(3)

x = T.Var17(2:end-1);
y = T.Var18(2:end-1);
p_CFD= polyfit(x,y,1);
yfit = polyval(p_CFD,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'--k')
leg1 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on

x = T2.Var3(3:end-4);
y = T1.Var6(3:end-4)-T2.Var6(3:end-4);
p_ASW= polyfit(x,y,1)
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'-r')
err_ASW = 100*(p_ASW(1)-p_CFD(1))/p_CFD(1);
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on

x = T.Var9(2:end-2);
y = T.Var10(2:end-2);
p_LLT= polyfit(x,y,1);
yfit = polyval(p_LLT,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'-.b')
err_LLT = 100*(p_LLT(1)-p_CFD(1))/p_CFD(1);
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";

plot(T.Var17,T.Var18,'ks',MarkerSize=10)
hold on
plot(T2.Var3,T1.Var6-T2.Var6,'r*',MarkerSize=10)
hold on
plot(T.Var9,T.Var10,'bo',MarkerSize=10)
legend(leg1,leg2,leg3,"Cheng & al's CFD","Aswing 5.96","Cheng & al's LLT",'Interpreter','latex',Location='southoutside')
grid on
xlabel("\alpha in deg")
ylabel("Lift Coefficient")
title("Backward wing")

figure(4)

x = T.Var13(2:end-2);
y = T.Var14(2:end-2);
p_CFD= polyfit(x,y,1);
yfit = polyval(p_CFD,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
mean(rsq);
hold on
plot(x,yfit,'--k')
leg1 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+")$";
hold on

x = T1.Var3(3:end-4);
y = T1.Var6(3:end-4);
p_ASW= polyfit(x,y,1)
yfit = polyval(p_ASW,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'-r')
err_ASW = 100*(p_ASW(1)-p_CFD(1))/p_CFD(1);
leg2 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_ASW)+ "\%)$";
hold on

x =T.Var11(2:end-2);
y = T.Var12(2:end-2);
p_LLT= polyfit(x,y,1);
yfit = polyval(p_LLT,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal;
hold on
plot(x,yfit,'-.b')
err_LLT = 100*(p_LLT(1)-p_CFD(1))/p_CFD(1);
leg3 = "$ cl_\alpha \ fit \ (r^2 = "+num2str(rsq)+" \ , \epsilon_{cl_\alpha} = " + num2str(err_LLT)+ "\%)$";

plot(T.Var13,T.Var14,'ks',MarkerSize=10)
hold on
plot(T1.Var3,T1.Var6,'r*',MarkerSize=10)
hold on 
plot(T.Var11,T.Var12,'bo',MarkerSize=10)

legend(leg1,leg2,leg3,"Cheng & al's CFD","ASWING 5.96","Cheng & al's LLT",'Interpreter','latex',Location='southoutside')
grid on
xlabel("\alpha in deg")
ylabel("Lift Coefficient")
title('Total')
% 

