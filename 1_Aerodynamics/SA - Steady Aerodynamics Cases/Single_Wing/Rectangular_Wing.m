clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AIRFOIL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

NACA0012.alpha = 0;
NACA0012.CLmax = 1.5;
NACA0012.CLmin = -1.5;
NACA0012.dCLda = 2*pi;
NACA0012.Cm = 0.0
NACA0012.Cdf = 0.00618  - 0.00192 ;
NACA0012.Cdp = 0.00192 ;
NACA0012.max_thickness = 0.12;




Wing1.airfoil = NACA0012;
Wing2.airfoil = NACA0012;


Wing1.status = true(1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NON MOVING PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Wing1.b =2.0554;
% Wing1.b =2.55;
Wing2.b = 0.0;

Wing1.c = 0.3566;
% Wing1.c = 0.42;
Wing2.c = 0.0;

Wing1.b_ratio = 0.0;

Wing2.b_ratio = 0.0;

Wing1.X0 = 0;
Wing1.Y0 = 0;
Wing1.Z0 = 0;


Wing1.Xshift =0.25;
% Wing1.Xshift = 0.25
Wing1.N = 80;

Wing2.Xshift = 0.25;
Wing2.N = 80;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Effect of Stagger [1.5 10.0]*c
% Gap = -0.5c
% twist1 = 2.0
% twist 2 =0.0
% Lambda1 = 0.0
% Lambda2 = 0.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Wing1.twist = 0.0;
Wing1.Lambda = 0.0;

Wing2.twist = 0.0;
Wing2.Lambda = 0.0;

Wing2.X0 = 2.0;
Wing2.Y0 = 0;
Wing2.Z0 = -0.5*Wing1.c;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WING Only
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Wing2.Status = false(1)


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Wing2.Status = false(1)
Fuselage.Status = false(1);
Xfoil_status1 = false(1);
Xfoil_status2 = false(1);
Wing1.Xfoil_Status = false(1);
Wing2.Xfoil_Status = false(1);
    Generate_Mowe(Wing1,Wing2,Fuselage);