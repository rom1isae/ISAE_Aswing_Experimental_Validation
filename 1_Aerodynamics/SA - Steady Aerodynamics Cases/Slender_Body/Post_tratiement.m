clear all
close all
clc

%% R-33

R33 = readtable('R-33.csv',NumHeaderLines=2)
ASW = readtable('test.txt',NumHeaderLines=32)
x = R33.Var5;
R = R33.Var6;
p = polyfit(x,R,14)
for i = 1:length(p)-1
 dpds(i) = p(i)*length(p)+1-i
end
dRds = polyval(dpds,x)
dRds = zeros(length(R),1)
for i =1:length(R)-1
    dRds(i) = (R(i+1)-R(i))/(x(i+1)-x(i));
end
AR = (max(x)-min(x))/max(R)
d0 = 2*max(R);
V = 1.0
rho = 1.225
q = 0.5 *rho *V^2
alpha = 10*pi/180;

lift = 2*pi*rho* V^2 * cos(alpha) * sin(alpha) * R .*dRds
cl = lift/(q*d0)

figure(1)
plot(R33.Var1,R33.Var2,'sk',LineWidth=1.5,MarkerSize=10)
hold on
plot(R33.Var3,R33.Var4,'-b',LineWidth=1.5)
hold on
plot(x,cl,'--r')
hold on
plot(R33.Var5,R33.Var6,'-k',LineWidth=1.5)
hold on
plot(R33.Var5,-R33.Var6,'-k',LineWidth=1.5)
xlim([0 max(x)])
axis equal
set(gca,'XTick',[])
legend('Exp','Continuous ASWING 5.96','Discrete ASWING 5.96')


grid on
xlabel('s/L')
ylabel('c_l(s)')
axis equal


%% R-101
% close all
clear all
R33 = readtable('R-101.csv',NumHeaderLines=2)
ASW = readtable('test.txt',NumHeaderLines=32)

[R33.Var1 I] = sort(R33.Var1,'ascend');
R33.Var2 = R33.Var2(I);
[R33.Var3 I] = sort(R33.Var3,'ascend');
R33.Var4 = R33.Var4(I);
[R33.Var5 I] = sort(R33.Var5,'ascend');
R33.Var6 = R33.Var6(I);
x = R33.Var5;
R = R33.Var6;
p = polyfit(x,R,14)
AR = (max(x)-min(x))/max(R)
for i = 1:length(p)-1
 dpds(i) = p(i)*length(p)+1-i
end
dRds = polyval(dpds,x)
dRds = zeros(length(R),1)
for i =1:length(R)-1
    dRds(i) = (R(i+1)-R(i))/(x(i+1)-x(i));
end

d0 = 2*max(R);
V = 1.0
rho = 1.0
q = 0.5 *rho *V^2
alpha = 10*pi/180;

lift = 2*pi*rho* V^2 * cos(alpha) * sin(alpha) * R .*dRds
cl = lift/(q*d0)

figure(2)
plot(R33.Var1,R33.Var2,'sk',LineWidth=1.5,MarkerSize=10)
hold on
plot(R33.Var3,R33.Var4,'-b',LineWidth=1.5)
hold on
plot(x,cl,'--r')
hold on
plot(R33.Var5,R33.Var6,'-k',LineWidth=1.5)
hold on
plot(R33.Var5,-R33.Var6,'-k',LineWidth=1.5)
% hold on
% plot(ASW.Var1/100,ASW.Var9/( 0.6125*100*max(R)))
xlim([0 max(x)])
axis equal
set(gca,'XTick',[])
legend('Exp','Continuous ASWING 5.96','Discrete ASWING 5.96')


grid on
xlabel('s/L')
ylabel('c_l(s)')
axis equal


%%

%% RS-1
% close all
clear all
R33 = readtable('RS-1.csv',NumHeaderLines=2)
ASW = readtable('test.txt',NumHeaderLines=32)

[R33.Var1 I] = sort(R33.Var1,'ascend');
R33.Var2 = R33.Var2(I);
[R33.Var3 I] = sort(R33.Var3,'ascend');
R33.Var4 = R33.Var4(I);
[R33.Var5 I] = sort(R33.Var5,'ascend');
R33.Var6 = R33.Var6(I);
x = R33.Var5;
R = R33.Var6;
AR = (max(x)-min(x))/max(R)
p = polyfit(x,R,14)
for i = 1:length(p)-1
 dpds(i) = p(i)*length(p)+1-i
end
dRds = polyval(dpds,x)
dRds = zeros(length(R),1)
for i =1:length(R)-1
    dRds(i) = (R(i+1)-R(i))/(x(i+1)-x(i));
end

d0 = 2*max(R);
V = 1.0
rho = 1.0
q = 0.5 *rho *V^2
alpha = 9*pi/180;

lift = 2*pi*rho* V^2 * cos(alpha) * sin(alpha) * R .*dRds
cl = lift/(q*d0)

figure(3)
plot(R33.Var1,R33.Var2,'sk',LineWidth=1.5,MarkerSize=10)
hold on
plot(R33.Var3,R33.Var4,'-b',LineWidth=1.5)
hold on
plot(x,cl,'--r')
hold on
plot(R33.Var5,R33.Var6,'-k',LineWidth=1.5)
hold on
plot(R33.Var5,-R33.Var6,'-k',LineWidth=1.5)
% hold on
% plot(ASW.Var1/100,ASW.Var9/( 0.6125*100*max(R)))
xlim([0 max(x)])
axis equal
set(gca,'XTick',[])
legend('Exp','Continuous ASWING 5.96','Discrete ASWING 5.96')


grid on
xlabel('s/L')
ylabel('c_l(s)')
axis equal
%% distribution de sources
% close all
Source = readtable('Source_dist.csv',NumHeaderLines=2)
x = Source.Var5;
R = Source.Var6
R = R-R(1);

dRds = zeros(length(R),1);
for i = 2:length(dRds)
    dRds(i) = (R(i)-R(i-1))/(x(i)-x(i-1))
end

p =  dRds.^2;
ASW = 100*(p-0.05);

figure(4)
plot(Source.Var1,Source.Var2,'sk',LineWidth=1.5,MarkerSize=10)
hold on
plot(Source.Var3,Source.Var4,'--b',LineWidth=1.5)
hold on 
plot(x,ASW,'-r')
hold on
plot(Source.Var5,10+Source.Var6,'-k',LineWidth=1.5)
hold on 
plot(Source.Var5,10-Source.Var6-2*29.5,'-k',LineWidth=1.5)
grid on
legend('Experiments','Continuous ASWING 5.96','Discrete ASWING 5.96')
axis equal
ylim([-30 40])
ylabel('q/q_\infty in %')
xlabel('s/L in %')

