clear all 
close all
clc

CT_temp = readtable('Leng_CT.csv', NumHeaderLines=2);
CQ_temp = readtable('Leng_CQ.csv', NumHeaderLines=2);

CT_exp = [CT_temp.Var2 CT_temp.Var4 CT_temp.Var6 CT_temp.Var8 CT_temp.Var10 CT_temp.Var12 CT_temp.Var14 CT_temp.Var16];
CQ_exp = [CQ_temp.Var2 CQ_temp.Var4 CQ_temp.Var6 CQ_temp.Var8];


CP_exp = 2*pi*CQ_exp;

R = 0.10
J = [0.2 0.45 0.7 1.0];
alpha_deg = [0 15 30 45 60 75 90]';
alpha = alpha_deg*pi/180;
V = [3 6 9 10];
Omega = V./(J*R)
RPM = 60*Omega/(2*pi)

R = 0.1;


CDA0 = 0.0002


for i = 1 :length(alpha)
[CDA(i,1)] = find_CDA2(V(1)*cos(alpha(i)),RPM(1),R,0.00001,CP_exp(i,1),1.0,CT_exp(i,1)) 
[CDA(i,2)] = find_CDA2(V(2)*cos(alpha(i)),RPM(2),R,0.000005,CP_exp(i,2),1.0,CT_exp(i,2)) 
[CDA(i,3)] = find_CDA2(V(3)*cos(alpha(i)),RPM(3),R,0.0001,CP_exp(i,3),1.0,CT_exp(i,3)) 
[CDA(i,4)] = find_CDA2(V(4)*cos(alpha(i)),RPM(4),R,0.0001,CP_exp(i,4),1.0,CT_exp(i,4)) 
end
J1 = V(1)*cos(alpha)/(2*pi*RPM(1)/60*R);
J2 = V(2)*cos(alpha)/(2*pi*RPM(2)/60*R);
J3 = V(3)*cos(alpha)/(2*pi*RPM(3)/60*R);
J4 = V(4)*cos(alpha)/(2*pi*RPM(4)/60*R);
J = [J1; J2 ;J3 ;J4]
[l,I] = sort(J,'ascend');
J = J(I)
CDA = [CDA(:,1); CDA(:,2); CDA(:,3); CDA(:,4)];
CDA = CDA(I)
CDA_p = polyfit(J,CDA,2);

% figure(1)
% plot(J,CDA,'k*')
% hold on
% plot(J,polyval(CDA_p,J),'-r')
% grid on 


for i = 1 :length(alpha)
[CT_ASW(i,1) jerk1 jerk2 jerk3] =  Actuatir_disk(V(1)*cos(alpha(i)),RPM(1),R,polyval(CDA_p,V(1)*cos(alpha(i))/(2*pi*RPM(1)/60*R)),CP_exp(i,1),1.0)
[CT_ASW(i,2) jerk1 jerk2 jerk3] =  Actuatir_disk(V(2)*cos(alpha(i)),RPM(2),R,polyval(CDA_p,V(2)*cos(alpha(i))/(2*pi*RPM(2)/60*R)),CP_exp(i,2),1.0)
[CT_ASW(i,3) jerk1 jerk2 jerk3] =  Actuatir_disk(V(3)*cos(alpha(i)),RPM(3),R,polyval(CDA_p,V(3)*cos(alpha(i))/(2*pi*RPM(3)/60*R)),CP_exp(i,3),1.0)
[CT_ASW(i,4) jerk1 jerk2 jerk3] =  Actuatir_disk(V(4)*cos(alpha(i)),RPM(4),R,polyval(CDA_p,V(4)*cos(alpha(i))/(2*pi*RPM(4)/60*R)),CP_exp(i,4),1.0)
end



V(1)*cos(alpha(i))/(2*pi*RPM(1)/60)


figure(2)
plot(alpha_deg,CT_exp(:,1),'ks',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(alpha_deg,CT_exp(:,2),'ko',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(alpha_deg,CT_exp(:,3),'k^',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(alpha_deg,CT_exp(:,4),'kd',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(alpha_deg,CT_exp(:,5),'-.bs',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,CT_exp(:,6),'-.bo',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,CT_exp(:,7),'-.b^',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,CT_exp(:,8),'-.bd',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,CT_ASW(:,1),'-rs',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,CT_ASW(:,2),'-ro',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,CT_ASW(:,3),'-r^',LineWidth=1.5,MarkerSize=8)
hold on
plot(alpha_deg,CT_ASW(:,4),'-rd',LineWidth=1.5,MarkerSize=8)
grid on 
xlabel('\alpha_p in deg')
ylabel('C_T')
legend('\lambda_\infty = 0.2','\lambda_\infty = 0.45','\lambda_\infty = 0.70','\lambda_\infty = 1.0')
title('Black : Exp, {\color{blue}Blue Leng BEMT}, {\color{red}red ASWING}')
set(gca,Fontsize=14)
% xlim([0 60])
% \lambda 
% figure(2)
% plot(alpha_deg,(CT_exp(:,1)*J(1).*cos(alpha))./CP_exp(:,1),'-ks')
% hold on
% plot(alpha_deg,(CT_exp(:,2)*J(2).*cos(alpha))./CP_exp(:,2),'-ko')
% hold on
% plot(alpha_deg,(CT_exp(:,3)*J(3).*cos(alpha))./CP_exp(:,3),'-k^')
% hold on
% plot(alpha_deg,(CT_exp(:,4)*J(4).*cos(alpha))./CP_exp(:,4),'-kd')
% legend('J=0.2', 'J = 0.45', 'J = 0.70', 'J=1.0')
