clear all;
close all;
clc


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Conversion Freq to wave length for the 1-cos gust
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


data = readtable('Experiments_Data/Folding_WINGTIP_7_6.csv',NumHeaderLines=2);

Freq = data.Var1

chord = 0.078;

V = 22;

k = 2*pi*Freq*chord/V

lambda = V./Freq

Vz = data.Var2
 

Tmax = 3*lambda/V

Te = Tmax/100


[-lambda zeros(length(lambda),1) lambda Vz]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Conversion of the wing tip into a 6 point mass system
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



Ixx = 115.56E-6;

Iyy = 18.9E-6;

Izz = 115.56E-6;

m = 61.0E-3;

x = sqrt( (3/2)* (Iyy + Izz - Ixx) / m );
y = sqrt( (3/2)* (Izz + Ixx - Iyy) / m );
z = sqrt( (3/2) *(Ixx + Iyy - Izz) / m );

Xcg =  -0.0139 ;
Ycg = 424.3E-3;
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
%% Conversion of the Root Inner Section into a 6 point mass system
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



Ixx = 8.4E-6;

Iyy = 9.1E-6;

Izz = 8.4E-6;

m = 20.3E-3;

x = sqrt( (3/2)* (Iyy + Izz - Ixx) / m );
y = sqrt( (3/2)* (Izz + Ixx - Iyy) / m );
z = sqrt( (3/2) *(Ixx + Iyy - Izz) / m );

Xcg =  -12.3E-3 ;
Ycg = 17E-3;
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
%% Conversion of the Inner Wing Section A into a 6 point mass system
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



Ixx = 24.8E-6;

Iyy = 13.4E-6;

Izz = 24.8E-6;

m = 29.6E-3;

x = sqrt( (3/2)* (Iyy + Izz - Ixx) / m );
y = sqrt( (3/2)* (Izz + Ixx - Iyy) / m );
z = sqrt( (3/2) *(Ixx + Iyy - Izz) / m );

Xcg =  -12.3E-3 ;
Ycg = 155E-3;
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
%% Conversion of the Inner Wing Section B into a 6 point mass system
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



Ixx = 24.8E-6;

Iyy = 13.4E-6;

Izz = 24.8E-6;

m = 29.6E-3;

x = sqrt( (3/2)* (Iyy + Izz - Ixx) / m );
y = sqrt( (3/2)* (Izz + Ixx - Iyy) / m );
z = sqrt( (3/2) *(Ixx + Iyy - Izz) / m );

Xcg =  -12.3E-3 ;
Ycg = 255E-3;
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
%% Conversion of the Inner Hinge Section into a 6 point mass system
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



Ixx = 2.8E-6;

Iyy = 6.5E-6;

Izz = 6.5E-6;

m = 23E-3;

x = sqrt( (3/2)* (Iyy + Izz - Ixx) / m );
y = sqrt( (3/2)* (Izz + Ixx - Iyy) / m );
z = sqrt( (3/2) *(Ixx + Iyy - Izz) / m );

Xcg =  -12.4E-3 ;
Ycg = 328E-3;
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Aluminium spar properties
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The width and thickness of the aluminium spar were 19 mm and 4.8 mm,


w = 19E-3
t = 4.8E-3


Ixx = (w*t^3)/12;
Izz = (t*w^3)/12;

E = 70E9;

% w/t = 3.9583 -> beta = 4

J = 0.281*w*t^3

G =25.5E9

EIcc = E*Ixx

EInn = E*Izz


GJ = G*J




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 
% system('sh ./FFWT_Fixed.sh')
% system('sh ./FFWT_Removed.sh')
% system('sh ./FFWT_Flare10.sh')
% system('sh ./FFWT_Flare20.sh')
% system('sh ./FFWT_Flare30.sh')




