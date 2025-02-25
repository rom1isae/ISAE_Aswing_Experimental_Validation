clear all
close all
clc

Figure7 = readtable('Experimental_data/Figure7.csv',NumHeaderLines=2);
Figure17 = readtable('Experimental_data/Figure17.csv',NumHeaderLines=2)
Figure24 = readtable('Experimental_data/Figure24.csv',NumHeaderLines=2);

Aswing_Figure7 = readtable('ASWING_simulations/Figure7.csv',NumHeaderLines=2);
Aswing_Figure17 = readtable('ASWING_simulations/Figure17.csv',NumHeaderLines=2);
Aswing_Figure24_only = readtable('ASWING_simulations/W_only_polaire_totale.txt',NumHeaderLines=3);
Aswing_Figure24_WB = readtable('ASWING_simulations/WB_polaire_totale.txt',NumHeaderLines=3);
Aswing_Figure24_WB_infinite_fuselage = readtable('ASWING_simulations/WB_polaire_totale_infinite_fuselage.txt',NumHeaderLines=3);


Wing_only_data_alpha_4_7 = [ 
  0.0    0.0   0.375E+00    0.534E+00    
  0.179E+00    0.179E+00    0.363E+00    0.559E+00    
  0.270E+00    0.270E+00    0.350E+00    0.582E+00    
  0.364E+00    0.364E+00    0.338E+00    0.602E+00    
  0.460E+00    0.460E+00    0.325E+00    0.621E+00    
  0.559E+00    0.559E+00    0.311E+00    0.638E+00    
  0.660E+00    0.660E+00    0.298E+00    0.653E+00    
  0.763E+00    0.763E+00    0.284E+00    0.667E+00    
  0.867E+00    0.867E+00    0.270E+00    0.680E+00    
  0.971E+00    0.971E+00    0.256E+00    0.690E+00    
  0.107E+01    0.107E+01    0.243E+00    0.696E+00    
  0.117E+01    0.117E+01    0.230E+00    0.698E+00    
  0.126E+01    0.126E+01    0.218E+00    0.691E+00    
  0.135E+01    0.135E+01    0.207E+00    0.671E+00    
  0.143E+01    0.143E+01    0.198E+00    0.627E+00    
  0.149E+01    0.149E+01    0.190E+00    0.549E+00    
  0.154E+01    0.154E+01    0.184E+00    0.428E+00    
  0.158E+01    0.158E+01    0.179E+00    0.269E+00    
  0.161E+01    0.161E+01    0.177E+00    0.854E-01    
  0.162E+01    0.162E+01    0.000E+00    0.000E+00    
 ];


Wing_only_data_alpha_8_8 = [  0.0    0.0   0.375E+00    0.992E+00    
  0.179E+00    0.179E+00    0.363E+00    0.104E+01    
  0.270E+00    0.270E+00    0.350E+00    0.107E+01    
  0.364E+00    0.364E+00    0.338E+00    0.111E+01    
  0.460E+00    0.460E+00    0.325E+00    0.114E+01    
  0.559E+00    0.559E+00    0.311E+00    0.117E+01    
  0.660E+00    0.660E+00    0.298E+00    0.120E+01    
  0.763E+00    0.763E+00    0.284E+00    0.123E+01    
  0.867E+00    0.867E+00    0.270E+00    0.125E+01    
  0.971E+00    0.971E+00    0.256E+00    0.126E+01    
  0.107E+01    0.107E+01    0.243E+00    0.127E+01    
  0.117E+01    0.117E+01    0.230E+00    0.128E+01    
  0.126E+01    0.126E+01    0.218E+00    0.126E+01    
  0.135E+01    0.135E+01    0.207E+00    0.122E+01    
  0.143E+01    0.143E+01    0.198E+00    0.114E+01    
  0.149E+01    0.149E+01    0.190E+00    0.993E+00    
  0.154E+01    0.154E+01    0.184E+00    0.764E+00    
  0.158E+01    0.158E+01    0.179E+00    0.464E+00    
  0.161E+01    0.161E+01    0.177E+00    0.130E+00    
  0.162E+01    0.162E+01    0.000E+00    0.000E+00    ];


