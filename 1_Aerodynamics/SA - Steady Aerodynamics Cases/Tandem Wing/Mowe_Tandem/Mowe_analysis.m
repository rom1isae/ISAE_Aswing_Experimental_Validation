clear all
close all





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AIRFOIL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

NACA4309.alpha = -3.9;
NACA4309.CLmax = 1.35;
NACA4309.CLmin = -0.4;
NACA4309.dCLda = 6.11;
NACA4309.Cm = 0.0
NACA4309.Cdf = 0.006;
NACA4309.Cdp = 0.002;
NACA4309.max_thickness = 0.09;

Wing1.airfoil = NACA4309;
Wing2.airfoil = NACA4309;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NON MOVING PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Wing1.b = 2.55;
Wing2.b = 2.55;

Wing1.c = 0.21;
Wing2.c = 0.21;

Wing1.b_ratio = 1.0/2.4;
Wing2.b_ratio = 1.0/2.4;

Wing1.X0 = 0;
Wing1.Y0 = 0;
Wing1.Z0 = 0;

Wing1.Xshift = 0.25;
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


Wing2.Y0 = 0;
Wing2.Z0 = -0.5*Wing1.c;
% %%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % WING Only
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wing2.Status = false(1)
% 
% 
% %%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wing1.c = 2.*0.21;
% Wing1.b =2.55;
% Wing2.X0 = Wing1.X0 + 0.25*Wing1.c -0.25*Wing2.c + (1.5)*Wing1.c;
% Wing2.Status = false(1)
% Fuselage.Status = false(1);
% Generate_Mowe(Wing1,Wing2,Fuselage);
% [x,y] = system('./Mowe_temp.sh');
% 
% Wing_Only_T = readtable('Mowe_temp.txt','NumHeaderLines',3)
% Mowe_data.Wingonly = Wing_Only_T
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%
Wing2.Status = true(1)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stagger analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Stagger Analysis")
Wing1.b = 2.55;
Wing1.c = 0.21






for i = 1:5
    clear T;
    Wing2.X0 = Wing1.X0 + 0.25*Wing1.c -0.25*Wing2.c + (1.5+1.0*i)*Wing1.c;
    clear Fuselage;
    Fuselage = Fuselage(Wing1,Wing2,40,0.2);
    Fuselage.Status = true(1);
    Generate_Mowe(Wing1,Wing2,Fuselage)  ;
    Fuselage.Status = false(1);
    Generate_Mowe(Wing1,Wing2,Fuselage)  ;
    [x,y] = system('./Mowe_temp.sh');
    [x,y] =system('./Mowe_frame_temp.sh');
    Stagger_T{i} = readtable('Mowe_temp.txt','NumHeaderLines',3)
    Stagger_T_frame{i} = readtable('Mowe_frame_temp.txt','NumHeaderLines',3)
    
end
Mowe_data.Stagger = Stagger_T;
Mowe_data.Stagger_frame = Stagger_T_frame;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gap analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Gap Analysis")

for i = 1:5
    clear T;
    Wing2.X0 = Wing1.X0 + 0.25*Wing1.c -0.25*Wing2.c + (1.5)*Wing1.c;
    Wing2.Z0 = Wing1.Z0 - (1.0-0.4*i)*Wing2.c
    clear Fuselage;
    Fuselage = Fuselage(Wing1,Wing2,40,0.2);
    Fuselage.Status = true(1);
    Generate_Mowe(Wing1,Wing2,Fuselage)  ;
    Fuselage.Status = false(1);
    Generate_Mowe(Wing1,Wing2,Fuselage)  ;
    [x,y] =system('./Mowe_temp.sh');
    [x,y] =system('./Mowe_frame_temp.sh');
    Gap_T{i} = readtable('Mowe_temp.txt','NumHeaderLines',3)
    Gap_T_frame{i} = readtable('Mowe_frame_temp.txt','NumHeaderLines',3)
    
end
Mowe_data.Gap = Gap_T;
Mowe_data.Gap_frame = Gap_T_frame;

%%
disp("Dihedral1 angle")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wing1 Dihedral angle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')


for i = 1:5
    
    Wing2.X0 = Wing1.X0 + 0.25*Wing1.c -0.25*Wing2.c + (3.0)*Wing1.c;
    Wing2.Z0 = Wing1.Z0 - 0.5*Wing1.c;
    Wing1.Lambda = 0+1.0*(i-1);
    clear Fuselage;
    Fuselage = Fuselage(Wing1,Wing2,40,0.2);
    Fuselage.Status = true(1);
    Generate_Mowe(Wing1,Wing2,Fuselage)  ;
%     Fuselage.Status = false(1);
%     Generate_Mowe(Wing1,Wing2,Fuselage)  ;
%     [x,y] =system('./Mowe_temp.sh');
    [x,y] =system('./Mowe_frame_temp.sh')
%     Dihedral1_T{i} = readtable('Mowe_temp.txt','NumHeaderLines',3)
    Dihedral1_T_frame{i} = readtable('Mowe_frame_temp.txt','NumHeaderLines',3)
    