data_1 = readtable("FFWT_Fixed/FFWT_Fixed-1.txt",NumHeaderLines=3);
data_2 = readtable("FFWT_Fixed/FFWT_Fixed-2.txt",NumHeaderLines=3);
data_3 = readtable("FFWT_Fixed/FFWT_Fixed-3.txt",NumHeaderLines=3);
data_4 = readtable("FFWT_Fixed/FFWT_Fixed-4.txt",NumHeaderLines=3);
data_5 = readtable("FFWT_Fixed/FFWT_Fixed-5.txt",NumHeaderLines=3);
data_6 = readtable("FFWT_Fixed/FFWT_Fixed-6.txt",NumHeaderLines=3);
data_7 = readtable("FFWT_Fixed/FFWT_Fixed-7.txt",NumHeaderLines=3);
data_8 = readtable("FFWT_Fixed/FFWT_Fixed-8.txt",NumHeaderLines=3);





FFWT_Fixed_Delta_Max = [max(data_1.Var3)-data_1.Var3(1);
                       max(data_2.Var3)-data_2.Var3(1);
                       max(data_3.Var3)-data_3.Var3(1);
                       max(data_4.Var3)-data_4.Var3(1);
                       max(data_5.Var3)-data_5.Var3(1);
                       max(data_6.Var3)-data_6.Var3(1);
                       max(data_7.Var3)-data_7.Var3(1);
                       max(data_8.Var3)-data_8.Var3(1)]

FFWT_Fixed_Delta_Min = [min(data_1.Var3)-data_1.Var3(1);
                       min(data_2.Var3)-data_2.Var3(1);
                       min(data_3.Var3)-data_3.Var3(1);
                       min(data_4.Var3)-data_4.Var3(1);
                       min(data_5.Var3)-data_5.Var3(1);
                       min(data_6.Var3)-data_6.Var3(1);
                       min(data_7.Var3)-data_7.Var3(1);
                       min(data_8.Var3)-data_8.Var3(1)]


data_1 = readtable("FFWT_Removed/FFWT_Removed-1.txt",NumHeaderLines=3);
data_2 = readtable("FFWT_Removed/FFWT_Removed-2.txt",NumHeaderLines=3);
data_3 = readtable("FFWT_Removed/FFWT_Removed-3.txt",NumHeaderLines=3);
data_4 = readtable("FFWT_Removed/FFWT_Removed-4.txt",NumHeaderLines=3);
data_5 = readtable("FFWT_Removed/FFWT_Removed-5.txt",NumHeaderLines=3);
data_6 = readtable("FFWT_Removed/FFWT_Removed-6.txt",NumHeaderLines=3);
data_7 = readtable("FFWT_Removed/FFWT_Removed-7.txt",NumHeaderLines=3);
data_8 = readtable("FFWT_Removed/FFWT_Removed-8.txt",NumHeaderLines=3);



FFWT_Removed_Delta_Max = [max(data_1.Var3)-data_1.Var3(1);
                       max(data_2.Var3)-data_2.Var3(1);
                       max(data_3.Var3)-data_3.Var3(1);
                       max(data_4.Var3)-data_4.Var3(1);
                       max(data_5.Var3)-data_5.Var3(1);
                       max(data_6.Var3)-data_6.Var3(1);
                       max(data_7.Var3)-data_7.Var3(1);
                       max(data_8.Var3)-data_8.Var3(1)]

FFWT_Removed_Delta_Min = [min(data_1.Var3)-data_1.Var3(1);
                       min(data_2.Var3)-data_2.Var3(1);
                       min(data_3.Var3)-data_3.Var3(1);
                       min(data_4.Var3)-data_4.Var3(1);
                       min(data_5.Var3)-data_5.Var3(1);
                       min(data_6.Var3)-data_6.Var3(1);
                       min(data_7.Var3)-data_7.Var3(1);
                       min(data_8.Var3)-data_8.Var3(1)]

data_1 = readtable("FFWT_Flare10/FFWT_Flare10-1.txt",NumHeaderLines=3);
data_2 = readtable("FFWT_Flare10/FFWT_Flare10-2.txt",NumHeaderLines=3);
data_3 = readtable("FFWT_Flare10/FFWT_Flare10-3.txt",NumHeaderLines=3);
data_4 = readtable("FFWT_Flare10/FFWT_Flare10-4.txt",NumHeaderLines=3);
data_5 = readtable("FFWT_Flare10/FFWT_Flare10-5.txt",NumHeaderLines=3);
data_6 = readtable("FFWT_Flare10/FFWT_Flare10-6.txt",NumHeaderLines=3);
data_7 = readtable("FFWT_Flare10/FFWT_Flare10-7.txt",NumHeaderLines=3);
data_8 = readtable("FFWT_Flare10/FFWT_Flare10-8.txt",NumHeaderLines=3);



