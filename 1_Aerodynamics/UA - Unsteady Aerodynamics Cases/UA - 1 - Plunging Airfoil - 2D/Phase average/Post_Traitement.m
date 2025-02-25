clear all ; close all ;clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ALPHA0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all

A0_Exp = readtable('K_094_A0.csv',NumHeaderLines=2);
A5_Exp = readtable('K_094_A5.csv',NumHeaderLines=2);
A9_Exp = readtable('K_094_A9.csv',NumHeaderLines=2);
f = 1.0;
t = linspace(0,1,100);
Static_alpha_exp = A0_Exp.Var3;
Static_CL_exp = A0_Exp.Var4;
k = 0.94;
alpha = k*.5*sin(2*pi*f*t)*180/pi;

Cimp = (1+2*j.*k)./(1+4*j.*k);
cl_05_0 = 0.5*abs(2*pi.*k*j.*Cimp-pi.*k.^2)*cos(2*pi*f*t+angle(2*pi.*k*j.*Cimp-pi.*k.^2)-pi)+2*pi*0;
cl_05_5 = 0.5*abs(2*pi.*k*j.*Cimp-pi.*k.^2)*cos(2*pi*f*t+angle(2*pi.*k*j.*Cimp-pi.*k.^2)-pi)+2*pi*5*pi/180;
cl_05_9 = 0.5*abs(2*pi.*k*j.*Cimp-pi.*k.^2)*cos(2*pi*f*t+angle(2*pi.*k*j.*Cimp-pi.*k.^2)-pi)+2*pi*9*pi/180;

H0 =besselj(0,k)-j*bessely(0,k);
H1 = besselj(1,k)-j*bessely(1,k);

C_Theodorsen =  H1/(j*H0+H1)

CT_0 = 0.5*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)*cos(2*pi*f*t+angle(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)-pi)+2*pi*0;
CT_5 = 0.5*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)*cos(2*pi*f*t+angle(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)-pi)+2*pi*5*pi/180;
CT_9 = 0.5*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)*cos(2*pi*f*t+angle(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)-pi)+1.4;


% Steady aswing

alpha_steady_deg = linspace(-30,45,100);
alpha_steady_rad = pi*alpha_steady_deg/180

CL_min = -0.84;
CL_max = 0.84;

for i= 1:length(alpha_steady_rad)
    if alpha_steady_rad(i) < CL_min/(2*pi)
        cl_steady(i) = CL_min + 2*pi*alpha_steady_rad(i)/40;
    elseif alpha_steady_rad(i) > CL_max/(2*pi)
        cl_steady(i) = CL_max + 2*pi*alpha_steady_rad(i)/40;
    else
        cl_steady(i) = 2*pi*alpha_steady_rad(i)
    end
end

%%


figure(1)
plot(A0_Exp.Var1,A0_Exp.Var2,'sk',LineWidth=1.5,MarkerSize=10.0)
hold on
plot(A0_Exp.Var3,A0_Exp.Var4,'*',Color=[0, 0.5, 0],LineWidth=1.5,MarkerSize=10.0)
hold on
plot(alpha,cl_05_0,'-r',LineWidth=2.0)
hold on
plot(alpha_steady_deg,cl_steady,'-.b',LineWidth=2.0)
grid on
xlabel('\alpha  in deg',FontSize=16)
ylabel('2D lift coefficient',FontSize=16)
legend('Exp Phase average','Exp Static','ASWING phase Average','ASWING Static',Fontsize=14)

%%

figure(2)
plot(A5_Exp.Var1,A5_Exp.Var2,'sk',LineWidth=1.5,MarkerSize=10.0)
hold on
plot(A0_Exp.Var3,A0_Exp.Var4,'*',Color=[0, 0.5, 0],LineWidth=1.5,MarkerSize=10.0)
hold on
plot(alpha+5,cl_05_5,'-r',LineWidth=2.0)
hold on
plot(alpha+5,cl_05_0+0.8,'-.b',LineWidth=2.0)
grid on
xlabel('\alpha  in deg',FontSize=16)
ylabel('2D lift coefficient',FontSize=16)
legend('Exp Phase average','Exp Static','ASWING phase Average','ASWING corrected',Fontsize=14)

%%
figure(3)
plot(A9_Exp.Var1,A9_Exp.Var2,'sk',LineWidth=1.5,MarkerSize=10.0)
hold on
plot(A0_Exp.Var3,A0_Exp.Var4,'*',Color=[0, 0.5, 0],LineWidth=1.5,MarkerSize=10.0)
hold on
plot(alpha+9,cl_05_9,'-r',LineWidth=2.0,MarkerSize=10.0)
hold on
plot(alpha+9,cl_05_0+1.4,'-.b',LineWidth=2.0,MarkerSize=10.0)
grid on
xlabel('\alpha  in deg',FontSize=16)
ylabel('2D lift coefficient',FontSize=16)
legend('Exp Phase average','Exp Static','ASWING phase Average','ASWING corrected',Fontsize=14)


