clc
clear all
close all
%%
% Side force

J = [0.2 0.45 0.7 1.0];
Vinfty = [3 6 9 10];


B = 2.0
CL_alpha = 0.95*2*pi;
cl = 0.6;



cd = 0;



D = 0.20;
R = D/2;
c_R = 0.3;
c = c_R*R;


Omega = (2*pi)*Vinfty./(J*R)
n = Omega/(2*pi)
rho = 1.285;



alpha_deg = [0 15 30 45 60 75 90];
alpha = pi*alpha_deg/180;

CT_temp = readtable('Leng_CT.csv', NumHeaderLines=2);


CT_exp = [CT_temp.Var2 CT_temp.Var4 CT_temp.Var6 CT_temp.Var8 CT_temp.Var10 CT_temp.Var12 CT_temp.Var14 CT_temp.Var16];



for j=1:length(Vinfty)
for i =1:length(alpha)
v = Vinfty(j)*sin(alpha(i));

Fe = CT_exp(i,j)*rho*D^4*(Omega(j)*R)^2;
Ve = Vinfty(j)*cos((alpha(i)));
DeltaVe = sqrt(Ve^2 + 2*Fe/(rho*pi*R^2))-Ve;
Vd = Vinfty(j)*cos((alpha(i))) + 0.5*DeltaVe;



etaW(i,j) = (sqrt((Omega(j)*R)^2+Vd^2)-sqrt((Omega(j)*R+v)^2+Vd^2))/sqrt((Omega(j)*R)^2+Vd^2);
etaPhi(i,j) = (atan(Vd/(Omega(j)*R))-atan(Vd/(Omega(j)*R+v)))/atan(Vd/(Omega(j)*R));

phi = atan(Vd/(Omega(j)*0.75*R+v));
phi_deg = phi*180/pi;
cl = 0.6;

C0 = 0.8*B*(c_R)*cos(phi);
C1 = 0.45*B*(c_R)*cos(phi);
C2 = 0.3*B*(c_R)*cos(phi);
S0 = 1.2*B*(c_R)*sin(phi);
S1 = 0.7*B*(c_R)*sin(phi);





Fv(i) = 0.25*rho*R^2*((CL_alpha*S0-cl*C0+cd*S0)*Vd+2*(cl*S1+cd*C1)*Omega(j)*R)*v;

Mv(i) = -0.25*rho*R^3*((CL_alpha*C1+cl*S1)*Vd+2*cl*C2+Omega(j)*R)*v;
D2 =  D; 


C_Fv(i,j) = (2*pi)*Fv(i) / (rho*n(j)^2*D2^4);
C_Mv(i,j) = Mv(i) / (rho*n(j)^2*D2^5);

% % 
% C_Fv(i,j) = Fv(i) / (rho*(Omega(j)*R)^2*pi*R^4);
% C_Mv(i,j) = Mv(i) / (rho*(Omega(j)*R)^2*(2*pi)^2*R^5);

%C_Fv(i,j) = Fv(i) ;
%C_Mv(i,j) = Mv(i) ;


end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NACA PROPELLER LENG Beta = 20
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Exp_C_Fv =  readtable('Leng_CN.csv',NumHeaderLines=2);
Exp_C_Mv = readtable('Leng_C_n.csv',NumHeaderLines=2);


alpha_deg = [0 15 30 45 60 75 90];



figure(1)

