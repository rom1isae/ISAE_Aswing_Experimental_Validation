function Wing = Quasi_Eliptical_Wing(Wing,b,c0,b_ratio,X0,Y0,Z0,Xshift,twist,Lambda,N,airfoil)
theta = 0:pi/N:pi;
y = (b/4) - (b/4)*cos(theta);
br =0.5* b_ratio * b;
bwe = 0.5*(1-b_ratio)*b;
Lambda = Lambda * pi /180
Rot = [cos(Lambda) -sin(Lambda);sin(Lambda) cos(Lambda)];
        Wing.Sref  = 0.0;
        Wing.y =zeros(N,1);
        Wing.x = zeros(N,1);
        Wing.z = zeros(N,1);
        Wing.twist =zeros(N,1);
        Wing.Ccg = zeros(N,1);
        Wing.Ncg =zeros(N,1);
        Wing.Cea =zeros(N,1);
        Wing.Nea =zeros(N,1);
        Wing.Cta =zeros(N,1);
        Wing.Nta =zeros(N,1);
        Wing.Xax=zeros(N,1);
        Wing.R =zeros(N,1);
        Wing.DCcg =zeros(N,1);
        Wing.DNcg =zeros(N,1);
        Wing.EIcc =zeros(N,1);
        Wing.EInn =zeros(N,1);
        Wing.EIcn=zeros(N,1);
        Wing.EIcs=zeros(N,1);
        Wing.EIsn=zeros(N,1);
        Wing.GJ =zeros(N,1);
        Wing.EA =zeros(N,1);
        Wing.GKc =zeros(N,1);
        Wing.mg =zeros(N,1);
        Wing.mgcc =zeros(N,1);
        Wing.mgnn =zeros(N,1);
        Wing.Dmg =zeros(N,1);
        Wing.Dmgcc =zeros(N,1);
        Wing.Dmgnn = zeros(N,1);
        

        Wing.chord = zeros(N,1);
        Wing.Cm =zeros(N,1);
        Wing.CLmin =zeros(N,1);
        Wing.CLmax =zeros(N,1);
for i =1:length(y)
    if y(i) <= br % rectangular section
        
        
        Wing.y(i) = Y0+y(i);
        Wing.x(i) = X0 + -Xshift*c0;
        Wing.z(i) = Z0;
        Wing.twist(i) = twist;
        Wing.Ccg(i) = 0;
        Wing.Ncg(i) = 0;
        Wing.Cea(i) = 0;
        Wing.Nea(i) = 0;
        Wing.Cta(i) = 0;
        Wing.Nta(i) = 0;
        Wing.Xax(i)  = 0;
        Wing.R(i) = 0*airfoil.max_thickness*c0;
        Wing.DCcg(i)  = 0;
        Wing.DNcg(i)  = 0;
        Wing.EIcc(i)  = 0;
        Wing.EInn(i)  = 0;
        Wing.EIcn(i)  = 0;
        Wing.EIcs(i)  = 0;
        Wing.EIsn(i)  = 0;
        Wing.GJ(i)  = 0;
        Wing.EA(i)  = 0;
        Wing.GKc(i)  = 0;
        Wing.mg(i)  = 0;
        Wing.mgcc(i)  = 0;
        Wing.mgnn(i)  = 0;
        Wing.Dmg(i)  = 0;
        Wing.Dmgcc(i)  = 0;
        Wing.Dmgnn(i)  = 0;
        

        Wing.chord(i) = c0;
        Wing.Cm(i) = airfoil.Cm;
        Wing.CLmin(i) = airfoil.CLmin;
        Wing.CLmax(i) = airfoil.CLmax;

        
        

    else 
        Wing.chord(i) = real(c0*sqrt(1-((y(i)-br)/bwe)^2));
        Wing.twist(i) = twist;
        Wing.Cm(i) = airfoil.Cm;
        Wing.CLmin(i) = airfoil.CLmin;
        Wing.CLmax(i) = airfoil.CLmax;

        
        
        Wing.R(i) = 0*airfoil.max_thickness*Wing.chord(i);
        Wing.DCcg(i)  = 0;
        Wing.DNcg(i)  = 0;
        Wing.EIcc(i)  = 0;
        Wing.EInn(i)  = 0;
        Wing.EIcn(i)  = 0;
        Wing.EIcs(i)  = 0;
        Wing.EIsn(i)  = 0;
        Wing.GJ(i)  = 0;
        Wing.EA(i)  = 0;
        Wing.GKc(i)  = 0;
        Wing.mg(i)  = 0;
        Wing.mgcc(i)  = 0;
        Wing.mgnn(i)  = 0;
        Wing.Dmg(i)  = 0;
        Wing.Dmgcc(i)  = 0;
        Wing.Dmgnn(i)  = 0;
        
        Wing.y(i) = Y0+y(i);
        Wing.x(i) = X0 -Xshift*Wing.chord(i);
        Wing.z(i) = Z0;

        Wing.Ccg(i) = 0;
        Wing.Ncg(i) = 0;
        Wing.Cea(i) = 0;
        Wing.Nea(i) = 0;
        Wing.Cta(i) = 0;
        Wing.Nta(i) = 0;
        Wing.Xax(i)  = 0;
        

    end
%     figure(1)
%     subplot(2,1,1)
%     plot([Wing.y(i) Wing.y(i)],[Wing.x(i) Wing.x(i)+Wing.chord(i)],'b')
%     hold on
    if i ==1
      Wing.Sref = Wing.Sref+ Wing.chord(i)*y(i);
    else
      Wing.Sref = Wing.Sref+ Wing.chord(i)*(y(i)-y(i-1));  
    end
    
      Wing.y(i)  = Rot(1,:)* [ Wing.y(i)-Y0  ; Wing.z(i)-Z0 ] + Y0;
      Wing.z(i)  = Rot(2,:)* [ Wing.y(i)-Y0  ; Wing.z(i)-Z0  ]+Z0 ;
   
end
    
% 
%     plot(Wing.y,Wing.x,'-bo')
%     hold on
%     plot(Wing.y,Wing.x+0.25*Wing.chord,'-r*') 
%     hold on
%     plot(Wing.y,Wing.x+0.75*Wing.chord,'-k*')
%     hold on 
%     plot(Wing.y,Wing.x+Wing.chord,'-b*')
%     axis equal
%     xlabel('y position in meters')
%     ylabel('x position in meters')
%     grid on 
%     subplot(2,1,2)
%     plot(Wing.y,Wing.z,'-b*')
%     xlabel('y position in meters')
%     ylabel('z position in meters')
%     axis equal
%     grid on 
    
   Wing.Sref = 2*  Wing.Sref;   
   
   
   Wing.t = Wing.y;
   Wing.y(1) = 0.0;
   Wing.t(1) = 0.0;
   
   
   
end
