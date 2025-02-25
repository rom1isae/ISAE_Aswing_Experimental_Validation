clear all ; close all ; clc

NACA0012RE1E5 = readtable('NACA0012RE1E5.txt','NumHeaderLines',12);
NACA0012RE2E5 = readtable('NACA0012RE2E5.txt','NumHeaderLines',12);
NACA0012RE5E5 = readtable('NACA0012RE5E5.txt','NumHeaderLines',12);
NACA0012RE1E6 = readtable('NACA0012RE1E6.txt','NumHeaderLines',12);
for i =1:length(NACA0012RE1E5.Var1)-1
   cl_alpha1E5(i) =(180/pi)*(NACA0012RE1E5.Var2(i+1)- NACA0012RE1E5.Var2(i) )/ (NACA0012RE1E5.Var1(i+1)- NACA0012RE1E5.Var1(i) );   
end
for i =1:length(NACA0012RE2E5.Var1)-1
   cl_alpha2E5(i) =(180/pi)*(NACA0012RE2E5.Var2(i+1)- NACA0012RE2E5.Var2(i) )/ (NACA0012RE2E5.Var1(i+1)- NACA0012RE2E5.Var1(i) );   
end
for i =1:length(NACA0012RE5E5.Var1)-1
   cl_alpha5E5(i) =(180/pi)*(NACA0012RE5E5.Var2(i+1)- NACA0012RE5E5.Var2(i) )/ (NACA0012RE5E5.Var1(i+1)- NACA0012RE5E5.Var1(i) );   
end
for i =1:length(NACA0012RE1E6.Var1)-1
   cl_alpha1E6(i) =(180/pi)*(NACA0012RE1E6.Var2(i+1)- NACA0012RE1E6.Var2(i) )/ (NACA0012RE1E6.Var1(i+1)- NACA0012RE1E6.Var1(i) );   
end
x = NACA0012RE2E5.Var1(1:end-1);
y = NACA0012RE2E5.Var2(1:end-1);
p = polyfit(x,y,3);
cl_fit = polyval(p,x);


figure(1)
% plot(NACA0012RE1E5.Var1(1:end-1),cl_alpha1E5,'-rs')
% hold on
plot(NACA0012RE2E5.Var1(1:end-1),cl_alpha2E5,'b*')
hold on
plot(NACA0012RE2E5.Var1(1:end-1),cl_fit,'-b')
% plot(NACA0012RE5E5.Var1(1:end-1),cl_alpha5E5,'-ko')
% hold on
plot(NACA0012RE1E6.Var1(1:end-1),cl_alpha1E6,'-rd')
hold on
grid on
legend('Re = 1E5','Re = 2E5','Re = 5E5','Re = 1E6')
ylim([-6 15])
xlabel('\alpha in degree')
ylabel('cl_\alpha(\alpha)')