function [CT,CP,eta,phi] = Actuatir_disk(Ve,RPM,Re,CDA,CP,swirl_on)
rho = 1.215;
Ae = pi*Re^2;
Omega = 2*pi*RPM/60;
n = RPM/60;
Pe = CP*rho*n^3*(2*Re)^5;
Pv = (1/8)*rho*sqrt(Ve^2+(Omega*Re)^2)*(Ve^2+3*(Omega*Re)^2)*(CDA);

Delta_P = Pe - Pv;

lambda = Ve/(Omega*Re);
Al =(1+swirl_on*5*lambda^2);

A0 = -Delta_P;
A1 = Ve^2*rho*Ae;
A2 = 0.5*(Ve+Al*Ve)*rho*Ae;
A3 = 0.25*Al*rho*Ae;

DV_temp = 0.1
DeltaVe = 0.0

while abs(DeltaVe-DV_temp) < 0.001
 DV_temp = DeltaVe;   
res = polyval([A3 A2 A1 A0]);
Jac = polyval([3*A3 2*A2 A1]);
DeltaVe = -res/Jac;
end




Fe = rho*Ae*(Ve+0.5*DeltaVe)*DeltaVe


CT = Fe / (rho*n^2*(2*Re)^4);
eta = CT*lambda/CP;
phi = sqrt(2/pi)*(CT^1.5)/(CP);





end