FFWT_Flare10_Delta_Max = [max(data_1.Var3)-data_1.Var3(1);
                       max(data_2.Var3)-data_2.Var3(1);
                       max(data_3.Var3)-data_3.Var3(1);
                       max(data_4.Var3)-data_4.Var3(1);
                       max(data_5.Var3)-data_5.Var3(1);
                       max(data_6.Var3)-data_6.Var3(1);
                       max(data_7.Var3)-data_7.Var3(1);
                       max(data_8.Var3)-data_8.Var3(1)]

FFWT_Flare10_Delta_Min = [min(data_1.Var3)-data_1.Var3(1);
                       min(data_2.Var3)-data_2.Var3(1);
                       min(data_3.Var3)-data_3.Var3(1);
                       min(data_4.Var3)-data_4.Var3(1);
                       min(data_5.Var3)-data_5.Var3(1);
                       min(data_6.Var3)-data_6.Var3(1);
                       min(data_7.Var3)-data_7.Var3(1);
                       min(data_8.Var3)-data_8.Var3(1)]



data_1 = readtable("FFWT_Flare20/FFWT_Flare20-1.txt",NumHeaderLines=3);
data_2 = readtable("FFWT_Flare20/FFWT_Flare20-2.txt",NumHeaderLines=3);
data_3 = readtable("FFWT_Flare20/FFWT_Flare20-3.txt",NumHeaderLines=3);
data_4 = readtable("FFWT_Flare20/FFWT_Flare20-4.txt",NumHeaderLines=3);
data_5 = readtable("FFWT_Flare20/FFWT_Flare20-5.txt",NumHeaderLines=3);
data_6 = readtable("FFWT_Flare20/FFWT_Flare20-6.txt",NumHeaderLines=3);
data_7 = readtable("FFWT_Flare20/FFWT_Flare20-7.txt",NumHeaderLines=3);
data_8 = readtable("FFWT_Flare20/FFWT_Flare20-8.txt",NumHeaderLines=3);



FFWT_Flare20_Delta_Max = [max(data_1.Var3)-data_1.Var3(1);
                       max(data_2.Var3)-data_2.Var3(1);
                       max(data_3.Var3)-data_3.Var3(1);
                       max(data_4.Var3)-data_4.Var3(1);
                       max(data_5.Var3)-data_5.Var3(1);
                       max(data_6.Var3)-data_6.Var3(1);
                       max(data_7.Var3)-data_7.Var3(1);
                       max(data_8.Var3)-data_8.Var3(1)]

FFWT_Flare20_Delta_Min = [min(data_1.Var3)-data_1.Var3(1);
                       min(data_2.Var3)-data_2.Var3(1);
                       min(data_3.Var3)-data_3.Var3(1);
                       min(data_4.Var3)-data_4.Var3(1);
                       min(data_5.Var3)-data_5.Var3(1);
                       min(data_6.Var3)-data_6.Var3(1);
                       min(data_7.Var3)-data_7.Var3(1);
                       min(data_8.Var3)-data_8.Var3(1)]

data_1 = readtable("FFWT_Flare30/FFWT_Flare30-1.txt",NumHeaderLines=3);
data_2 = readtable("FFWT_Flare30/FFWT_Flare30-2.txt",NumHeaderLines=3);
data_3 = readtable("FFWT_Flare30/FFWT_Flare30-3.txt",NumHeaderLines=3);
data_4 = readtable("FFWT_Flare30/FFWT_Flare30-4.txt",NumHeaderLines=3);
data_5 = readtable("FFWT_Flare30/FFWT_Flare30-5.txt",NumHeaderLines=3);
data_6 = readtable("FFWT_Flare30/FFWT_Flare30-6.txt",NumHeaderLines=3);
data_7 = readtable("FFWT_Flare30/FFWT_Flare30-7.txt",NumHeaderLines=3);
data_8 = readtable("FFWT_Flare30/FFWT_Flare30-8.txt",NumHeaderLines=3);



