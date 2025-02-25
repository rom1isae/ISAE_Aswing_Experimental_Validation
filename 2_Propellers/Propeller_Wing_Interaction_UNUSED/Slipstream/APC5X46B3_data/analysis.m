clear all
close all

data =  readtable('APC5X46B3_8000RPM.txt','NumHeaderLines',4)   ; 
mpph2mps =0.44704


figure(1)
subplot(2,3,1)
plot(mpph2mps*data.Var1,data.Var3,'--ro')
grid on
xlabel('inlet speed m/s')
ylabel('\eta')
subplot(2,3,2)
plot(mpph2mps*data.Var1,data.Var4,'--ro')
grid on
xlabel('inlet speed m/s')
ylabel('CT')
subplot(2,3,3)
plot(mpph2mps*data.Var1,data.Var5,'--ro')
grid on
xlabel('inlet speed m/s')
ylabel('CP')
subplot(2,3,4)
plot(mpph2mps*data.Var1,data.Var6,'--ro')
grid on
xlabel('inlet speed m/s')
ylabel('PWR')
subplot(2,3,5)
plot(mpph2mps*data.Var1,data.Var7,'--ro')
grid on
xlabel('inlet speed m/s')
ylabel('Torque')
subplot(2,3,6)
plot(mpph2mps*data.Var1,data.Var8,'--ro')
grid on
xlabel('inlet speed m/s')
ylabel('Thrust')


R = 0.05;

HP2W = 745.7;
lbf2N = 4.44822;
IN2M = 0.0254;
RPM = 8000;
Omega = RPM*2*pi/60;
rho = 1.2245;
V = [4.2 6.8 10.1];
eta = [0.3364 0.5097 0.6693];
PWR = HP2W*[0.017 0.017 0.017]
Torque = IN2M*lbf2N*[0.133 0.137 0.131]
Thrust = lbf2N*[0.234 0.22 0.183]
CT = [0.1833 0.1723 0.1435];
CP = [0.1309 0.1354 0.1288];


Pe = PWR;
PV = (ones(1,3)-eta).*Pe
fact = (rho*sqrt((V.^2 + Omega.^2*R^2)).*(V.^2+3* Omega.^2*R^2));
CDA = 8*PV./fact
