clear all
close all
clc

T = readtable('GAW2_POLARS_RE_14E5','NumHeaderLines',12)
T2 = readtable('GAW2_POLAR_RE_9E5','NumHeaderLines',12)

%% Re 1.4E6


alpha = T.Var1;
CL = T.Var2;
CD = T.Var3;
CDp = T.Var4;
Cdf = CD-CDp;
CM = T.Var5;
alpha = alpha(40:end);
CL = CL(40:end);
CD = CD(40:end);
CDp = CDp(40:end);
Cdf = Cdf(40:end);
CM = CM(40:end);


alpha2 = T2.Var1;

CL2 = T2.Var2;
CD2 = T2.Var3;
CDp2 = T2.Var4;
Cdf2 = CD2-CDp2;
CM2 = T2.Var5;
alpha2=alpha2(40:end);
CL2 = CL2(40:end);
CD2 = CD2(40:end);
CDp2 = CDp2(40:end);
Cdf2 = Cdf2(40:end);
CM2 = CM2(40:end);

figure(1)
plot(alpha,CL,'r*')
hold on 
plot(alpha2,CL2,'bo')
xlabel("\alpha in degree")
ylabel("CL")
title("CL VS \alpha")
legend("Re = 1.4E6","Re = 0.9E6")
grid on

figure(2)
plot(alpha,CD,'r*')
hold on 
plot(alpha2,CD2,'ro')
hold on 
xlabel("\alpha in degree")
ylabel("CD")
hold on 
plot(alpha,CDp,'b*')
hold on
plot(alpha2,CDp2,'bo')
hold on
plot(alpha,Cdf,'k*')
hold on
plot(alpha2,Cdf2,'ko')
legend("CD (Re = 1.4E6)","CD (Re = 0.9E6)","CDp (Re = 1.4E6)","CDp (Re = 0.9E6)","CDf (Re = 1.4E6)","CDf (Re = 0.9E6)")
title("CD VS \alpha")
grid on

figure(3)
plot(alpha,CM,'r*')
hold on
plot(alpha2,CM2,'bo')
xlabel("\alpha in degree")
ylabel("CM")
title("CM VS \alpha")
legend("Re = 1.4E6","Re = 0.9E6")
grid on

figure(4)
plot(CD,CL,'r*')
hold on 
plot(CD2,CL2,'bo')
legend("Re = 1.4E6","Re = 0.9E6")
xlabel("CD")
ylabel("CL")
title("CL VS CD")
grid on

figure(5)
plot(alpha,CL./CD,'r*')
hold on
plot(alpha2,CL2./CD2,'bo')
legend("Re = 1.4E6","Re = 0.9E6")
xlabel("\alpha in degree")
ylabel("CL/CD")
title("CL/CD VS \alpha")
grid on

figure(6)
plot(CM,CL,'r*')
hold on
plot(CM2,CL2,'bo')
xlabel("CM")
ylabel("CL")
legend("Re = 1.4E6","Re = 0.9E6")
title("CL VS CM")
grid on


%%

% 
% Cdf_wing = mean(Cdf(1:end-40))
% Cdf_canard = mean(Cdf2(1:end-40))
% 
% Cdp_wing = mean(CDp(1:end-40))
% Cdp_canard = mean(CDp2(1:end-40))
% 
% alpha0_wing = -4.25;
% alpha0_canard = -4.25;
% 
% CLmax_wing = max(CL)
% CLmax_canard = max(CL2)

cftool(alpha(1:end-4*(22-10)),CL(1:end-4*(22-10)))


%%

T = readtable('NACA4309_POLARS.txt','NumHeaderLines',12)
alpha = T.Var1;
CL = T.Var2;
CD = T.Var3;
CDp = T.Var4;
Cdf = CD-CDp;
CM = T.Var5;
alpha = alpha(40:end);
CL = CL(40:end);
CD = CD(40:end);
CDp = CDp(40:end);
Cdf = Cdf(40:end);



% cftool(alpha(30:100),CL(30:100))
CM = CM(40:end);

plot(alpha,CL,'o')
grid on
%%

Cdf_wing = mean(Cdf(1:end-40))
Cdp_wing = mean(CDp(1:end-40))
CLmax_wing = max(CL)