FFWT_Flare30_Delta_Min = [min(data_1.Var3)-data_1.Var3(1);
                       min(data_2.Var3)-data_2.Var3(1);
                       min(data_3.Var3)-data_3.Var3(1);
                       min(data_4.Var3)-data_4.Var3(1);
                       min(data_5.Var3)-data_5.Var3(1);
                       min(data_6.Var3)-data_6.Var3(1);
                       min(data_7.Var3)-data_7.Var3(1);
                       min(data_8.Var3)-data_8.Var3(1)]

FFWT_Flare30_Delta_Max = [max(data_1.Var3)-data_1.Var3(1);
                       max(data_2.Var3)-data_2.Var3(1);
                       max(data_3.Var3)-data_3.Var3(1);
                       max(data_4.Var3)-data_4.Var3(1);
                       max(data_5.Var3)-data_5.Var3(1);
                       max(data_6.Var3)-data_6.Var3(1);
                       max(data_7.Var3)-data_7.Var3(1);
                       max(data_8.Var3)-data_8.Var3(1)]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comparison with experimental data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

exp_data = readtable("Experiments_Data/Folding_WINGTIP_7_26.csv",NumHeaderLines=2)
ft2m = 0.7;
g = 9.81


figure(1)
subplot(1,4,1)
plot(Freq,Vz,'--vb',MarkerFaceColor='b',MarkerSize=8,LineWidth=1.5)
grid on 
xlabel('Frequency in Hz')
ylabel('V_z in m/s')
ylim([0 1.2*max(Vz)])
title('Gust family')
set(gca,"FontSize",16)


subplot(1,4,2)
plot(Freq,FFWT_Fixed_Delta_Max,'--b',LineWidth=1.5)
hold on
plot(exp_data.Var3,ft2m*g*exp_data.Var4,'vb',MarkerFaceColor='b',MarkerSize=8)
hold on
plot(Freq,FFWT_Flare10_Delta_Max,'-.k',LineWidth=1.5)
hold on
plot(exp_data.Var5,ft2m*g*exp_data.Var6,'k^',MarkerFaceColor='k',MarkerSize=8)
grid on
xlabel('Frequency in Hz')
ylabel('WRBM increment in Nm')
ylim([0 1])
title('\Lambda = 10^\circ')
set(gca,"FontSize",16)

subplot(1,4,3)
plot(Freq,FFWT_Fixed_Delta_Max,'--b',LineWidth=1.5)
hold on
plot(exp_data.Var3,ft2m*g*exp_data.Var4,'vb',MarkerFaceColor='b',MarkerSize=8)
hold on
plot(Freq,FFWT_Flare20_Delta_Max,'-.r',LineWidth=1.5)
hold on
plot(exp_data.Var7,ft2m*g*exp_data.Var8,'ro',MarkerFaceColor='r',MarkerSize=8)
grid on
xlabel('Frequency in Hz')
ylabel(['WRBM increment in Nm'])
ylim([0 1])
title('\Lambda = 20^\circ')
set(gca,"FontSize",16)


subplot(1,4,4)
plot(Freq,FFWT_Fixed_Delta_Max,'--b',LineWidth=1.5)
hold on
plot(exp_data.Var3,ft2m*g*exp_data.Var4,'vb',MarkerFaceColor='b',MarkerSize=8)
hold on
plot(Freq,FFWT_Flare30_Delta_Max,'-.',Color=[0 0.5 0],LineWidth=1.5)
hold on
plot(exp_data.Var9,ft2m*g*exp_data.Var10,'s',MarkerFaceColor=[0 0.5 0],Color=[0 0.5 0],MarkerSize=8)
grid on
xlabel('Frequency in Hz')
ylabel(['WRBM increment in Nm'])
ylim([0 1])
title('\Lambda = 30^\circ')
set(gca,"FontSize",16)


exp_data = readtable("Experiments_Data/Folding_WINGTIP_7_26.csv",NumHeaderLines=2)
ft2m = 1;
g = 1


