clear all ; close all
Re = 3.17E6;
rho = 1.2256;
V_inf = 47.9;
mu = 1.8E-5;
Cf = 0.058*Re^-0.2;
Tauw = 0.5*Cf*rho*V_inf^2;
U_tau  = sqrt(Tauw/rho);
y_p = 50;
y = y_p*mu/(U_tau*rho)
delta = 0.37*1.0*Re^-0.2
gamma = 1.3
N = log(1-delta*(1-gamma)/y)/log(gamma)
