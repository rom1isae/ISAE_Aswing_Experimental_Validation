clear all
close all

V = readtable('Eliptical_parameters.txt','NumHeaderLines',1);
NV = readtable('Eliptical_parameters_not_varying.txt','NumHeaderLines',1);

y = V.Var3;
chord = V.Var6;
V_alpha0 = V.Var7;
V_dCLda = V.Var8;
V_CLmin = V.Var10;
V_CLmax = V.Var11;
V_Cdf = V.Var12;
V_Cdp = V.Var13;

NV_alpha0 = NV.Var7;
NV_dCLda = NV.Var8;
NV_CLmin = NV.Var10;
NV_CLmax = NV.Var11;
NV_Cdf = NV.Var12;
NV_Cdp = NV.Var13;

Re = 60*chord/1.5111E-5;
V_stream = 60;

V_df = 0.5 * 1.0 * V_stream^2 *chord.* V_Cdf;
NV_df = 0.5 * 1.0 * V_stream^2 * chord.*NV_Cdf;

V_CD = 0;
NV_CD = 0;

for i =1:length(chord)
    if i ==1
      dy = y(1);
    else
       dy = y(i) - y(i-1); 
    end
   V_CD = V_CD + (V_Cdf(i)+V_Cdp(i))*dy; 
   NV_CD = NV_CD + (NV_Cdf(i)+NV_Cdp(i))*dy; 
end

% e_NV_Df = abs(V_Df-NV_Df)

figure(1)
subplot(7,1,1)
plot(y,Re,'-ok')
xlabel("span position y in meters")
ylabel("Reynold number")
grid on
subplot(7,1,2)
plot(y,V_dCLda,'-ro')
hold on 
plot(y,NV_dCLda,'-bo')
grid on
xlabel("span position y in meters")
ylabel("cl camber")
legend('varying XFOIL analysis','constant XFOIL analysis')
subplot(7,1,3)
plot(y,V_alpha0,'-ro')
hold on 
plot(y,NV_alpha0,'-bo')
grid on
xlabel("span position y in meters")
ylabel("zero lift angle of attack in degree")
legend('varying XFOIL analysis','constant XFOIL analysis')
subplot(7,1,4)
plot(y,V_CLmin,'-ro')
hold on 
plot(y,NV_CLmin,'-bo')
grid on
xlabel("span position y in meters")
ylabel("minimum CL")
legend('varying XFOIL analysis','constant XFOIL analysis')
subplot(7,1,5)
plot(y,V_CLmax,'-ro')
hold on 
plot(y,NV_CLmax,'-bo')
grid on
xlabel("span position y in meters")
ylabel("maximum CL")
legend('varying XFOIL analysis','constant XFOIL analysis')
subplot(7,1,6)
plot(y,V_Cdf,'-ro')
hold on 
plot(y,NV_Cdf,'-bo')
grid on
xlabel("span position y in meters")
ylabel("friction drag coefficient")
legend('varying XFOIL analysis','constant XFOIL analysis')
subplot(7,1,7)
plot(y,V_Cdp,'-ro')
hold on 
plot(y,NV_Cdp,'-bo')
grid on
xlabel("span position y in meters")
ylabel("pressure drag coefficient")
legend('varying XFOIL analysis','constant XFOIL analysis')