end
% Mowe_data.Dihedral1 = Dihedral1_T;
Mowe_data.Dihedral1_frame = Dihedral1_T_frame;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  WING2 Dihedral angle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Dihedral2 Analysis")

for i = 1:5
    
    Wing2.X0 = Wing1.X0 + 0.25*Wing1.c -0.25*Wing2.c + (3.0)*Wing1.c;
    Wing2.Z0 = Wing1.Z0 - 0.5*Wing1.c;
    Wing2.Y0 = 0.0
    Wing1.Lambda = 0;
    Wing2.Lambda = 0+1.0*(i-1);
    Wing1.twist = 0.0;
    Wing2.twist =0.0;
    clear Fuselage;
    Fuselage = Fuselage(Wing1,Wing2,40,0.2);
    Fuselage.Status = true(1);
    Generate_Mowe(Wing1,Wing2,Fuselage)  ;
%     Fuselage.Status = false(1);
%     Generate_Mowe(Wing1,Wing2,Fuselage)  ;
%     system('./Mowe_temp.sh');
    [x,y] =system('./Mowe_frame_temp.sh')
%     Dihedral2_T{i} = readtable('Mowe_temp.txt','NumHeaderLines',3);
    Dihedral2_T_frame{i} = readtable('Mowe_frame_temp.txt','NumHeaderLines',3);
    
end

    
% Mowe_data.Dihedral2 = Dihedral2_T;
Mowe_data.Dihedral2_frame = Dihedral2_T_frame;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dual Dihedral
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Dihedral Dual Analysis")
for i = 1:5
    
    Wing2.X0 = Wing1.X0 + 0.25*Wing1.c -0.25*Wing2.c + (3.0)*Wing1.c;
    Wing2.Z0 = Wing1.Z0 - 0.5*Wing1.c;
    Wing2.Y0 = 0.0
    Wing1.Lambda = 0+1.0*(i-1); 
    Wing2.Lambda = 0+1.0*(i-1);
    Wing1.twist = 0.0;
    Wing2.twist =0.0;
    clear Fuselage;
    Fuselage = Fuselage(Wing1,Wing2,40,0.2);
    Fuselage.Status = true(1);
    Generate_Mowe(Wing1,Wing2,Fuselage)  ;
%     Fuselage.Status = false(1);
%     Generate_Mowe(Wing1,Wing2,Fuselage)  ;
%     system('./Mowe_temp.sh');
    [x,y] =system('./Mowe_frame_temp.sh')
%     Dihedral2_T{i} = readtable('Mowe_temp.txt','NumHeaderLines',3);
    Dihedraldual_T_frame{i} = readtable('Mowe_frame_temp.txt','NumHeaderLines',3);
    
end

%     
% Mowe_data.Dihedral2 = Dihedral2_T;
Mowe_data.Dihedraldual_frame = Dihedraldual_T_frame;


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DUAL Dihedral inverted
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


disp("Dihedral Dual Analysis")
for i = 1:5
    
    Wing2.X0 = Wing1.X0 + 0.25*Wing1.c -0.25*Wing2.c + (3.0)*Wing1.c;
    Wing2.Z0 = Wing1.Z0 - 0.5*Wing1.c;
    Wing2.Y0 = 0.0
    Wing1.Lambda = 0+1.0*(i-1); 
    Wing2.Lambda = 0-1.0*(i-1);
    Wing1.twist = 0.0;
    Wing2.twist =0.0;
    clear Fuselage;
    Fuselage = Fuselage(Wing1,Wing2,40,0.2);
    Fuselage.Status = true(1);
    Generate_Mowe(Wing1,Wing2,Fuselage)  ;
%     Fuselage.Status = false(1);
%     Generate_Mowe(Wing1,Wing2,Fuselage)  ;
%     system('./Mowe_temp.sh');
    [x,y] =system('./Mowe_frame_temp.sh')
%     Dihedral2_T{i} = readtable('Mowe_temp.txt','NumHeaderLines',3);
    Dihedraldual_inverted_T_frame{i} = readtable('Mowe_frame_temp.txt','NumHeaderLines',3);
    
end
Mowe_data.Dihedraldual_inverted = Dihedraldual_inverted_T_frame

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WING1 Twist
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("Twist1 Analysis")
for i = 1:5
    
    Wing2.X0 = Wing1.X0 + 0.25*Wing1.c -0.25*Wing2.c + (3.0)*Wing1.c;
    Wing2.Z0 = Wing1.Z0 - 0.5*Wing1.c;
    Wing1.Lambda = 0;
    Wing2.Lambda = 0;
    Wing1.twist = -5+2*i;
    clear Fuselage;
    Fuselage = Fuselage(Wing1,Wing2,40,0.2);
    Fuselage.Status = true(1);
    Generate_Mowe(Wing1,Wing2,Fuselage)  ;
