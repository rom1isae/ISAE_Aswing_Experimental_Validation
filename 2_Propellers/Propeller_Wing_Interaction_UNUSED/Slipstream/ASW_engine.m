clear all ; close all ; clc





% engine input 
RPM = 8000 % in rotation/m
OMG = 2*pi*(RPM/60); % in rad/s
VA = 0;  %static performance in m/s
RENG = 0.05 % in m 
B    =  3    % number of blades
c80  = 0.025 % chord taken at 80% of Reng
cd80 = 0.025 % drag coeficient taken at 80% of Reng
RHO = 1.215 % volumic mass
CDA = 0.1185E-4;
POW = 12.6769;    % shaft power
ADISK = pi*RENG^2;
Rhub = 0.005;

% viscous power loss :

Pv = (1/8)*RHO*sqrt((VA^2 + OMG^2*RENG^2))*(VA^2 + 3*OMG^2*RENG^2)*CDA


% advance ratio 
lambda = VA/(OMG*RENG);

% inviscid power 

PINV = POW-Pv;


% swirl loss fudge factor : 

SLFF = 1.0 + 5.0*lambda^2;

% windmill Betz limit (minimum DVA)

Pmin = -0.5*RHO*VA^3* ADISK * 16/27;
DVAMIN = -VA/0.50;

% heavy loading case (maximum DVA) 

DVAMAX = 2.0*abs(PINV/(RHO*ADISK))^(1/3);

% first estimate of jet velocity increment:

DVA = sign(DVAMAX)

% convergence tolerance 

VEPS = max(abs(DVAMIN),abs(DVAMAX))*0.00001;

DVALIM = 0.95*DVAMIN;

% newton interation
   for i = 1:20
       DVA = max(DVA,DVALIM);
       FENG     = RHO*ADISK*(VA + 0.5*DVA)*DVA;
       FENG_DVA = RHO*ADISK*(VA +     DVA);
       RES      = (VA + SLFF*0.5*DVA)*FENG  -PINV;
       RES_DVA  = (VA + SLFF*0.5*DVA)*FENG_DVA+SLFF*0.5*FENG;
       DDVA = -RES / RES_DVA;
       if (DVA == DVALIM &  DVA < 0.0)
          i = 20;
          display("Betz limits reached")
       end
       if (abs(DDVA) < VEPS )
          i = 20; % convergence reached 
       end
       DVA = DVA + DDVA;

   end
    if (abs(DDVA)>VEPS )
        display("convergence failed")
    else
        display("convergence reached")
    end
    
    FENG = RHO*ADISK*(VA+0.5*DVA)*DVA
    MENG = - POW/OMG
    %%
    close all
    
   
    figure(1)
%     subplot(3,1,1)
    X = 0.2*2*RENG;
    Y = linspace(-1.25*RENG,+1.25*RENG,40);
    Z =  linspace(-1.25*RENG,+1.25*RENG,40);
    
    [VAXIAL,VSWIRL] = Jet_field_hub(X,Y,Z,VA,DVA,FENG,MENG,RENG,RHO,Rhub);
    
    [y,z] = meshgrid(Y,Z);
    y = y./RENG;
    z = z./RENG;
    pcolor(y,z,VA+VAXIAL)
    cmap = turbo(13)
    colormap(cmap)
    colorbar
    caxis([0 24]);
    grid on
    alpha 0.5
    hold on
    quiver(y,z,VSWIRL(:,:,3),VSWIRL(:,:,2),'k')
    axis equal
    xlabel('y/R normalised spanwise coordonate')
    ylabel('z/R normalized vertical coordonate')
    a = colorbar;
    a.Label.String = 'V_{jet,x}';
    title('x/D = 1.0') 
    shading interp
    
