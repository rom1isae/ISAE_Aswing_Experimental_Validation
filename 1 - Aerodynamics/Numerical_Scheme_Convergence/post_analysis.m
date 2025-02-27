clear all ; close all ;  clc



A3{1} = readtable('rect_A3_N6.txt','NumHeaderLines',0)
A3{2} = readtable('rect_A3_N12.txt','NumHeaderLines',34);
A3{3} = readtable('rect_A3_N24.txt','NumHeaderLines',34);
A3{4} = readtable('rect_A3_N48.txt','NumHeaderLines',34);
A3{5} = readtable('rect_A3_N96.txt','NumHeaderLines',34);


A6{1} = readtable('rect_A6_N6.txt','NumHeaderLines',0);
A6{2} = readtable('rect_A6_N12.txt','NumHeaderLines',34);
A6{3} = readtable('rect_A6_N24.txt','NumHeaderLines',34);
A6{4} = readtable('rect_A6_N48.txt','NumHeaderLines',34);
A6{5} = readtable('rect_A6_N96.txt','NumHeaderLines',34);


A9{1} = readtable('rect_A9_N6.txt','NumHeaderLines',0);
A9{2} = readtable('rect_A9_N12.txt','NumHeaderLines',34);
A9{3} = readtable('rect_A9_N24.txt','NumHeaderLines',34);
A9{4} = readtable('rect_A9_N48.txt','NumHeaderLines',34);
A9{5} = readtable('rect_A9_N96.txt','NumHeaderLines',34);

figure(1)
for i = 1:5
subplot(3,1,1)
plot(A3{i}.Var2(1:end-1)/0.5,A3{i}.Var8(1:end-1)*(0.2*20)/2,'-o')
hold on 
xlim([0 1])
xlabel('normalized span distribution (y/ymax)')
ylabel('\Gamma distribution')
title('\alpha = 3.0')
grid on
legend('N = 6','N = 12','N = 24','N=48','N=96')
subplot(3,1,2)
plot(A6{i}.Var2(1:end-1)/0.5,A6{i}.Var8(1:end-1)*(0.2*20)/2,'-o')
hold on 
xlim([0 1])
xlim([0 1])
xlabel('normalized span distribution (y/ymax)')
ylabel('\Gamma distribution')
title('\alpha = 6.0')
grid on
legend('N = 6','N = 12','N = 24','N=48','N=96')
subplot(3,1,3)
plot(A9{i}.Var2(1:end-1)/0.5,A9{i}.Var8(1:end-1)*(0.2*20)/2,'-o')
hold on 
xlim([0 1])
xlim([0 1])
xlabel('normalized span distribution (y/ymax)')
ylabel('\Gamma distribution')
title('\alpha = 9.0')
grid on
legend('N = 6','N = 12','N = 24','N=48','N=96')
end

figure(2)
for i = 1:5
plot(A9{i}.Var2(1:end-1)/0.5,A9{i}.Var8(1:end-1)*(0.2*20)/2,'-o')
hold on 
xlim([0 1])
xlabel('normalized span distribution (y/ymax)')
ylabel('\Gamma distribution')
title('\alpha = 9.0')
grid on
legend('N = 6','N = 12','N = 24','N=48','N=96')
end

%%

CLA3 = [0.2509 0.2540  0.2554 0.2561 0.2564];
CLA6 = [0.5001 0.5063 0.5091 0.5105 0.5111];
CLA9 = [0.7459 0.7552 0.7593 0.7614 0.7624];


for i = 2:5
   eA3(i-1) = abs((CLA3(i-1)-CLA3(i))/CLA3(i-1))
   eA6(i-1) = abs((CLA9(i-1)-CLA9(i))/CLA9(i-1))
   eA9(i-1) = abs((CLA9(i-1)-CLA9(i))/CLA9(i-1))
end
N = [12 24 48 96];

figure(3)
plot(log(N)/log(2),log(eA3)/log(10),'-.ro','linewidth',1,MarkerSize=10)
hold on
plot(log(N)/log(2),log(eA6)/log(10),'-.bs','linewidth',1,MarkerSize=10)
hold on
plot(log(N)/log(2),log(eA9)/log(10),'-.k*','linewidth',1,MarkerSize=10)
x = log(N)/log(2)
x = x(1:end);
y = log(eA3)/log(10);
p= polyfit(x,y,1)

yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg1 = "convergence  rate =  -" +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'-r','linewidth',1)
x = log(N)/log(2)
x = x(1:end);
y = log(eA6)/log(10);
p= polyfit(x,y,1)

yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg2 = "convergence  rate =  -" +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'-b','linewidth',1)
x = log(N)/log(2)
x = x(1:end);
y = log(eA3)/log(10);
p= polyfit(x,y,1)

yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
leg3 = "convergence  rate =  -" +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'-k','linewidth',1)
grid on 
legend('$\alpha = 3.0$','$\alpha = 6.0$','$\alpha = 9.0$',leg1,leg2,leg3,'Interpreter','latex')
xlabel('p = log(N)/log(2), N = 2^p (number of circulations variables)')
ylabel('q = ln(\epsilon_{CL}),  (\epsilon_{CL} = 10^q)')



%% Elliptical WING ALPHA = 8.0
% close all


A8{1} = readtable('ellip_A8_N6.txt','NumHeaderLines',34)
A8{2} = readtable('ellip_A8_N12.txt','NumHeaderLines',34);
A8{3} = readtable('ellip_A8_N24.txt','NumHeaderLines',34);
A8{4} = readtable('ellip_A8_N48.txt','NumHeaderLines',34);
A8{5} = readtable('ellip_A8_N96.txt','NumHeaderLines',34);


figure(4)
for i = 1:5
plot(A8{i}.Var2(1:end-1)/max(A8{i}.Var2(1:end-1)),A8{i}.Var9(1:end-1)/max(A8{i}.Var9(1:end-1)),'-o')
hold on 
xlim([0 1])
xlabel('normalized span distribution (y/ymax)')
ylabel('lift distribution')
title('\alpha = 8.0')
grid on
legend('N = 6','N = 12','N = 24','N=48','N=96')
end

CLA8 = [0.5903 0.6374 0.6489 0.6520 0.6529];
CL = 0.6599;
N = [6 12 24 48 96];
for i = 1:5
   eA8(i) = abs((CL-CLA8(i)))/CL;
   reA8(i) = abs((CLA8(end)-CLA8(i)))/CLA8(end);
end

figure(5)
plot(log(N)/log(2),eA8,'--ro')
hold on
plot(log(N)/log(2),reA8,'-bs')
grid on
yscale log
xlabel('2^N number of points in the mesh')
legend('Absolute error with Prandtl theoretical CL','relative error with more refined mesh')
ylabel('CL prediction relative error in  %')
