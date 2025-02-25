function [CDA] = Find_CDA2(Ve,RPM,Re,CD_start,CP,swirl_on,CT_TARGET)
rho = 1.285;
n = RPM/60;
Omega = n*2*pi;
lambda = Ve/(Omega*Re);
D = 2*Re;
Fe = rho*(n^2)*(D^4)*CT_TARGET;
Pe = rho*(n^3)*(D^5)*CP;
Pv = (1/8)*rho*sqrt(Ve^2 + (Omega*Re)^2)*(Ve^2 + 3*(Omega*Re)^2);
DeltaVe = sqrt(Ve^2 + 2*Fe/(rho*pi*Re^2))-Ve;
PRS = (Ve + (1+5*lambda^2)*0.5*DeltaVe)*Fe;
CDA = (Pe - PRS)/Pv;
end