Wing_only_data_alpha_12_9 = [ 0.0   0.0   0.375E+00    0.145E+01    
  0.179E+00    0.179E+00    0.363E+00    0.151E+01    
  0.270E+00    0.270E+00    0.350E+00    0.156E+01    
  0.364E+00    0.364E+00    0.338E+00    0.161E+01    
  0.460E+00    0.460E+00    0.325E+00    0.166E+01    
  0.559E+00    0.559E+00    0.311E+00    0.170E+01    
  0.660E+00    0.660E+00    0.298E+00    0.173E+01    
  0.763E+00    0.763E+00    0.284E+00    0.176E+01    
  0.867E+00    0.867E+00    0.270E+00    0.179E+01    
  0.971E+00    0.971E+00    0.256E+00    0.181E+01    
  0.107E+01    0.107E+01    0.243E+00    0.182E+01    
  0.117E+01    0.117E+01    0.230E+00    0.182E+01    
  0.126E+01    0.126E+01    0.218E+00    0.180E+01    
  0.135E+01    0.135E+01    0.207E+00    0.174E+01    
  0.143E+01    0.143E+01    0.198E+00    0.162E+01    
  0.149E+01    0.149E+01    0.190E+00    0.140E+01    
  0.154E+01    0.154E+01    0.184E+00    0.106E+01    
  0.158E+01    0.158E+01    0.179E+00    0.615E+00    
  0.161E+01    0.161E+01    0.177E+00    0.154E+00    
  0.162E+01    0.162E+01    0.000E+00    0.000E+00    ];



Wing_Body_data_alpha_4_7 = [ 0.456E-01    0.456E-01    0.384E+00    0.512E+00    
  0.912E-01    0.912E-01    0.377E+00    0.525E+00    
  0.137E+00    0.137E+00    0.371E+00    0.539E+00    
  0.183E+00    0.183E+00    0.365E+00    0.552E+00    
  0.230E+00    0.230E+00    0.359E+00    0.564E+00    
  0.277E+00    0.277E+00    0.352E+00    0.576E+00    
  0.325E+00    0.325E+00    0.346E+00    0.587E+00    
  0.373E+00    0.373E+00    0.340E+00    0.597E+00    
  0.423E+00    0.423E+00    0.333E+00    0.607E+00    
  0.472E+00    0.472E+00    0.326E+00    0.617E+00    
  0.523E+00    0.523E+00    0.319E+00    0.626E+00    
  0.574E+00    0.574E+00    0.313E+00    0.635E+00    
  0.626E+00    0.626E+00    0.306E+00    0.643E+00    
  0.678E+00    0.678E+00    0.298E+00    0.651E+00    
  0.731E+00    0.731E+00    0.291E+00    0.659E+00    
  0.784E+00    0.784E+00    0.284E+00    0.666E+00    
  0.838E+00    0.838E+00    0.277E+00    0.673E+00    
  0.891E+00    0.891E+00    0.270E+00    0.679E+00    
  0.944E+00    0.944E+00    0.263E+00    0.684E+00    
  0.997E+00    0.997E+00    0.256E+00    0.689E+00    
  0.105E+01    0.105E+01    0.249E+00    0.693E+00    
  0.110E+01    0.110E+01    0.242E+00    0.696E+00    
  0.115E+01    0.115E+01    0.235E+00    0.698E+00    
  0.120E+01    0.120E+01    0.229E+00    0.697E+00    
  0.125E+01    0.125E+01    0.223E+00    0.695E+00    
  0.129E+01    0.129E+01    0.217E+00    0.690E+00    
  0.134E+01    0.134E+01    0.211E+00    0.681E+00    
  0.138E+01    0.138E+01    0.206E+00    0.667E+00    
  0.142E+01    0.142E+01    0.201E+00    0.646E+00    
  0.145E+01    0.145E+01    0.196E+00    0.618E+00    
  0.149E+01    0.149E+01    0.192E+00    0.579E+00    
  0.152E+01    0.152E+01    0.188E+00    0.530E+00    
  0.154E+01    0.154E+01    0.185E+00    0.469E+00    
  0.156E+01    0.156E+01    0.182E+00    0.398E+00    
  0.158E+01    0.158E+01    0.180E+00    0.316E+00    
  0.160E+01    0.160E+01    0.178E+00    0.226E+00    
  0.161E+01    0.161E+01    0.177E+00    0.131E+00    
  0.161E+01    0.161E+01    0.177E+00    0.357E-01    
  0.162E+01    0.162E+01    0.000E+00    0.000E+00    ];


