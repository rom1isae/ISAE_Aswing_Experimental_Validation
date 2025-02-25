function aircraft_to_aswing(aircraft)

%% Name part: 

filename =  [aircraft.Name '.asw'];
fileID = fopen(filename,'w')
fprintf(fileID,'#========================================================================== \r\n')
fprintf(fileID,'Name \r')
fprintf(fileID,'%s \r',aircraft.Name)
fprintf(fileID,'End \r')

%% Unit :

fprintf(fileID,'#========================================================================== \r\n')
fprintf(fileID,'Unit \r')
fprintf(fileID,'L \t 1.0000 \t m\r')
fprintf(fileID,'T \t 1.0000 \t s\r')
fprintf(fileID,'F \t 1.0000 \t N\r')
fprintf(fileID,'End \r')

%% Constant part:


fprintf(fileID,'#========================================================================== \r\n')
fprintf(fileID,'Constant \r')
fprintf(fileID,'#       g          rhoSL        VsoSL  \r')
fprintf(fileID,'    9.8100       1.2256       340.21    \r')
fprintf(fileID,'End \r')


%% Reference part:
fprintf(fileID,'#========================================================================== \r\n')
fprintf(fileID,'Reference \r')
fprintf(fileID,'# \t Sref       \t Cref        \t Bref \r \t %.5E \t %.5E \t %.5E \r# \r',...
 [aircraft.Reference.Sref aircraft.Reference.Cref aircraft.Reference.Bref])
fprintf(fileID,'# \t Xmom        \t Ymom        \t Zmom \r \t %.5E \t %.5E \t %.5E \r# \r',...
 [aircraft.Reference.Xmom aircraft.Reference.Ymom aircraft.Reference.Zmom])
fprintf(fileID,'# \t Xacc        \t Yacc        \t Zacc \r \t %.5E \t %.5E \t %.5E \r# \r',...
 [aircraft.Reference.Xacc aircraft.Reference.Yacc aircraft.Reference.Zacc])
fprintf(fileID,'# \t Xvel        \t Yvel        \t Zvel \r \t %.5E \t %.5E \t %.5E \r# \r',...
 [aircraft.Reference.Xvel aircraft.Reference.Yvel aircraft.Reference.Zvel])
fprintf(fileID,'End\r') 


%% Weight part:


if (aircraft.Point_Mass.Status) 

