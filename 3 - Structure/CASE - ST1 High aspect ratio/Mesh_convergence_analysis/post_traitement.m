clear all ; close all ; clc

XYZ = [  -0.895697E-01 -0.179582     -0.102729    
         -0.104417     -0.171348     -0.159739    
          -0.104810     -0.170931     -0.162220   
          -0.104867     -0.170861     -0.162651   
           -0.104881     -0.170845     -0.162750    
           -0.104884     -0.170841     -0.162774   
           -0.104885     -0.170840     -0.162780   ];
       
 
       
% eXYZ = abs((XYZ - ones(7,1)*XYZ(end,1:3))./XYZ(end,1:3))


for i=2:7   
eXYZ(i-1,:) = abs((XYZ(i-1,:) - XYZ(i,:))./XYZ(i-1,:))
end

N = [8 16 32 64 128 256];
figure(1)
plot(log(N)/log(2),log(eXYZ(:,1))/log(10),'ob',MarkerFaceColor='b',MarkerSize=8)
hold on
plot(log(N)/log(2),log(eXYZ(:,2))/log(10),'rs',MarkerFaceColor='r',MarkerSize=8)
hold on
plot(log(N)/log(2),log(eXYZ(:,3))/log(10),'kv',MarkerFaceColor='k',MarkerSize=8)
hold on

x = log(N)/log(2)
x = x(2:end);
y = log(eXYZ(2:end,1))/log(10);
p= polyfit(x,y,1)

yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg1 = "rate =  -" +num2str(p(1),2) + "$\ (r^2 = "+num2str(rsq,2)+")$";
plot(x,yfit,'-b','linewidth',1.5)
hold on
x = log(N)/log(2)
x = x(2:end);
y = log(eXYZ(2:end,2))/log(10);
p= polyfit(x,y,1)
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
leg2 ="rate =  -" +num2str(p(1),2) + "$\ (r^2 = "+num2str(rsq,2)+")$";
plot(x,yfit,'-r','linewidth',1.5)
x = log(N)/log(2)
x = x(2:end);
y = log(eXYZ(2:end,3))/log(10);
p= polyfit(x,y,1)
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
leg3 = "rate =  -" +num2str(p(1),2) + "$\ (r^2 = "+num2str(rsq,2)+")$";
plot(x,yfit,'-k','linewidth',1.5)
grid on 
xlabel('log_2(N)  (N number of nodes)')
ylabel('log_{10}(\epsilon)')
legend('$log_{10}(\epsilon_x)$','$log_{10}(\epsilon_y)$','$log_{10}(\epsilon_z)$',leg1,leg2,leg3,'Interpreter','latex')
% title('Numerical scheme convergence [0/90]_{3s}, \theta = 45°')
saveas(gcf,'SCN_deflection','epsc')

%%
clear x
clear y
clear err_Freq
N = [8 16 32 64 128 256];
Freq = [7.1309959    6.1184057   6.0799870  6.0731285   6.0715471  6.0711666     6.0710754  ;
        26.362994  11.725270   11.465930   11.419661    11.409100  11.406564      11.405958 
        1221.5450    90.054796   86.574972     85.931696   85.787350     85.752961       85.744721  
        1906.2946     506.33578    437.59447      426.23607      423.72115    423.12317      422.98016    ];
      
      
% err_Freq =  abs((Freq -Freq(1:end,end)* ones(1,7))./Freq(1:end,end));


for i=2:7  
err_Freq(:,i-1) = abs(Freq(:,i-1) - Freq(:,i))./Freq(:,i-1)
end

figure(2)
plot(log(N)/log(2),log(err_Freq(1,:))/log(10),'rs',MarkerFaceColor='r',MarkerSize=8)
hold on
plot(log(N)/log(2),log(err_Freq(2,:))/log(10),'bo',MarkerFaceColor='b',MarkerSize=8)
hold on
plot(log(N)/log(2),log(err_Freq(3,:))/log(10),'kv',MarkerFaceColor='k',MarkerSize=8)
hold on
plot(log(N)/log(2),log(err_Freq(4,:))/log(10),'d','Color',[0 0.5 0],MarkerFaceColor=[0 0.5 0],MarkerSize=8)
hold on
x = log(N)/log(2)
x = x(2:end);
y = log(err_Freq(1,2:end))/log(10);
p= polyfit(x,y,1)

yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg1 = "rate =  -" +num2str(p(1),2) + "$\ (r^2 = "+num2str(-rsq,2)+")$";
plot(x,yfit,'-r','linewidth',1.5)
hold on
x = log(N)/log(2)
x = x(2:end);
y = log(err_Freq(2,2:end))/log(10);
p= polyfit(x,y,1)

yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg2 ="rate =  -" +num2str(p(1),2) + "$\ (r^2 = "+num2str(-rsq,2)+")$";
plot(x,yfit,'-b','linewidth',1.5)
hold on
x = log(N)/log(2)
x = x(2:end);
y = log(err_Freq(3,2:end))/log(10);
p= polyfit(x,y,1)

yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg3 ="rate =  -" +num2str(p(1),2) + "$\ (r^2 = "+num2str(-rsq,2)+")$";
plot(x,yfit,'-k','linewidth',1.5)
hold on
x = log(N)/log(2)
x = x(2:end);
y = log(err_Freq(4,2:end))/log(10);
p= polyfit(x,y,1)

yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg4 = "rate =  -" +num2str(p(1),2) + "$\ (r^2 = "+num2str(-rsq,2)+")$";
plot(x,yfit,'-k','Color',[0 0.5 0],'linewidth',1.5)
grid on 
xlabel('log_2(N) (N number of nodes)')
ylabel('log_{10}(\epsilon)')
ylim([-5 1])
legend('$log_{10}(\epsilon_{1B})$','$log_{10}(\epsilon_{2B})$','$lo_{10}g(\epsilon_{3B})$','$log_{10}(\epsilon_{1T})$',leg1,leg2,leg3,leg4,'Interpreter','latex','location','northeast','NumColumns',2)
% title('Numerical scheme convergence [0/90]_{3s}, \theta = 45°')
saveas(gcf,'SCN_Freq','epsc')