%%
close all
figure(2)
plot(y,V_df,'ro')
hold on
plot(y,NV_df,'bs')
ylabel('varation of local viscous drag (N/m)')
yyaxis right
hold on
plot(y,V_Cdf,'d','Color',[0, 0.5, 0])
xlabel('span position y in meters')
ylabel('varation of local 2D viscous drag coefficient')
legend('varying XFOIL analysis','constant XFOIL analysis')
grid on
set(gca,{'ycolor'},{[0, 0.5, 0]})
%%
close all
clear all
alpha = -120:0.1:120;
alpha0 = 0;
clmax = 1.5;
clmin = -1.0;
cdp = 0.02;
Dcl = 0.05;
Ks = 40;
cla = 2*pi;
cl = cla*(pi/180)*(alpha-alpha0);
for i = 1:length(alpha)
fstall(i) = Dcl*log((1+exp((cl(i) - clmax)/Dcl))/(1+exp((clmin - cl(i))/Dcl)));
df(i) = (Dcl*(exp(-(cl(i) - clmin)/Dcl) + 1)*(exp((cl(i) - clmax)/Dcl)/(Dcl*(exp(-(cl(i) - clmin)/Dcl) + 1)) + (exp(-(cl(i) - clmin)/Dcl)*(exp((cl(i) - clmax)/Dcl) + 1))/(Dcl*(exp(-(cl(i) - clmin)/Dcl) + 1)^2)))/(exp((cl(i) - clmax)/Dcl) + 1);
clnew(i)  = df(i);
cd(i) = (4*((Ks/(1+Ks))^2)*(sin(alpha(i)*pi/180) - clmax/(4*pi*cla))^2);
cl_new(i) = (1-df(i))*cla*(alpha(i)-alpha0) + df(i)*(+1/(1+Ks))*cla*(alpha(i)-alpha0)+df(i)*clmax;
end

%%
clear all
clear syms
close all
syms cl clmax clmin Dcl Ks dcldalpha alpha alpha0
cl = dcldalpha*(alpha-alpha0);
fstall = Dcl*log((1+exp((cl - clmax)/Dcl))/(1+exp((clmin - cl)/Dcl)));
df = diff(fstall,alpha);
dcl_dalppha = (1/(1+(1/dcldalpha)*df*Ks))*dcldalpha;
clalpha = int(dcl_dalppha,alpha);

alpha_deg = -20:.1:20;
alpha = (pi/180)*alpha_deg;
clmax = 1.3;
clmin = -1.3;
alpha0 = -0;
alpha0 = alpha0*pi/180;
dcldalpha = 2*pi;
Dcl = 0.05;
Ks = 40;

clalpha_plot = subs(clalpha)
alpha = alpha0;
claplha0 = subs(clalpha);
clalpha_plot = clalpha_plot - claplha0;
figure(1)
subplot(1,2,1)
plot(alpha_deg,clalpha_plot,'b')


alpha_deg = -20:0.1:20;
alpha = alpha_deg*pi/180;
df = (1/dcldalpha)*subs(df);
alpha= alpha*180/pi;
alpha_sat_pos = 10;
alpha_sat_neg = -10;
cdf = 0.005;
cdp = 0.005;
I = 1;
J = 1;
for i =1:length(alpha)
if(alpha(i)>=0) 
alpha_pos(I) = alpha(i);
cd_pos(I) = cdf+cdp+df(i)*(4*((Ks/(1+Ks))^2)*(sin((alpha(i)-alpha_sat_pos)*pi/180) - clmax/(4*pi*dcldalpha))^2);
I = I+1;
else
cd_neg(J) = cdf+cdp+df(i)*(4*((Ks/(1+Ks))^2)*(sin((-alpha(i)-alpha_sat_pos)*pi/180) - clmax/(4*pi*dcldalpha))^2);
alpha_neg(J) = alpha(i);
J = J+1;
end
end

alpha = [alpha_neg alpha_pos];
cd = [cd_neg cd_pos]; 
figure(1)
subplot(1,2,2)
plot(alpha,cd,'b')



NACA0012 = readtable('NACA0012.txt','NumHeaderLines',2);

figure(1)
subplot(1,2,1)
hold on
plot(NACA0012.Var1,NACA0012.Var2,'-or')
xlabel('angle of attack in degree')
ylabel('2D airfoil cl coefficient')
grid on
legend('ASWING 2D airfoil model','extracted polars from XFOIL')

figure(1)
subplot(1,2,2)
xlabel('angle of attack in degree')
ylabel('2D airfoil cd coefficient')
hold on
plot(NACA0012.Var1,NACA0012.Var3,'-or')
grid on
legend('ASWING 2D airfoil model','extracted polars from XFOIL')