fprintf(fileID,'#========================================================================== \r\n')
fprintf(fileID,'Weight \r')
fprintf(fileID,'# Nbeam \t t \t Xp \t Yp \t Zp \t Mg \t CDA \t Vol \t Hxg \t Hyg \t Hzg \r\n')
% fprintf(fileID,'* \t \t 1.0 \t 1.0 \t 1.0 \t 1.0 \t 1.0 \t 1.0 \t 1.0 \t 1.0 \t 1.0 \t 1.0 \r')
fprintf(fileID,'%i \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E\r\n',...
    [aircraft.Point_mass.Nbeam aircraft.Point_mass.t aircraft.Point_mass.Xp ...
    aircraft.Point_mass.Yp aircraft.Point_mass.Zp aircraft.Point_mass.Mg...
    aircraft.Point_mass.CDA aircraft.Point_mass.Vol aircraft.Point_mass.Hxg...
    aircraft.Point_mass.Hyg aircraft.Point_mass.Hzg]')
fprintf(fileID,'End\r')

end


%% Sensors part : 

if(aircraft.Sensor.Status)
fprintf(fileID,'#========================================================================== \r\n')
fprintf(fileID,'Sensor \r')
fprintf(fileID,'# KS \t Nb \t t \t Xp \t Yp \t Zp \t Vx \t Vy \t Vz \t Ax \t Ay \t Az \r')
% fprintf(fileID,'*\t \t 1. \t 1. \t 1. \t 1. \t 1. \t 1. \t 1. \t 1. \t 1. \t 1. \r')
fprintf(fileID,'%i \t %i \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \r',[aircraft.Sensor.KS ...
  aircraft.Sensor.Nb aircraft.Sensor.t aircraft.Sensor.Xp ...
  aircraft.Sensor.Yp aircraft.Sensor.Zp aircraft.Sensor.Vx ...
  aircraft.Sensor.Vy aircraft.Sensor.Vz aircraft.Sensor.Ax ...
  aircraft.Sensor.Ay aircraft.Sensor.Az  ]')
fprintf(fileID,'End\r') 
end


%% Engine part:

if (aircraft.engines.Status)
fprintf(fileID,'#========================================================================== \r\n')
fprintf(fileID,'Engine \r')
fprintf(fileID,'#    KPeng  IEtyp  Nbeam  t  Xp  Yp  Zp  Tx  Ty  Tz  dFdPeng  dMdPeng  Rdisk  Omega  CdA  S0  C0  S1  C1  S2  C2  S3  C3 \r\n')
% fprintf(fileID,'* \t \t \t \t 1.0 \t 1.0 \t 1.0 \t 1.0 \t 1.0 \t 1.0 \t 1.0 \t 1.0 \t 1.0\r')
fprintf(fileID,'\t %i \t %i \t %i \t %.5E \t %.5E  \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E  \t %.5E  \t %.5E  \t %.5E  \t %.5E  \t %.5E  \t %.5E  \t %.5E  \t %.5E  \t %.5E  \t %.5E  \t%.5E \r\n ',...
    [aircraft.engines.Kpeng aircraft.engines.IEtyp aircraft.engines.Nbeam aircraft.engines.t aircraft.engines.Xp...
    aircraft.engines.Yp aircraft.engines.Zp aircraft.engines.Tx aircraft.engines.Ty aircraft.engines.Tz...
    aircraft.engines.dFdPeng aircraft.engines.dMdPeng aircraft.engines.Rdisk aircraft.engines.Omega...
    aircraft.engines.CdA aircraft.engines.S0 aircraft.engines.C0 aircraft.engines.S1 aircraft.engines.C1 ...
    aircraft.engines.S2 aircraft.engines.C2 aircraft.engines.S3 aircraft.engines.C3]')
fprintf(fileID,'End\r') 
end

%% Strut part:

if (aircraft.Struts.Status)
fprintf(fileID,'#========================================================================== \r\n')
fprintf(fileID,'Strut \r')
fprintf(fileID,'# \t Nbeam \t t \t Xp \t Yp \t Zp \t Xw \t Yw \t Zw \t dL \t EA  \r')
fprintf(fileID,'%i \t %.5E  \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E \t %.5E %.5E \r ',...
    [aircraft.Struts.Nbeam aircraft.Struts.t aircraft.Struts.Xp aircraft.Struts.Yp ...
     aircraft.Struts.Zp aircraft.Struts.Xw aircraft.Struts.Yw aircraft.Struts.Zw...
     aircraft.Struts.dL aircraft.Struts.EA]')
fprintf(fileID,'End\r')  
end

%% Ground Part:


fprintf(fileID,'#========================================================================== \r\n')
fprintf(fileID,'Ground \r')
fprintf(fileID,'# \t Nbeam \t Kground  \r')
fprintf(fileID,'%i \t %.5E \t %i \r',[aircraft.Ground.Nbeam aircraft.Ground.t aircraft.Ground.Kground])
fprintf(fileID,'End\r') 
    
%% Joint part:
if(aircraft.Joint.Status)
fprintf(fileID,'#========================================================================== \r\n')
fprintf(fileID,'Joint \r')
fprintf(fileID,'# \t Nbeam1 \t Nbeam2 \t t1 \t t2  \r')
fprintf(fileID,'%i \t %i \t %.5E \t %.5E \r',[aircraft.Joint.Nbeam1 aircraft.Joint.Nbeam2 aircraft.Joint.t1 aircraft.Joint.t2]')
fprintf(fileID,'End\r') 
end

%% Fuselage
if(aircraft.Fuselage.Status)
Fuselage = aircraft.Fuselage;

fprintf(fileID,'#========================================================================== \r\n')
fprintf(fileID,'Beam \t %i \r\n',Fuselage.BeamIndex)
fprintf(fileID,'%s \r\n',Fuselage.Name)
fprintf(fileID,'# %s : geometrical parameters (x,y,z,twist)\r',Fuselage.Name)
fprintf(fileID,'\t t            x            y            z                   \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E    \r\n',...
              [Fuselage.t Fuselage.x Fuselage.y Fuselage.z ]'); 
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : geometrical parameters (Ccg,Ncg,Cea,Nea)\r\n',Fuselage.Name)
fprintf(fileID,'\t t            Ccg          Ncg          Cea          Nea         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [Fuselage.t Fuselage.Ccg Fuselage.Ncg Fuselage.Cea Fuselage.Nea]'); 
    
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : geometrical parameters (Cta,Nta,Xax,R)\r\n',Fuselage.Name)
fprintf(fileID,'\t t            Cta          Nta                    radius         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E   \r\n',...
              [Fuselage.t Fuselage.Cta Fuselage.Nta  Fuselage.R]');      

          
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : geometrical parameters (DCcg,DNcg)\r\n',Fuselage.Name)
fprintf(fileID,'\t t            DCcg          DNcg            \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0           \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E \r\n',...
              [Fuselage.t Fuselage.DCcg Fuselage.DNcg]');  

fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : structural parameters (EIcc,EInn,EIcn,EIcs)\r\n',Fuselage.Name)
fprintf(fileID,'\t t            EIcc          EInn          EIcn          EIcs         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [Fuselage.t Fuselage.EIcc Fuselage.EInn Fuselage.EIcn Fuselage.EIcs]');
          
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : structural parameters (EIsn,GJ,EA,GKc)\r\n',Fuselage.Name)
fprintf(fileID,'\t t            EIsn          GJ          EA          GKc         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [Fuselage.t Fuselage.EIsn Fuselage.GJ Fuselage.EA Fuselage.GKc]');     
          
          

fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : mass inertial parameters (mg,mgcc,mgnn)\r\n',Fuselage.Name)
fprintf(fileID,'\t t            mg          mgcc          mgnn \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0   \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  \r\n',...
              [Fuselage.t Fuselage.mg Fuselage.mgcc Fuselage.mgnn]');
 
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : mass inertial parameters (Dmg,Dmgcc,Dmgnn)\r\n',Fuselage.Name)
fprintf(fileID,'\t t            Dmg          Dmgcc          Dmgnn \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0   \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  \r\n',...
              [Fuselage.t Fuselage.Dmg Fuselage.Dmgcc Fuselage.Dmgnn]');
                  
          
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : aerodynamic parameters (CLmin,CLmax,Cdf,Cdp)\r\n',Fuselage.Name)
fprintf(fileID,'\t t                     Cdf          Cdp         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  \r\n',...
              [Fuselage.t  Fuselage.Cdf Fuselage.Cdp]');              
          
fprintf(fileID,'End\r')  

end

%% Wing section

if(aircraft.Wing.Status)

Wing = aircraft.Wing;

fprintf(fileID,'#========================================================================== \r\n')
fprintf(fileID,'Beam \t %i \r\n',Wing.BeamIndex)
fprintf(fileID,'%s \r\n',Wing.Name)
fprintf(fileID,'# %s : geometrical parameters (x,y,z,twist)\r',Wing.Name)
fprintf(fileID,'\t t            x            y            z            twist         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [Wing.t Wing.x Wing.y Wing.z Wing.twist]'); 
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : geometrical parameters (Ccg,Ncg,Cea,Nea)\r\n',Wing.Name)
fprintf(fileID,'\t t            Ccg          Ncg          Cea          Nea         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [Wing.t Wing.Ccg Wing.Ncg Wing.Cea Wing.Nea]'); 
    
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : geometrical parameters (Cta,Nta,Xax,R)\r\n',Wing.Name)
fprintf(fileID,'\t t            Cta          Nta          Xax          radius         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [Wing.t Wing.Cta Wing.Nta Wing.Xax Wing.R]');      

          
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : geometrical parameters (DCcg,DNcg)\r\n',Wing.Name)
fprintf(fileID,'\t t            DCcg          DNcg            \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0           \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E \r\n',...
              [Wing.t Wing.DCcg Wing.DNcg]');  

fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : structural parameters (EIcc,EInn,EIcn,EIcs)\r\n',Wing.Name)
fprintf(fileID,'\t t            EIcc          EInn          EIcn          EIcs         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [Wing.t Wing.EIcc Wing.EInn Wing.EIcn Wing.EIcs]');
          
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : structural parameters (EIsn,GJ,EA,GKc)\r\n',Wing.Name)
fprintf(fileID,'\t t            EIsn          GJ          EA          GKc         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [Wing.t Wing.EIsn Wing.GJ Wing.EA Wing.GKc]');     
          
          

fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : mass inertial parameters (mg,mgcc,mgnn)\r\n',Wing.Name)
fprintf(fileID,'\t t            mg          mgcc          mgnn \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0   \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  \r\n',...
              [Wing.t Wing.mg Wing.mgcc Wing.mgnn]');
 
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : mass inertial parameters (Dmg,Dmgcc,Dmgnn)\r\n',Wing.Name)
fprintf(fileID,'\t t            Dmg          Dmgcc          Dmgnn \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0   \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  \r\n',...
              [Wing.t Wing.Dmg Wing.Dmgcc Wing.Dmgnn]');
          
          
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : aerodynamic parameters (chord,alpha,dCLda,Cm)\r\n',Wing.Name)
fprintf(fileID,'\t t            chord          alpha          dCLda          Cm         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [Wing.t Wing.chord Wing.alpha Wing.dCLda Wing.Cm]');     
          
          
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : aerodynamic parameters (CLmin,CLmax,Cdf,Cdp)\r\n',Wing.Name)
fprintf(fileID,'\t t            CLmin          CLmax          Cdf          Cdp         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [Wing.t Wing.CLmin Wing.CLmax Wing.Cdf Wing.Cdp]');              
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\t t            dCLdF1          dCMdF1          dCLdF2          dCMdF2         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E %.5E  %.5E \r\n',...
              [-flip(Wing.t) Wing.dCLdF1 Wing.dCMdF1  Wing.dCLdF2 ...
              Wing.dCMdF2]');           
fprintf(fileID,'\t %.5E  %.5E  %.5E %.5E  %.5E \r\n',...
              [Wing.t Wing.dCLdF1 Wing.dCMdF1 ...
              -Wing.dCLdF2 -Wing.dCLdF2]');            
fprintf(fileID,'End\r')

end  
%% V-Tail section:

if(aircraft.VTail.Status)
VTail = aircraft.VTail;

fprintf(fileID,'#========================================================================== \r\n')
fprintf(fileID,'Beam \t %i \r\n',VTail.BeamIndex)
fprintf(fileID,'%s \r\n',VTail.Name)
fprintf(fileID,'# %s : geometrical parameters (x,y,z,twist)\r',VTail.Name)
fprintf(fileID,'\t t            x            y            z            twist         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [VTail.t VTail.x VTail.y VTail.z VTail.twist]'); 
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : geometrical parameters (Ccg,Ncg,Cea,Nea)\r\n',VTail.Name)
fprintf(fileID,'\t t            Ccg          Ncg          Cea          Nea         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [VTail.t VTail.Ccg VTail.Ncg VTail.Cea VTail.Nea]'); 
    
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : geometrical parameters (Cta,Nta,Xax,R)\r\n',VTail.Name)
fprintf(fileID,'\t t            Cta          Nta          Xax          radius         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [VTail.t VTail.Cta VTail.Nta VTail.Xax VTail.R]');      

          
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : geometrical parameters (DCcg,DNcg)\r\n',VTail.Name)
fprintf(fileID,'\t t            DCcg          DNcg            \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0           \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E \r\n',...
              [VTail.t VTail.DCcg VTail.DNcg]');  

fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : structural parameters (EIcc,EInn,EIcn,EIcs)\r\n',VTail.Name)
fprintf(fileID,'\t t            EIcc          EInn          EIcn          EIcs         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [VTail.t VTail.EIcc VTail.EInn VTail.EIcn VTail.EIcs]');
          
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : structural parameters (EIsn,GJ,EA,GKc)\r\n',VTail.Name)
fprintf(fileID,'\t t            EIsn          GJ          EA          GKc         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [VTail.t VTail.EIsn VTail.GJ VTail.EA VTail.GKc]');     
          
          

fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : mass inertial parameters (mg,mgcc,mgnn)\r\n',VTail.Name)
fprintf(fileID,'\t t            mg          mgcc          mgnn \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0   \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  \r\n',...
              [VTail.t VTail.mg VTail.mgcc VTail.mgnn]');
 
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : mass inertial parameters (Dmg,Dmgcc,Dmgnn)\r\n',VTail.Name)
fprintf(fileID,'\t t            Dmg          Dmgcc          Dmgnn \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0   \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  \r\n',...
              [VTail.t VTail.Dmg VTail.Dmgcc VTail.Dmgnn]');
          
          
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : aerodynamic parameters (chord,alpha,dCLda,Cm)\r\n',VTail.Name)
fprintf(fileID,'\t t            chord          alpha          dCLda          Cm         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [VTail.t VTail.chord VTail.alpha VTail.dCLda VTail.Cm]');     
          
          
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\n#  %s : aerodynamic parameters (CLmin,CLmax,Cdf,Cdp)\r\n',VTail.Name)
fprintf(fileID,'\t t            CLmin          CLmax          Cdf          Cdp         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E  %.5E  %.5E  \r\n',...
              [VTail.t VTail.CLmin VTail.CLmax VTail.Cdf VTail.Cdp]');  
          
fprintf(fileID,'#--------------------------------------------------------------------------\r')          
fprintf(fileID,'\t t            dCLdF3          dCMdF3          dCLdF4          dCMdF4         \r')
% fprintf(fileID,'* \t 1.0          1.0          1.0          1.0          1.0         \r')
fprintf(fileID,'\t %.5E  %.5E  %.5E %.5E  %.5E \r\n',...
              [-flip(VTail.t) VTail.dCLdF3 VTail.dCMdF3 -VTail.dCLdF4...
              -VTail.dCMdF4]');           
fprintf(fileID,'\t %.5E  %.5E  %.5E %.5E  %.5E \r\n',...
              [VTail.t VTail.dCLdF3 VTail.dCMdF3 ...
              VTail.dCLdF4 VTail.dCMdF4]');            
fprintf(fileID,'End\r')    
end
end