plot(alpha_deg,Exp_C_Fv.Var2,'ks',LineWidth=1.5,MarkerFaceColor='k',MarkerSize=8)
hold on
plot(alpha_deg,Exp_C_Fv.Var4,'ko',LineWidth=1.5,MarkerFaceColor='k',MarkerSize=8)
hold on
plot(alpha_deg,Exp_C_Fv.Var6,'k^',LineWidth=1.5,MarkerFaceColor='k',MarkerSize=8)
hold on
plot(alpha_deg,Exp_C_Fv.Var8,'kd',LineWidth=1.5,MarkerFaceColor='k',MarkerSize=8)
hold on
plot(alpha_deg,Exp_C_Fv.Var10,'-.bs',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,Exp_C_Fv.Var12,'-.bo',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,Exp_C_Fv.Var14,'-.b^',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,Exp_C_Fv.Var16,'-.bd',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,C_Fv(:,1),'-rs',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,C_Fv(:,2),'-ro',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,C_Fv(:,3),'-r^',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,C_Fv(:,4),'-rd',LineWidth=1.5,MarkerSize=8)
grid on
xlabel('\alpha in deg')
ylabel('C_N')
legend('\lambda_\infty = 0.2','\lambda_\infty = 0.45','\lambda_\infty = 0.70','\lambda_\infty = 1.0')
title('Black : Exp, {\color{blue}Blue Leng BEMT}, {\color{red}red ASWING}')
set(gca,"FontSize",14)
figure(2)
plot(alpha_deg,-Exp_C_Mv.Var2,'ks',LineWidth=1.5,MarkerFaceColor='k',MarkerSize=8)
hold on
plot(alpha_deg,-Exp_C_Mv.Var4,'ko',LineWidth=1.5,MarkerFaceColor='k',MarkerSize=8)
hold on
plot(alpha_deg,-Exp_C_Mv.Var6,'k^',LineWidth=1.5,MarkerFaceColor='k',MarkerSize=8)
hold on
plot(alpha_deg,-Exp_C_Mv.Var8,'kd',LineWidth=1.5,MarkerFaceColor='k',MarkerSize=8)
hold on
plot(alpha_deg,-Exp_C_Mv.Var10,'-.bs',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,-Exp_C_Mv.Var12,'-.bo',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,-Exp_C_Mv.Var14,'-.b^',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,-Exp_C_Mv.Var16,'-.bd',LineWidth=1.5,MarkerSize=8)
% hold on
% plot(alpha_deg,min(Exp_C_Mv.Var2)*C_Mv(:,1)/min(C_Mv(:,1)),'-r',LineWidth=1.5)
% hold on
% plot(alpha_deg,min(Exp_C_Mv.Var4)*C_Mv(:,2)/min(C_Mv(:,2)),'--r',LineWidth=1.5)
% hold on
% plot(alpha_deg,min(Exp_C_Mv.Var6)*C_Mv(:,3)/min(C_Mv(:,3)),':r',LineWidth=1.5)
% hold on
% plot(alpha_deg,min(Exp_C_Mv.Var8)*C_Mv(:,4)/min(C_Mv(:,4)),'-.r',LineWidth=1.5)
hold on
plot(alpha_deg,-C_Mv(:,1),'-rs',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,-C_Mv(:,2),'-ro',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,-C_Mv(:,3),'-r^',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,-C_Mv(:,4),'-rd',LineWidth=1.5,MarkerSize=8)
grid on
xlabel('\alpha in deg')
ylabel('C_n')
legend('\lambda_\infty = 0.2','\lambda_\infty = 0.45','\lambda_\infty = 0.70','\lambda_\infty = 1.0')
title('Black : Exp, {\color{blue}Blue Leng BEMT}, {\color{red}red ASWING}')
set(gca,"FontSize",14)



min(C_Mv(:,1))/min(Exp_C_Mv.Var2);

min(C_Mv(:,2))/min(Exp_C_Mv.Var4);

min(C_Mv(:,3))/min(Exp_C_Mv.Var6);

min(C_Mv(:,4))/min(Exp_C_Mv.Var8);

%%
clc
try 
close figure(2)
end
clear all


Omega = 10000*2*pi/60

J = linspace(0,2.0,1000);
R = 0.10;
Vinfty = Omega*R*J;
alpha = linspace(0,pi/2,1000);
alpha_deg = alpha*180/pi;
L_tot1 = ones(length(alpha),length(J));
L_tot2 = 2*ones(length(alpha),length(J));
L_tot3 = 10*ones(length(alpha),length(J));