Wing_Body_data_alpha_8_8 = [   0.456E-01    0.456E-01    0.384E+00    0.956E+00    
  0.912E-01    0.912E-01    0.377E+00    0.978E+00    
  0.137E+00    0.137E+00    0.371E+00    0.100E+01    
  0.183E+00    0.183E+00    0.365E+00    0.102E+01    
  0.230E+00    0.230E+00    0.359E+00    0.104E+01    
  0.277E+00    0.277E+00    0.352E+00    0.106E+01    
  0.325E+00    0.325E+00    0.346E+00    0.108E+01    
  0.373E+00    0.373E+00    0.340E+00    0.110E+01    
  0.423E+00    0.423E+00    0.333E+00    0.112E+01    
  0.472E+00    0.472E+00    0.326E+00    0.114E+01    
  0.523E+00    0.523E+00    0.319E+00    0.115E+01    
  0.574E+00    0.574E+00    0.313E+00    0.117E+01    
  0.626E+00    0.626E+00    0.306E+00    0.118E+01    
  0.678E+00    0.678E+00    0.298E+00    0.120E+01    
  0.731E+00    0.731E+00    0.291E+00    0.121E+01    
  0.784E+00    0.784E+00    0.284E+00    0.122E+01    
  0.838E+00    0.838E+00    0.277E+00    0.123E+01    
  0.891E+00    0.891E+00    0.270E+00    0.124E+01    
  0.944E+00    0.944E+00    0.263E+00    0.125E+01    
  0.997E+00    0.997E+00    0.256E+00    0.126E+01    
  0.105E+01    0.105E+01    0.249E+00    0.127E+01    
  0.110E+01    0.110E+01    0.242E+00    0.127E+01    
  0.115E+01    0.115E+01    0.235E+00    0.128E+01    
  0.120E+01    0.120E+01    0.229E+00    0.127E+01    
  0.125E+01    0.125E+01    0.223E+00    0.127E+01    
  0.129E+01    0.129E+01    0.217E+00    0.126E+01    
  0.134E+01    0.134E+01    0.211E+00    0.124E+01    
  0.138E+01    0.138E+01    0.206E+00    0.121E+01    
  0.142E+01    0.142E+01    0.201E+00    0.117E+01    
  0.145E+01    0.145E+01    0.196E+00    0.112E+01    
  0.149E+01    0.149E+01    0.192E+00    0.105E+01    
  0.152E+01    0.152E+01    0.188E+00    0.952E+00    
  0.154E+01    0.154E+01    0.185E+00    0.836E+00    
  0.156E+01    0.156E+01    0.182E+00    0.698E+00    
  0.158E+01    0.158E+01    0.180E+00    0.542E+00    
  0.160E+01    0.160E+01    0.178E+00    0.374E+00    
  0.161E+01    0.161E+01    0.177E+00    0.200E+00    
  0.161E+01    0.161E+01    0.177E+00    0.453E-01    
  0.162E+01    0.162E+01    0.000E+00    0.000E+00    ];


