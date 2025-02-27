
tic 
system('sh ./calul_temps.sh')
toc

%%

t0_deflection = 0.39;
N = [8 16 32 64 128 256];
t_0 = 0.39
t_deflection =[0.41 0.42 0.47 0.59 1.46 6.61];
t_modal = [0.44 0.59 1.42 3.17 10.218 27.2];
t_deflection_reel = t_deflection-t_0
t_modal_reel = t_modal-t_0

x = log(N)/log(2)

y = log((t_deflection_reel))/log(10);
p= polyfit(x,y,1)

yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);

leg1 = "Deflection, time  rate =  " +num2str(p(1),2) + "$\ (r^2 = "+num2str(rsq,3)+")$";
plot(x,yfit,'-b','linewidth',1.5)
hold on
x = log(N)/log(2)

y = log((t_modal_reel))/log(10);
p= polyfit(x,y,1)

yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);

leg2 = "Modal, time  rate =  " +num2str(p(1),2) + "$\ (r^2 = "+num2str(rsq,3)+")$";
plot(x,yfit,'-.r','linewidth',1.5)

plot(log(N)/log(2),log((t_deflection_reel))/log(10),'sb',MarkerSize=8,MarkerFaceColor='b')
hold on
plot(log(N)/log(2),log((t_modal_reel))/log(10),'or',MarkerSize=8,MarkerFaceColor='r')
grid on 
xlabel('log_2(N) mesh size')
ylabel('log_{10}(t) in s')
legend(leg1,leg2,'Interpreter','latex')