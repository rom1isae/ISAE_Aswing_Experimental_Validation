function [VAXIAL,VSWIRL] = Jet_field(X,Y,Z,VA,DVA,FENG,MENG,RENG,RHO)
EPSILON_C = 0.11*abs(DVA)/(VA+DVA);
EPSILON_B = 0.11*abs(DVA)/(VA+0.5*DVA);
RENGP = RENG*sqrt((VA+0.5*DVA)/(VA+DVA));
XMIX = RENGP/EPSILON_C


BJET_X = RENGP + EPSILON_B * X;
if X < XMIX
  CJET_X = RENGP-EPSILON_B * X; 
else
  CJET_X = 0;
end

% Compute DV0 et DW0 :

% DV0JET :
K1 = CJET_X^2 +(9/10)*CJET_X*(BJET_X-CJET_X)+(9/35)*(BJET_X-CJET_X)^2;
K2 = CJET_X^2 +(243/385)*CJET_X*(BJET_X-CJET_X)+(243/1820)*(BJET_X-CJET_X)^2;

DV0JET = sqrt(0.25*(K1^2 / K2^2) * VA^2 + FENG/(RHO*pi*K2)) - 0.5 * (K1/K2)*VA;

% DW0SWRIL:

K3 = (2/3)*CJET_X^3 + (9/10)*CJET_X^2*(BJET_X-CJET_X) + (9/35)*CJET_X*(BJET_X-CJET_X)^2 + (1/9)*(BJET_X-CJET_X)^3;
K4 = (2/3)*CJET_X^3 + (243/385)*CJET_X^2*(BJET_X-CJET_X) + (243/1820)*CJET_X*(BJET_X-CJET_X)^2 + (2/45)*(BJET_X-CJET_X)^3;


DW0SWRIL = (-MENG/(pi*RHO))* 1/(K3*VA+K4*DV0JET);
NY = length(Y);
NZ = length(Z);
% construction du plan 2D de vitesse
for i =1:length(Y)
    for j = 1:length(Z)
        RJET = sqrt(Y(i)^2 + Z(j)^2);
        RJET_VEC = [0  Y(i)  Z(j)]./RJET;
        XJET = [1  0  0];
        ROT =  [0 -RJET_VEC(3) +RJET_VEC(2)];
        ROT = cross(XJET,RJET_VEC);
        % axial jet
        if X < 0 && RJET >= BJET_X
            VAXIAL(i,j,1:2) = 0.0;
        elseif X>0 && RJET > CJET_X && RJET < BJET_X
            VAXIAL(i,j) = DV0JET*(1-((RJET-CJET_X)/(BJET_X-CJET_X))^(1.5))^2; 
        elseif X>0 && RJET <= CJET_X 
            VAXIAL(i,j) = DV0JET;
        else
            VAXIAL(i,j) = 0.0;
        end
        % jet swirl in cartesian coordonate 
        if X < 0 && RJET >= BJET_X
            VSWIRL(i,j,1:3) = 0.0*ROT
        elseif X>0 && RJET > CJET_X && RJET < BJET_X
            VSWIRL(i,j,1:3) = DW0SWRIL*(1-((RJET-CJET_X)/(BJET_X-CJET_X))^(1.5))^2*ROT; 
        elseif X>0 && RJET <= CJET_X 
            VSWIRL(i,j,1:3) = DW0SWRIL*ROT; 
        else 
            VSWIRL(i,j,1:3) = 0.0*ROT;
        end
    end
    
    
end
        
       
      
       
