function Fuselage = Fuselage(Wing1,Wing2,N,L_nose)
N= N+1;
Fuselage.Name = 'Airframe';
Fuselage.BeamIndex = 3;
Fuselage.Status = true(1);
Fuselage.x = zeros(N,1);
Fuselage.y = zeros(N,1);

Fuselage.z = zeros(N,1);
Fuselage.radius = zeros(N,1);
Fuselage.Ccg  = zeros(N,1);
Fuselage.Ncg  = zeros(N,1);

% second position of center of gravity in the csn frame: (wet Fuselage)
Fuselage.DCcg  = zeros(N,1);
Fuselage.DNcg  = zeros(N,1);

% tension axis position in the csn frame:
Fuselage.Cta  = zeros(N,1);
Fuselage.Nta  = zeros(N,1);

% elastic axis position in the csn frame:
Fuselage.Cea  = zeros(N,1);
Fuselage.Nea  = zeros(N,1);

Fuselage.EIcc = zeros(N,1);
Fuselage.EInn = zeros(N,1);
Fuselage.EIcn = zeros(N,1);
Fuselage.EIcs = zeros(N,1);
Fuselage.EIsn = zeros(N,1);
Fuselage.GJ = zeros(N,1);
Fuselage.EA = zeros(N,1);
Fuselage.GKc = zeros(N,1);
Fuselage.GKn = zeros(N,1);
Fuselage.tdeps = zeros(N,1);
Fuselage.tdgam = zeros(N,1);


%%%%%%%%%%%%%%%%%%%%%%% mass and inertial parameters %%%%%%%%%%%%%%%%%%%%%%

% 1rst weigth over length:
Fuselage.mg = 0.1*ones(N,1);
% 1rst section rotational weight-inertia/length about it mass centroid:
Fuselage.mgcc = zeros(N,1);
Fuselage.mgnn = zeros(N,1);



% 2nd weigth over length :
Fuselage.Dmg = zeros(N,1);
% 2nd section rotational weight-inertia/length about it mass centroid:
Fuselage.Dmgcc = zeros(N,1);
Fuselage.Dmgnn = zeros(N,1);



%%%%%%%%%%%%%%%%%%%%%%% Aerodynamic parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% section profile friction drag coefficient:
Fuselage.Cdf = 0.005*ones(N,1);
% section profile pressure pressure drag coefficient
Fuselage.Cdp = 0.012*ones(N,1);

L_fuse = 2*L_nose + Wing2.c+ Wing1.c+(Wing2.X0- Wing1.X0);
theta = 0:pi/(N-1):pi;




x = 0.5*L_fuse - 0.5*L_fuse*cos(theta);

R = 0.5*abs(Wing1.Z0-Wing2.Z0);

for i=1:length(x)
   if x(i) <= L_nose
       Fuselage.R(i) = R*sin((x(i)/L_nose)*pi/2);
   elseif x(i) >= L_fuse-L_nose
       Fuselage.R(i) = R*cos((((x(i)-L_fuse+L_nose)/L_nose)*pi/2));
   else
       Fuselage.R(i) = R;
   end
end
Fuselage.x = (x-2*L_nose)';
Fuselage.t = Fuselage.x
Fuselage.R = Fuselage.R';
Fuselage.z = Wing1.Z0+0.5*(Wing2.Z0-Wing1.Z0)*ones(N,1);
    
    
end



