%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Conversion of the wing tip into a 6 point mass system (Clean version)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



Ixx = 3858E-6;

Iyy = 680E-6;

Izz = 2807E-6;

m = 520E-3;

x = real(sqrt( (3/2)* (Iyy + Izz - Ixx) / m ));
y = real(sqrt( (3/2)* (Izz + Ixx - Iyy) / m ));
z = real(sqrt( (3/2) *(Ixx + Iyy - Izz) / m ));

Xcg =  -0.02308 ;
Ycg = 1179.9E-3;
Zcg = 0;

Xcg+x
Xcg-x
Ycg+y
Ycg-y
z
-z

m/6

disp([1 Ycg Xcg+x Ycg Zcg m/6 0 0 0 0 0 0;
 1 Ycg Xcg-x Ycg Zcg m/6 0 0 0 0 0 0; 
 1 Ycg+y Xcg Ycg+y Zcg m/6 0 0 0 0 0 0;
 1 Ycg-y Xcg Ycg-y Zcg m/6 0 0 0 0 0 0;
 1 Ycg Xcg Ycg Zcg+z m/6 0 0 0 0 0 0;
 1 Ycg Xcg Ycg Zcg-z m/6 0 0 0 0 0 0;
 1 -Ycg Xcg+x -Ycg Zcg m/6 0 0 0 0 0 0;
 1 -Ycg Xcg-x -Ycg Zcg m/6 0 0 0 0 0 0; 
 1 -Ycg+y Xcg -Ycg+y Zcg m/6 0 0 0 0 0 0;
 1 -Ycg-y Xcg -Ycg-y Zcg m/6 0 0 0 0 0 0;
 1 -Ycg Xcg -Ycg Zcg+z m/6 0 0 0 0 0 0;
 1 -Ycg Xcg -Ycg Zcg-z m/6 0 0 0 0 0 0;])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Conversion of the wing tip into a 6 point mass system (Tab version)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



Ixx = 2162E-6;

Iyy = 615E-6;

Izz = 2742E-6;

m = 563E-3;

x = real(sqrt( (3/2)* (Iyy + Izz - Ixx) / m ));
y = real(sqrt( (3/2)* (Izz + Ixx - Iyy) / m ));
z = real(sqrt( (3/2) *(Ixx + Iyy - Izz) / m ));

Xcg =  -0.0475 ;
Ycg = 1159.6E-3;
Zcg = 0;

Xcg+x
Xcg-x
Ycg+y
Ycg-y
z
-z

m/6

disp([2 Ycg Xcg+x Ycg Zcg m/6 0 0 0 0 0 0;
 2 Ycg Xcg-x Ycg Zcg m/6 0 0 0 0 0 0; 
 2 Ycg+y Xcg Ycg+y Zcg m/6 0 0 0 0 0 0;
 2 Ycg-y Xcg Ycg-y Zcg m/6 0 0 0 0 0 0;
 2 Ycg Xcg Ycg Zcg+z m/6 0 0 0 0 0 0;
 2 Ycg Xcg Ycg Zcg-z m/6 0 0 0 0 0 0;
 3 -Ycg Xcg+x -Ycg Zcg m/6 0 0 0 0 0 0;
 3 -Ycg Xcg-x -Ycg Zcg m/6 0 0 0 0 0 0; 
 3 -Ycg+y Xcg -Ycg+y Zcg m/6 0 0 0 0 0 0;
 3 -Ycg-y Xcg -Ycg-y Zcg m/6 0 0 0 0 0 0;
 3 -Ycg Xcg -Ycg Zcg+z m/6 0 0 0 0 0 0;
 3 -Ycg Xcg -Ycg Zcg-z m/6 0 0 0 0 0 0;])

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inner beam section stiffness properties
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Steel rectangular spar:

% The width and thickness of the aluminium spar were 30 mm and 5 mm,


w = 30E-3
t = 5E-3


Ixx = (w*t^3)/12;
Izz = (t*w^3)/12;

E = 193E9;

% w/t = 3.9583 -> beta = 4

J = 0.299*w*t^3

G =79.3E9

EIcc = E*Ixx

EInn = E*Izz


GJ = G*J

%EIcc = 60.3125;
%EInn = 2.1712e+03;
%GJ   = 88.9151;


% 3D printed rectangular spar:

% The width and thickness of the aluminium spar were 30 mm and 5 mm,


w = 19.3E-3
t = 13.3E-3


Ixx = (w*t^3)/12;
Izz = (t*w^3)/12;

E = 193E9;

% w/t = 1.4511 -> beta = 0.196

J = 0.196*w*t^3

E = 1.65E9;
v = 0.3
G =E/2*(1+v)

EIcc = E*Ixx

EInn = E*Izz


GJ = G*J

%EIcc = 6.2433
%EInn = 13.1470
%GJ   = 9.5448



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inner section weight paramater
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Steel beam:


L = 105
Icc = (171E-6)/0.105