Wing_Body_data_alpha_12_9 = [ 0.456E-01    0.456E-01    0.384E+00    0.141E+01    
  0.912E-01    0.912E-01    0.377E+00    0.144E+01    
  0.137E+00    0.137E+00    0.371E+00    0.147E+01    
  0.183E+00    0.183E+00    0.365E+00    0.149E+01    
  0.230E+00    0.230E+00    0.359E+00    0.152E+01    
  0.277E+00    0.277E+00    0.352E+00    0.155E+01    
  0.325E+00    0.325E+00    0.346E+00    0.158E+01    
  0.373E+00    0.373E+00    0.340E+00    0.160E+01    
  0.423E+00    0.423E+00    0.333E+00    0.162E+01    
  0.472E+00    0.472E+00    0.326E+00    0.165E+01    
  0.523E+00    0.523E+00    0.319E+00    0.167E+01    
  0.574E+00    0.574E+00    0.313E+00    0.169E+01    
  0.626E+00    0.626E+00    0.306E+00    0.171E+01    
  0.678E+00    0.678E+00    0.298E+00    0.173E+01    
  0.731E+00    0.731E+00    0.291E+00    0.174E+01    
  0.784E+00    0.784E+00    0.284E+00    0.176E+01    
  0.838E+00    0.838E+00    0.277E+00    0.177E+01    
  0.891E+00    0.891E+00    0.270E+00    0.178E+01    
  0.944E+00    0.944E+00    0.263E+00    0.179E+01    
  0.997E+00    0.997E+00    0.256E+00    0.180E+01    
  0.105E+01    0.105E+01    0.249E+00    0.181E+01    
  0.110E+01    0.110E+01    0.242E+00    0.182E+01    
  0.115E+01    0.115E+01    0.235E+00    0.182E+01    
  0.120E+01    0.120E+01    0.229E+00    0.181E+01    
  0.125E+01    0.125E+01    0.223E+00    0.181E+01    
  0.129E+01    0.129E+01    0.217E+00    0.179E+01    
  0.134E+01    0.134E+01    0.211E+00    0.177E+01    
  0.138E+01    0.138E+01    0.206E+00    0.173E+01    
  0.142E+01    0.142E+01    0.201E+00    0.167E+01    
  0.145E+01    0.145E+01    0.196E+00    0.158E+01    
  0.149E+01    0.149E+01    0.192E+00    0.147E+01    
  0.152E+01    0.152E+01    0.188E+00    0.133E+01    
  0.154E+01    0.154E+01    0.185E+00    0.115E+01    
  0.156E+01    0.156E+01    0.182E+00    0.944E+00    
  0.158E+01    0.158E+01    0.180E+00    0.714E+00    
  0.160E+01    0.160E+01    0.178E+00    0.472E+00    
  0.161E+01    0.161E+01    0.177E+00    0.237E+00    
  0.161E+01    0.161E+01    0.177E+00    0.485E-01    
  0.162E+01    0.162E+01    0.000E+00    0.000E+00  ];

chord_mean = 0.42;
chord_mean = 2*chord_mean/sqrt(2); % in ASWING, the lift coeffcient is 
% computed relatively to the unswept chord. So the correction on the mean
% chord of the wing. 