%     Fuselage.Status = false(1);
%     Generate_Mowe(Wing1,Wing2,Fuselage)  ;
%     system('./Mowe_temp.sh');
    [x,y] =system('./Mowe_frame_temp.sh')
%     Twist1_T{i} = readtable('Mowe_temp.txt','NumHeaderLines',3);
    Twist1_T_frame{i} = readtable('Mowe_frame_temp.txt','NumHeaderLines',3);
    
end

    
% Mowe_data.Twist1 =  Twist1_T;
Mowe_data.Twist1_frame =  Twist1_T_frame;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WING2 twist
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Twist2 Analysis")

for i = 1:5
    
    Wing2.X0 = Wing1.X0 + 0.25*Wing1.c -0.25*Wing2.c + (3.0)*Wing1.c;
    Wing2.Z0 = Wing1.Z0 - 0.5*Wing1.c;
    Wing1.Lambda = 0;
    Wing2.Lambda = 0;
    Wing1.twist = 0;
    Wing2.twist = -5+2*i;
    clear Fuselage;
    Fuselage = Fuselage(Wing1,Wing2,40,0.2);
    Fuselage.Status = true(1);
    Generate_Mowe(Wing1,Wing2,Fuselage)  ;
%     Fuselage.Status = false(1);
%     Generate_Mowe(Wing1,Wing2,Fuselage)  ;
%     system('./Mowe_temp.sh');
    [x,y] =system('./Mowe_frame_temp.sh')
%     Twist2_T{i} = readtable('Mowe_temp.txt','NumHeaderLines',3);
    Twist2_T_frame{i} = readtable('Mowe_frame_temp.txt','NumHeaderLines',3);
    
end

    
% Mowe_data.Twist2 =  Twist2_T;
Mowe_data.Twist2 =  Twist2_T_frame;
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INITAIL GEOMETRY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Wing1.b = 2.55;
Wing2.b = 2.55;

Wing1.c = 0.21;
Wing2.c = 0.21;

Wing1.b_ratio = 1.0/2.4;
Wing2.b_ratio = 1.0/2.4;

Wing1.X0 = 0;
Wing1.Y0 = 0;
Wing1.Z0 = 0;

Wing1.Xshift = 0.25;
Wing1.N = 80;

Wing2.Xshift = 0.25;
Wing2.N = 80;

Wing1.twist = 2;
Wing1.Lambda = 0;

Wing2.twist = 2;
Wing2.Lambda = 0;

Wing2.X0 = Wing1.X0 + 3.0*Wing1.c
Wing2.Y0 = 0;
Wing2.Z0 = -0.5*Wing1.c;

clear Fuselage;
Fuselage = Fuselage(Wing1,Wing2,40,0.2);

Wing1.b = 2.55;
Wing2.b = 2.55;

Wing1.c = 0.21;
Wing2.c = 0.21;

Wing1.b_ratio = 1.0/2.4;
Wing2.b_ratio = 1.0/2.4;

Wing1.X0 = 0;
Wing1.Y0 = 0;
Wing1.Z0 = 0;

Wing1.Xshift = 0.25;
Wing1.N = 80;

Wing2.Xshift = 0.25;
Wing2.N = 80;

Wing1.twist = 2;
Wing1.Lambda = 0;

Wing2.twist = 2;
Wing2.Lambda = 0;

Wing2.X0 = Wing1.X0 + 3.0*Wing1.c
Wing2.Y0 = 0;
Wing2.Z0 = 0.0*Wing1.c;

Fuselage.Status = true(1);
Generate_Mowe(Wing1,Wing2,Fuselage)  ;

[x,y] =system('./Mowe_frame_temp.sh');
Initial = readtable('Mowe_frame_temp.txt','NumHeaderLines',3)
Mowe_data.Initial = Initial



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FINAL GEOMETRY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Geometry_defintion
Wing1.Status = true(1)
Wing2.Status = true(1)
Wing1.b = 2.55;
Wing2.b = 2.55;

Wing1.c = 0.21;
Wing2.c = 0.21;

Wing1.b_ratio = 1.0/2.4;
Wing2.b_ratio = 1.0/2.4;

Wing1.X0 = 0;
Wing1.Y0 = 0;
Wing1.Z0 = 0;

Wing1.Xshift = 0.25;
Wing1.N = 80;

Wing2.Xshift = 0.25;
Wing2.N = 80;

Wing1.twist = 3.0;
Wing1.Lambda = 5;

Wing2.twist = 2.0;
Wing2.Lambda =-5;

Wing2.X0 = Wing1.X0 + 3.0*Wing1.c
Wing2.Y0 = 0;
Wing2.Z0 = -0.5*Wing1.c;

clear Fuselage;
Fuselage = Fuselage(Wing1,Wing2,40,0.2);
Fuselage.Status = true(1);
Generate_Mowe(Wing1,Wing2,Fuselage)
[x,y] =system('./Mowe_frame_temp.sh');
Final = readtable('Mowe_frame_temp.txt','NumHeaderLines',3)
Mowe_data.Final = Final

%%



save('Mowwe_data.mat','Mowe_data')