%     subplot(3,1,2)
%     X = 1.5*2*RENG;
%     Y = linspace(-1.25*RENG,+1.25*RENG,40);
%     Z =  linspace(-1.25*RENG,+1.25*RENG,40);
%     
%     [VAXIAL,VSWIRL] = Jet_field(X,Y,Z,VA,DVA,FENG,MENG,RENG,RHO);
%     
%     [y,z] = meshgrid(Y,Z);
%     y = y./RENG;
%     z = z./RENG;
%     pcolor(y,z,VAXIAL)
%     colormap('turbo')
%     colorbar
%     caxis([0 24]);
%     alpha 1.0
%     hold on
%     quiver(y,z,VSWIRL(:,:,3),VSWIRL(:,:,2),'k')
%     axis equal
%     xlabel('y/R normalised spanwise coordonate')
%     ylabel('z/R normalized vertical coordonate')
%     a = colorbar;
%     a.Label.String = 'V_{jet,x}';
%     title('x/D = 1.5') 
%     shading interp
%     
%     subplot(3,1,3)
%     X = 1.5*2*RENG;
%     Y = linspace(-1.25*RENG,+1.25*RENG,40);
%     Z =  linspace(-1.25*RENG,+1.25*RENG,40);
%     
%     [VAXIAL,VSWIRL] = Jet_field(X,Y,Z,VA,DVA,FENG,MENG,RENG,RHO);
%     
%     [y,z] = meshgrid(Y,Z);
%     y = y./RENG;
%     z = z./RENG;
%     pcolor(y,z,VAXIAL)
%     colormap('turbo')
%     colorbar
%     caxis([0 24]);
%     alpha 1.0
%     hold on
%     quiver(y,z,VSWIRL(:,:,3),VSWIRL(:,:,2),'k')
%     axis equal
%     xlabel('y/R normalised spanwise coordonate')
%     ylabel('z/R normalized vertical coordonate')
%     a = colorbar;
%     a.Label.String = 'V_{jet,x}';
%     title('x/D = 2.0') 
%     shading interp
%     
%     
%     
%     
    
%%
    
  
    close all
    Nc = 30;
   
    
    
    figure(2)
    X = 0.5*RENG;
    Y = linspace(-1.25*RENG,+1.25*RENG,Nc);
    Z =  linspace(-1.25*RENG,+1.25*RENG,Nc);
    
    [VAXIAL,VSWIRL] = Jet_field_hub(X,Y,Z,VA,DVA,FENG,MENG,RENG,RHO,Rhub);
    
    [y,z] = meshgrid(Y,Z);
    y = y./RENG;
    z = z./RENG;
    x = X/RENG + zeros(size(z));
    
    surf(x,y,z,VA+VAXIAL)
    alpha 0.5
    hold on
    quiver3(x,y,z,VSWIRL(:,:,1),VSWIRL(:,:,3),VSWIRL(:,:,2),'k')
    
       X = 2.0*RENG;
    Y = linspace(-1.25*RENG,+1.25*RENG,Nc);
    Z =  linspace(-1.25*RENG,+1.25*RENG,Nc);
    
    [VAXIAL,VSWIRL] = Jet_field_hub(X,Y,Z,VA,DVA,FENG,MENG,RENG,RHO,Rhub);
    
    [y,z] = meshgrid(Y,Z);
    y = y./RENG;
    z = z./RENG;
    x = X/RENG + zeros(size(z));
    
    hold on
    surf(x,y,z,VA+VAXIAL)
    alpha 0.8
    hold on
    quiver3(x,y,z,VSWIRL(:,:,1),VSWIRL(:,:,3),VSWIRL(:,:,2),'k')
    
    X = 4.0*RENG;
    Y = linspace(-1.25*RENG,+1.25*RENG,Nc);
    Z =  linspace(-1.25*RENG,+1.25*RENG,Nc);
    
    [VAXIAL,VSWIRL] = Jet_field_hub(X,Y,Z,VA,DVA,FENG,MENG,RENG,RHO,Rhub);
    
    [y,z] = meshgrid(Y,Z);
    y = y./RENG;
    z = z./RENG;
    x = X/RENG + zeros(size(z));
    
    hold on
    surf(x,y,z,VA+VAXIAL)
    alpha 0.8
    hold on
    quiver3(x,y,z,VSWIRL(:,:,1),VSWIRL(:,:,3),VSWIRL(:,:,2),'k')