figure(1)
plot(Figure7.Var1,Figure7.Var2,'sr',MarkerFaceColor='r',MarkerSize=8)
hold on
plot(Figure7.Var7,Figure7.Var8,'dk',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(Wing_only_data_alpha_4_7(:,2)/Wing_only_data_alpha_4_7(end,2), Wing_only_data_alpha_4_7(:,4).*Wing_only_data_alpha_4_7(:,3)/chord_mean,'-r',MarkerFaceColor='r',LineWidth=1.5)
hold on
plot(Wing_Body_data_alpha_4_7(:,2)/Wing_Body_data_alpha_4_7(end,2), Wing_Body_data_alpha_4_7(:,4).*Wing_Body_data_alpha_4_7(:,3)/chord_mean,'-.k',MarkerFaceColor='k',LineWidth=1.5)
hold on

xlabel('y/b')
ylabel('$c_l c/\bar{c}$','Interpreter','latex')
% legend('Wing only : exp','Wing+Body: exp','Wing only : ASWING','Wing+Body : ASWING',Location='southwest')
title('\alpha = 4.7^\circ')
grid on
set(gca,fontsize=14)


figure(2)
plot(Figure7.Var3,Figure7.Var4,'sr',MarkerFaceColor='r',MarkerSize=8)
hold on
plot(Figure7.Var9,Figure7.Var10,'dk',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(Wing_only_data_alpha_8_8(:,2)/Wing_only_data_alpha_8_8(end,2), Wing_only_data_alpha_8_8(:,4).*Wing_only_data_alpha_8_8(:,3)/chord_mean,'-r',MarkerFaceColor='r',LineWidth=1.5)
hold on
plot(Wing_Body_data_alpha_8_8(:,2)/Wing_Body_data_alpha_8_8(end,2), Wing_Body_data_alpha_8_8(:,4).*Wing_Body_data_alpha_8_8(:,3)/chord_mean,'-.k',MarkerFaceColor='k',LineWidth=1.5)
hold on
xlabel('y/b')
ylabel('$c_l c/\bar{c}$','Interpreter','latex')
legend('Wing only : exp','Wing+Body: exp','Wing only : ASWING','Wing+Body : ASWING',Location='southwest')
title('\alpha = 8.8^\circ')
grid on
set(gca,fontsize=14)


figure(3)
plot(Figure7.Var5,Figure7.Var6,'sr',MarkerFaceColor='r',MarkerSize=8)
hold on
plot(Figure7.Var11,Figure7.Var12,'dk',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(Wing_only_data_alpha_12_9(:,2)/Wing_only_data_alpha_12_9(end,2), Wing_only_data_alpha_12_9(:,4).*Wing_only_data_alpha_12_9(:,3)/chord_mean,'-r',MarkerFaceColor='r',LineWidth=1.5)
hold on
plot(Wing_Body_data_alpha_12_9(:,2)/Wing_Body_data_alpha_12_9(end,2), Wing_Body_data_alpha_12_9(:,4).*Wing_Body_data_alpha_12_9(:,3)/chord_mean,'-.k',MarkerFaceColor='k',LineWidth=1.5)
hold on
xlabel('y/b')
ylabel('$c_l c/\bar{c}$','Interpreter','latex')
legend('Wing only : exp','Wing+Body: exp','Wing only : ASWING','Wing+Body : ASWING',Location='southwest')
title('\alpha = 12.9^\circ')
set(gca,fontsize=14)
grid on




figure(4)
Sfuse = 6.352488928255092 * 0.0254 * 21.941*0.0254 * 2; % R*2*C_root
Swing = 1.301;
correction_factor = 1-(Sfuse/Swing);
% correction_factor = 1;
% plot(Figure24.Var1,Figure24.Var2,'sk',MarkerFaceColor='k',MarkerSize=8)
% hold on
plot(Figure24.Var3,Figure24.Var4,'sr',MarkerFaceColor='r',MarkerSize=8)
hold on
plot(Figure24.Var5,Figure24.Var6,'vb',MarkerFaceColor='b',MarkerSize=8)
hold on
% plot(Aswing_Figure24_WB.Var5,Aswing_Figure24_WB.Var6,'-k',LineWidth=1.5)
% hold on
plot(Aswing_Figure24_WB.Var5,correction_factor*Aswing_Figure24_WB.Var6,'-.r',LineWidth=1.5)
hold on
plot(Aswing_Figure24_only.Var5,correction_factor*Aswing_Figure24_only.Var6,'--b',LineWidth=1.5)
hold on
plot(Aswing_Figure24_WB_infinite_fuselage.Var5,correction_factor*Aswing_Figure24_WB_infinite_fuselage.Var6,':o',Color=[0 0.5 0],LineWidth=1.5,MarkerSize=3)

xlabel('\alpha in deg')
ylabel('C_L')
grid on
% legend('W+B : balance, exp','W+B: wing pressure, exp','Wing Only, exp',...
%     'W+B : balance, ASWING','W+B: wing pressure, ASWING','Wing Only, ASWING',...
%     Location='southwest')
legend('W+B: wing pressure, exp','Wing Only, exp',...
    'W+B: wing, ASWING','Wing Only, ASWING',...
    'ASWING, W+B_\infty',...
    Location='southwest')
set(gca,fontsize=14)

