function Generate_Mowe(Wing1,Wing2,Fuselage)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Airfoil specs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
aircraft.Fuselage = Fuselage
if (Fuselage.Status)
    aircraft.Name = 'Mowe_frame_temp';
else
    aircraft.Name = 'Mowe_temp';
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Forward Wing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

b1 = Wing1.b
c1 = Wing1.c
b_ratio1 = Wing1.b_ratio;
X01 = Wing1.X0;
Y01 = Wing1.Y0;
Z01 = Wing1.Z0;
Xshft1 = Wing1.Xshift;
twist1 = Wing1.twist;
Lambda1 = Wing1.Lambda;
N1 = Wing1.N;


aircraft.Wing= {};
aircraft.Wing = Quasi_Eliptical_Wing(aircraft.Wing,b1,c1,b_ratio1,X01,Y01,Z01,Xshft1,twist1,Lambda1,N1,Wing1.airfoil);
% 
if (~Wing2.Xfoil_Status) 
    aircraft.Wing =  Get_polars(aircraft.Wing,89.4,-15,15.0,Wing1.Xfoil_Status);
%     Xfoil_Status_Wing1 = true(1);
end
aircraft.Wing.Name = "Foward Wing";
aircraft.Wing.Status = true(1);
aircraft.Wing.Bref = b1;
aircraft.Wing.Cref =    aircraft.Wing.Sref / aircraft.Wing.Bref;
aircraft.Wing.dCLdF1 =  zeros(N1+1,1);
aircraft.Wing.dCLdF2 =  zeros(N1+1,1);
aircraft.Wing.dCMdF1 =  zeros(N1+1,1);
aircraft.Wing.dCMdF2 =  zeros(N1+1,1);
aircraft.Wing.BeamIndex = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Backward Wing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


b2 = Wing2.b;
c2 = Wing2.c;
b_ratio2 = Wing2.b_ratio;
X02 = Wing2.X0;
Y02 = Wing2.Y0;
Z02 = Wing2.Z0;
Xshft2 = Wing2.Xshift;
twist2 = Wing2.twist;
Lambda2 = Wing2.Lambda;
N2 = Wing2.N;



                              
                              
aircraft.VTail.Name = "Backward Wing";
if (~Wing2.Status)
    aircraft.VTail.Status = false(1);
else
    aircraft.VTail.Status = true(1);
    
aircraft.VTail= {};
aircraft.VTail = Quasi_Eliptical_Wing(aircraft.VTail,b2,c2,b_ratio2,X02,Y02,Z02,...
                                  Xshft2,twist2,Lambda2,N2,Wing2.airfoil);
                              

 if (~Wing2.Xfoil_Status) 
    aircraft.VTail =  Get_polars(aircraft.VTail,20,-15,15,Wing2.Xfoil_Status);
%     Xfoil_Status_Wing2 = true(1);
 end
end

aircraft.VTail.dCLdF3 =zeros(N2+1,1);
aircraft.VTail.dCMdF3 =zeros(N2+1,1);
aircraft.VTail.dCLdF4 =zeros(N2+1,1);
aircraft.VTail.dCMdF4 =zeros(N2+1,1);
aircraft.VTail.BeamIndex = 2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

aircraft.Struts.Status = false(1);
aircraft.engines.Status = false(1);
aircraft.Sensor.Status = false(1);

if (aircraft.VTail.Status)
aircraft.Reference.Sref = aircraft.Wing.Sref + aircraft.VTail.Sref;
else
   aircraft.Reference.Sref = aircraft.Wing.Sref 
end
aircraft.Reference.Cref = aircraft.Wing.Cref
aircraft.Reference.Bref = aircraft.Wing.Bref
aircraft.Reference.Xmom = 0;
aircraft.Reference.Ymom = 0.0;
aircraft.Reference.Zmom = 0.0;
aircraft.Reference.Xacc = 0;
aircraft.Reference.Yacc = 0.0;
aircraft.Reference.Zacc = 0.0;
aircraft.Reference.Xvel = 0;
aircraft.Reference.Yvel = 0.0;
aircraft.Reference.Zvel = 0.0;

aircraft.Point_Mass.Status = false(1);
aircraft.Ground.Nbeam = 1;
aircraft.Ground.t = 0.0;
aircraft.Ground.Kground = 0;

aircraft.Joint.Status = true(1);
aircraft.Joint.N = 1;
if aircraft.Fuselage.Status
aircraft.Joint.Nbeam1 = [1 1]';
aircraft.Joint.Nbeam2 = [2 3]';
aircraft.Joint.t1 = [0.0 0.0]';
aircraft.Joint.t2 = [0.0 0.0]';
else
aircraft.Joint.Nbeam1 = [1]';
aircraft.Joint.Nbeam2 = [2]';
aircraft.Joint.t1 = [0.0]';
aircraft.Joint.t2 = [0.0]';  
end

if (~aircraft.Fuselage.Status && ~aircraft.VTail.Status)
    aircraft.Joint.Status = false(1);
end

aircraft_to_aswing(aircraft)