%     hold on
%     quiver(y,z,VSWIRL(:,:,3),VSWIRL(:,:,2),'k')

    X = 10.0*RENG;
    Y = linspace(-1.25*RENG,+1.25*RENG,Nc);
    Z =  linspace(-1.25*RENG,+1.25*RENG,Nc);
    
    [VAXIAL,VSWIRL] = Jet_field_hub(X,Y,Z,VA,DVA,FENG,MENG,RENG,RHO,Rhub);
    
    [y,z] = meshgrid(Y,Z);
    y = y./RENG;
    z = z./RENG;
    x = X/RENG + zeros(size(z));
    
    hold on
    surf(x,y,z,VA+VAXIAL)
    alpha 0.5
    hold on
    quiver3(x,y,z,VSWIRL(:,:,1),VSWIRL(:,:,3),VSWIRL(:,:,2),'k')
    
    X = 6.0*RENG;
    Y = linspace(-1.25*RENG,+1.25*RENG,Nc);
    Z =  linspace(-1.25*RENG,+1.25*RENG,Nc);
    
    [VAXIAL,VSWIRL] = Jet_field_hub(X,Y,Z,VA,DVA,FENG,MENG,RENG,RHO,Rhub);
    
    [y,z] = meshgrid(Y,Z);
    y = y./RENG;
    z = z./RENG;
    x = X/RENG + zeros(size(z));
    
    hold on
    surf(x,y,z,VA+VAXIAL)
    alpha 0.5
    hold on
    quiver3(x,y,z,VSWIRL(:,:,1),VSWIRL(:,:,3),VSWIRL(:,:,2),'k')

    X = 8.0*RENG;
    Y = linspace(-1.25*RENG,+1.25*RENG,Nc);
    Z =  linspace(-1.25*RENG,+1.25*RENG,Nc);
    
    [VAXIAL,VSWIRL] = Jet_field_hub(X,Y,Z,VA,DVA,FENG,MENG,RENG,RHO,Rhub);
    
    [y,z] = meshgrid(Y,Z);
    y = y./RENG;
    z = z./RENG;
    x = X/RENG + zeros(size(z));
    
    hold on
    surf(x,y,z,VA+VAXIAL)
    alpha 0.5
    hold on
    quiver3(x,y,z,VSWIRL(:,:,1),VSWIRL(:,:,3),VSWIRL(:,:,2),'k')


    axis equal
    xlabel('x/R')
    ylabel('y/R')
    zlabel('z/R')
    colormap('turbo')
    colorbar
%     caxis([0 24]);
    a = colorbar;
    a.Label.String = 'V_{jet,x}';
    shading interp
    xlim([0 10])
    
    
    %%
    VT = OMG*RENG;
    X =0.5*RENG;
    Y = linspace(0,1.0*RENG,100);
    Z =  linspace(0,+1.0*RENG,100);
    Rhub = 0.01;
    [VAXIAL,VSWIRL] =Jet_field_hub(X,Y,Z,VA,DVA,FENG,MENG,RENG,RHO,Rhub);
    figure(1)
    subplot(1,2,1)
    plot(Z(1:end)/RENG,VAXIAL(1:end,1,:)/VT,'--b*')
    grid on
    xlabel('r/R') 
    ylabel('Vx/VT')
    
    subplot(1,2,2)
    plot(Z(1:end)/RENG,sqrt(VSWIRL(1:end,1,2).^2 + VSWIRL(1:end,1,3).^2)/VT,'--b*')
    grid on
    xlabel('r/R') 
    ylabel('vt(r)/VT')
    