for i = 1:length(alpha)
    for j = 1:length(Vinfty)
        v = Vinfty(j)*sin(alpha(i));
Vd = Vinfty(j)*cos((alpha(i)));
etaW(i,j) = abs(sqrt((Omega*R)^2+Vd^2)-sqrt((Omega*R+v)^2+Vd^2))/sqrt((Omega*R)^2+Vd^2);
etaPhi(i,j) = abs(atan(Vd/(Omega*R))-atan(Vd/(Omega*R+v)))/atan(Vd/(Omega*R));
etaPhi(i,j) = abs(atan(Vd/(Omega*R))-atan(Vd/(Omega*R+v)));
if etaW(i,j) > 0.1 | etaPhi(i,j) > 0.3
    L_tot1(i,j) = NaN;   
end
if etaW(i,j) > 0.05 | etaPhi(i,j) > 0.3 
    L_tot2(i,j) = NaN;   
end
if etaW(i,j) > 0.2 | etaPhi(i,j) > 0.1 
    L_tot3(i,j) = NaN;   
end
    end
end
% L_etaW = (abs(etaW) < 0.1*ones(length(alpha),length(J)))
% L_etaPhi = (abs(etaPhi) < 0.1*ones(length(alpha),length(J)))
% 
% L_tot = (L_etaW & L_etaPhi)
% 
% etaW
% etaPhi;
% [alpha,J] = meshgrid(alpha,J);
figure(2)

% h = pcolor(alpha_deg,J,L_tot1);
colormap("gray")
% set(h, 'EdgeColor', 'none');
% set(h,'facealpha',0.4)
% hold on
h2= pcolor(alpha_deg,J,L_tot2);
set(h2, 'EdgeColor', 'none');
set(h2,'facealpha',0.6)
% hold on
% h3= pcolor(alpha_deg,J,L_tot3);
% set(h3, 'EdgeColor', 'none');
% set(h3,'facealpha',0.4)
shading flat;
xlabel('\alpha_p in ^\circ')
ylabel('\lambda_\infty')
grid on
set(gca,"FontSize",14)

%% ANALYSE CT
figure(10)
lambda = [0.2 0.45 .7 1.0]
RPM = 4500;

Exp_CP =  readtable('CP.csv',NumHeaderLines=2);
Exp_CT =  readtable('CT.csv',NumHeaderLines=2);
alpha_deg = [0 15 30 45 60 75 90];
plot(alpha_deg,Exp_CT.Var2,'ko',LineWidth=1.5)
hold on
plot(alpha_deg,Exp_CT.Var4,'k*',LineWidth=1.5)
hold on
plot(alpha_deg,Exp_CT.Var6,'k^',LineWidth=1.5)
hold on
plot(alpha_deg,Exp_CT.Var8,'kv',LineWidth=1.5)
hold on
plot(alpha_deg,Exp_CT.Var10,'-b',LineWidth=1.5)
hold on
plot(alpha_deg,Exp_CT.Var12,'--b',LineWidth=1.5)
hold on
plot(alpha_deg,Exp_CT.Var14,':b',LineWidth=1.5)
hold on
plot(alpha_deg,Exp_CT.Var16,'-.b',LineWidth=1.5)
xlabel('\alpha in deg')
ylabel('C_T')
legend('Leng & al Exp J = 0.2','Leng & al Exp J = 0.45',...
    'Leng & al Exp J = 0.7','Leng & al Exp J = 1.0',...
    'Leng & al BET J = 0.2','Leng & al BET J = 0.45',...
    'Leng & al BET J = 0.7','Leng & al BET J = 1.0',...
    'ASWING J = 0.2','ASWING J = 0.45','ASWING J = 0.7','ASWING J = 1.0','NumColumns',2,'Location','southoutside');
grid on