Icc2 = (269E-6)/0.125


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Other experimental data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Table_5_8 = [-2.5 31.7 32.0;
             2.5 26.4 26.2;
             5.5 23.0 23.2;
             8.8 20.6 20.7];




Table_5_9 = [20 22.5 23.7;
            10 24 24.4;
            0 25.8 26.2;
            -10 28 28.9];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Static Response
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Fig_5_14_Exp = readtable("Experimental_data/Figure_5_14.csv",NumHeaderLines=2)




Fig_5_14_Asw_Alpha_2_5 = readtable('Fig_5_14_Asw_Alpha_2_5.txt',NumHeaderLines=3);
Asw_Alpha_2_5_V = Fig_5_14_Asw_Alpha_2_5.Var3
Asw_Alpha_2_5_phi = 0.5*(Fig_5_14_Asw_Alpha_2_5.Var5-Fig_5_14_Asw_Alpha_2_5.Var8)


Fig_5_14_Asw_Alpha_5 = readtable('Fig_5_14_Asw_Alpha_5.txt',NumHeaderLines=3);
Asw_Alpha_5_V = Fig_5_14_Asw_Alpha_5.Var3
Asw_Alpha_5_phi = 0.5*(Fig_5_14_Asw_Alpha_5.Var5-Fig_5_14_Asw_Alpha_5.Var8)


Fig_5_14_Asw_Alpha_7_5 = readtable('Fig_5_14_Asw_Alpha_7_5.txt',NumHeaderLines=3);
Asw_Alpha_7_5_V = Fig_5_14_Asw_Alpha_7_5.Var3
Asw_Alpha_7_5_phi = 0.5*(Fig_5_14_Asw_Alpha_7_5.Var5-Fig_5_14_Asw_Alpha_7_5.Var8)


Fig_5_14_Asw_Alpha_10 = readtable('Fig_5_14_Asw_Alpha_10.txt',NumHeaderLines=3);
Asw_Alpha_10_V = Fig_5_14_Asw_Alpha_10.Var3
Asw_Alpha_10_phi = 0.5*(Fig_5_14_Asw_Alpha_10.Var5-Fig_5_14_Asw_Alpha_10.Var8)

figure(1)
plot(Fig_5_14_Exp.Var1,Fig_5_14_Exp.Var2,'rs',MarkerFaceColor='r',MarkerSize=8)
hold on
plot(Fig_5_14_Exp.Var3,Fig_5_14_Exp.Var4,'bo',MarkerFaceColor='b',MarkerSize=8)
hold on
plot(Fig_5_14_Exp.Var5,Fig_5_14_Exp.Var6,'kd',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(Fig_5_14_Exp.Var7,Fig_5_14_Exp.Var8,'v',MarkerFaceColor=[0 0.5 0],MarkerEdgeColor=[0 0.5 0],MarkerSize=8)
hold on
plot(Asw_Alpha_2_5_V,Asw_Alpha_2_5_phi,'--r',LineWidth=1.5)
hold on
plot(Asw_Alpha_5_V,Asw_Alpha_5_phi,'-b',LineWidth=1.5)
hold on
plot(Asw_Alpha_7_5_V,Asw_Alpha_7_5_phi,'-.k',LineWidth=1.5)
hold on
plot(Asw_Alpha_10_V,Asw_Alpha_10_phi,':',Color=[0 0.5 0],LineWidth=1.5)
grid on
xlabel('Airspeed')
ylabel('Fold angle in deg')
ylim([-40 30])

xlim([12.5 27.5])
legend('Exp : \alpha = 2.5^\circ','Exp : \alpha = 5^\circ','Exp : \alpha = 7.5^\circ','Exp : \alpha = 10^\circ')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NACA 0015 flap analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Re = 300E3

deltaF = [-20 -10 0 10 20]

alpha0_1 = [7.109 3.933 0 -3.936 -7.109];

cm0_1 = [0.1274 0.0759 0 -0.0759 -0.1274];


%Re = 220E3


alpha0_2 = [6.625 3.444 0 -3.444 -6.625];

cm0_2 = [0.1179 0.0664 0 -0.0664 -0.1179];

figure(3)
subplot(1,2,1)
plot(deltaF,alpha0_1,'--bs')
grid on
p1 = polyfit(deltaF,alpha0_1,1);
p2 = polyfit(deltaF,alpha0_2,1);

dclddF = [p1(1) p2(1)]*5.7897*pi/180 

hold on
plot(deltaF,alpha0_2,'-ro')
xlabel('angle of attacj')
ylabel('\alpha_0')
subplot(1,2,2)
plot(deltaF,cm0_1,'--bs')
hold on
plot(deltaF,cm0_2,'-ro')

p1 = polyfit(deltaF,cm0_1,1);
p2 = polyfit(deltaF,cm0_2,1);

dcmddF = [p1(1) p2(1)]
xlabel('angle of attacj')
ylabel('C_{m,0}')
grid on 
legend('Re = 300E3','220E3')