%% k = 0.47

A0_Exp = readtable('K_047_A0.csv',NumHeaderLines=2);
A5_Exp = readtable('K_047_A5.csv',NumHeaderLines=2);
A9_Exp = readtable('K_047_A9.csv',NumHeaderLines=2);
f = 1.0;
t = linspace(0,1,100);

k = 0.47;
alpha = k*.5*sin(2*pi*f*t)*180/pi;

Cimp = (1+2*j.*k)./(1+4*j.*k);
cl_05_0 = 0.5*abs(2*pi.*k*j.*Cimp-pi.*k.^2)*cos(2*pi*f*t+angle(2*pi.*k*j.*Cimp-pi.*k.^2)-pi)+2*pi*0;
cl_05_5 = 0.5*abs(2*pi.*k*j.*Cimp-pi.*k.^2)*cos(2*pi*f*t+angle(2*pi.*k*j.*Cimp-pi.*k.^2)-pi)+2*pi*5*pi/180;
cl_05_9 = 0.5*abs(2*pi.*k*j.*Cimp-pi.*k.^2)*cos(2*pi*f*t+angle(2*pi.*k*j.*Cimp-pi.*k.^2)-pi)+2*pi*9*pi/180;

H0 =besselj(0,k)-j*bessely(0,k);
H1 = besselj(1,k)-j*bessely(1,k);

C_Theodorsen =  H1/(j*H0+H1)

CT_0 = 0.5*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)*cos(2*pi*f*t+angle(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)-pi)+2*pi*0;
CT_5 = 0.5*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)*cos(2*pi*f*t+angle(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)-pi)+2*pi*5*pi/180;
CT_9 = 0.5*abs(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)*cos(2*pi*f*t+angle(2*pi.*k*j.*C_Theodorsen-pi.*k.^2)-pi)+1.4;



% Steady aswing

alpha_steady_deg = linspace(-30,45,100);
alpha_steady_rad = pi*alpha_steady_deg/180

CL_min = -0.84;
CL_max = 0.84;

for i= 1:length(alpha_steady_rad)
    if alpha_steady_rad(i) < CL_min/(2*pi)
        cl_steady(i) = CL_min + 2*pi*alpha_steady_rad(i)/40;
    elseif alpha_steady_rad(i) > CL_max/(2*pi)
        cl_steady(i) = CL_max + 2*pi*alpha_steady_rad(i)/40;
    else
        cl_steady(i) = 2*pi*alpha_steady_rad(i)
    end
end


%%


figure(4)
plot(A0_Exp.Var1,A0_Exp.Var2,'sk',LineWidth=1.5,MarkerSize=10.0)
hold on
plot(Static_alpha_exp,Static_CL_exp,'*',Color=[0, 0.5, 0],LineWidth=1.5,MarkerSize=10.0)
hold on
plot(alpha,cl_05_0,'-r',LineWidth=2.0)
hold on
plot(alpha_steady_deg,cl_steady,'-.b',LineWidth=2.0)
grid on
xlabel('\alpha  in deg',FontSize=16)
ylabel('2D lift coefficient',FontSize=16)
xlim([-15 15])
legend('Exp Phase average','Exp Static','ASWING phase Average','ASWING Static',Fontsize=14)


figure(5)
plot(A5_Exp.Var1,A5_Exp.Var2,'sk',LineWidth=1.5,MarkerSize=10.0)
hold on
plot(Static_alpha_exp,Static_CL_exp,'*',Color=[0, 0.5, 0],LineWidth=1.5,MarkerSize=10.0)
hold on
plot(alpha+5,cl_05_5,'-r',LineWidth=2.0)
hold on
plot(alpha+5,cl_05_0+0.6,'-.b',LineWidth=2.0)
grid on
xlim([-10 20])
xlabel('\alpha  in deg',FontSize=16)
ylabel('2D lift coefficient',FontSize=16)
legend('Exp Phase average','Exp Static','ASWING phase Average','ASWING corrected',Fontsize=14)
%%

% close all
figure(6)
plot(A9_Exp.Var1,A9_Exp.Var2,'sk',LineWidth=1.5,MarkerSize=10.0)
hold on
plot(Static_alpha_exp,Static_CL_exp,'*',Color=[0, 0.5, 0],LineWidth=1.5,MarkerSize=10.0)
hold on
plot(alpha+9,cl_05_9,'-r',LineWidth=2.0,MarkerSize=10.0)
hold on
plot(alpha+9,cl_05_0+1.0,'-.b',LineWidth=2.0,MarkerSize=10.0)
grid on
xlabel('\alpha  in deg',FontSize=16)
ylabel('2D lift coefficient',FontSize=16)
legend('Exp Phase average','Exp Static','ASWING phase Average','ASWING corrected',Fontsize=14)