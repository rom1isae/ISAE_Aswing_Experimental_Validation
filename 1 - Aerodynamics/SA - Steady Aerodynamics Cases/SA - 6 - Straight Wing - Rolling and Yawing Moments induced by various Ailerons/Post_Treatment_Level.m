clear all 
close all

Clark_Y_Steady_Span = readtable('ClarkY_Steady_span_varying.csv',NumHeaderLines=3)



Clark_Y_Steady_Span = [0	0	0	0	0	0	0	0	0	0.000	0	0	0
4	.0158	-.0035	0.012664	-0.001331	.0225	-.0041	0.019728	-0.001946	0.0275	-.0055	0.025122	-0.002386
8	.0303	-.0072	0.025374	 -0.002679	.0440	-.0090	0.039527	-0.003918	.0530	-.0118	0.050336	-0.004805
12	.0430	-.0113	 0.038177	-0.004062	.0645	-.0144	0.059471	-0.005944	.0765	-.0161	 0.075731	-0.007292
16	.0550	-.0145	0.05112	-0.005498	.084	-.017	0.079627	-0.008053	.0980	-.0215	0.101348	-0.009874
20	.0676	-.0175	 0.064250	-0.007008	.0975	-.0212	0.099999	-0.010265	.1125	-.0250	 0.126632	-0.012466
24	.0710	-.0193	0.077597	-0.008616	.1032	-.0227	0.120038	-0.012518	.1205	-.0270	0.148683	-0.014659
28	.0765	-.0209	0.091098	-0.010349	.106	-.0242	0.137290	-0.014510	.1315	-.0282	0.164866	-0.016649
32	.0816	-.0220	0.104303	-0.012227	.1142	-.0254	0.149937	-0.016276	.140	-.0294	0.176197	-0.018715
36	.0857	-.0224	0.115957	-0.014085	.1200	-.0270	0.159133	-0.018006	.1502	-.0299	0.184609	-0.020819
40	.0897	-.0231	0.125011	-0.015627	.1251	-.0269	0.166161	-0.019743	.1583	-.0306	0.191176	-0.022952
44	.0930	-.0230	0.131887	-0.016950	.1306	-.0260	0.171733	-0.021528	.1655	-.0310	0.196452	-0.025143]
;






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ROLL MOMENT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



figure(1)
plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,2),'ks',MarkerSize=10)
hold on
plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,4),'rs','MarkerFaceColor','r',MarkerSize=10)

hold on

plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,6),'ko',MarkerSize=10)
hold on
plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,8),'ro','MarkerFaceColor','r',MarkerSize=10)

hold on
plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,10),'kd',MarkerSize=10)
hold on
plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,12),'rd','MarkerFaceColor','r',MarkerSize=10)
% plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,6),'kv')
% grid on

hold on
x = Clark_Y_Steady_Span(1:6,1);
y = Clark_Y_Steady_Span(1:6,2);
p= polyfit(x,y,1)
dCl_ddF(1) = p(1); 
x = Clark_Y_Steady_Span(1:6,1);
y = Clark_Y_Steady_Span(1:6,4);
p= polyfit(x,y,1)
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'-r','linewidth',1)
dCl_ddF(2) = p(1);


hold on
x = Clark_Y_Steady_Span(1:6,1);
y = Clark_Y_Steady_Span(1:6,6);
p= polyfit(x,y,1)
dCl_ddF(3) = p(1);

x = Clark_Y_Steady_Span(1:6,1);
y = Clark_Y_Steady_Span(1:6,8);
p= polyfit(x,y,1)
dCl_ddF(4) = p(1);
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'--r','linewidth',1)

hold on
x = Clark_Y_Steady_Span(1:6,1);
y = Clark_Y_Steady_Span(1:6,10);
p= polyfit(x,y,1)
dCl_ddF(5) = p(1);


x = Clark_Y_Steady_Span(1:6,1);
y = Clark_Y_Steady_Span(1:6,12);
p= polyfit(x,y,1)
dCl_ddF(6) = p(1);
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'-.r','linewidth',1)

for i = 1:3
Epsilon_dCl_ddF(i) = 100*abs(dCl_ddF(2*i-1)-dCl_ddF(2*i))/abs(dCl_ddF(2*i-1))
end
leg1 = "$b_{\delta_F} = b/3,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(1) );
leg2 = "$b_{\delta_F} = b/2,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(2) );
leg3 = "$b_{\delta_F} = 2b/3,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(3) );
xlabel('Aileron delfeciton in deg')
ylabel('Rolling moment coefficient')
legend("$b_{\delta_F} = b/3,  \  EXP$",leg1,"$b_{\delta_F} = b/2,  \  EXP$",leg2,"$b_{\delta_F} = 2b/3,  \  EXP$",leg3,'Interpreter','latex','location','southoutside')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% YAW MOMENT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,3),'ks',MarkerSize=10)
hold on
plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,5),'rs','MarkerFaceColor','r',MarkerSize=10)

hold on

plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,7),'ko',MarkerSize=8)
hold on
plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,9),'ro','MarkerFaceColor','r',MarkerSize=10)

hold on
plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,11),'kd',MarkerSize=8)
hold on
plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,13),'rd','MarkerFaceColor','r',MarkerSize=10)
% plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,6),'kv')
% grid on

hold on
x = Clark_Y_Steady_Span(1:6,1);
y = Clark_Y_Steady_Span(1:6,3);
p= polyfit(x,y,1)
dCl_ddF(1) = p(1); 
x = Clark_Y_Steady_Span(1:6,1);
y = Clark_Y_Steady_Span(1:6,5);
p= polyfit(x,y,1)
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'-r','linewidth',1)
dCl_ddF(2) = p(1);


hold on
x = Clark_Y_Steady_Span(1:6,1);
y = Clark_Y_Steady_Span(1:6,7);
p= polyfit(x,y,1)
dCl_ddF(3) = p(1);

x = Clark_Y_Steady_Span(1:6,1);
y = Clark_Y_Steady_Span(1:6,9);
p= polyfit(x,y,1)
dCl_ddF(4) = p(1);
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'--r','linewidth',1)

hold on
x = Clark_Y_Steady_Span(1:6,1);
y = Clark_Y_Steady_Span(1:6,11);
p= polyfit(x,y,1)
dCl_ddF(5) = p(1);


x = Clark_Y_Steady_Span(1:6,1);
y = Clark_Y_Steady_Span(1:6,13);
p= polyfit(x,y,1)
dCl_ddF(6) = p(1);
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'-.r','linewidth',1)

for i = 1:3
Epsilon_dCl_ddF(i) = 100*abs(dCl_ddF(2*i-1)-dCl_ddF(2*i))/abs(dCl_ddF(2*i-1))
end
leg1 = "$b_{\delta_F} = b/3,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(1) );
leg2 = "$b_{\delta_F} = b/2,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(2) );
leg3 = "$b_{\delta_F} = 2b/3,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(3) );
xlabel('Aileron delfeciton in deg')
ylabel('Yawing moment coefficient')
legend("$b_{\delta_F} = b/3,  \  EXP$",leg1,"$b_{\delta_F} = b/2,  \  EXP$",leg2,"$b_{\delta_F} = 2b/3,  \  EXP$",leg3,'Interpreter','latex','location','southoutside')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CHORD VARYING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Clark_Y_Steady_chord = [0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
4	0.0205	-.0048	0.016743	-0.00158	.0270	-0.0064	0.018837	-0.001788	0.0345	-.0065	0.023027	-0.002186	 0.0379	-0.006	0.029316	-0.002786
8	 .0408	-0.0092	0.033512	-0.003187	.0492	-0.0111	0.037712	-0.003589	.0620	-.0133	0.046124	-0.004398	 .0686	-.0135	0.058777	-0.005625
12	 .0554	-.0132	0.050336	-0.004805	.0672	-.0165	0.056665	-0.005419	.0870	-.0206	0.069361	-0.006662	 .0952	-.0213	0.088516	-0.008570
16	 .0703	-.0165	0.067241	-0.006453	0.0840	-0.0208	0.075731	-0.007292	0.1083	-.0263	0.092790	-0.009002	 .1211	-.0285	0.118361	-0.011623
20	 .0835	-.0192	0.084248	-0.008141	.0975	-0.0235	0.094929	-0.009219	0.1272	-.0302	0.116257	-0.011406	 .1420	-.0317	0.145389	-0.014324
24	0.0885	-.0214	0.101348	-0.009874	.1050	-.0254	0.114142	-0.011189	0.1385	-0.0310	0.138306	-0.013626	0.1520	-.0330	0.164866	-0.016649
28	 .0995	-.0235	0.118361	-0.011623	.1157	-.0267	0.132606	-0.013064	0.1490	-0.0317	0.156156	-0.015482	0.1595	-0.0336	0.177763	-0.019064
32	 .1098	-0.0255	0.134539	-0.013256	.1249	-.0283	0.148683	-0.014659	0.1576	-.0318	0.169069	-0.017330	 0.1671	-.0331	0.186969	-0.021525
36	0.1184	-.0271	0.148683	-0.014659	0.1340	-0.0290	0.161364	-0.016145	0.1670	-.0316	0.178519	-0.019239	 0.1745	-0.0337	0.193953	-0.024039
40	 .1271	-0.026	0.160123	-0.015978	.1419	-.0302	0.170996	-0.017674	0.1745	-0.0308	0.185813	-0.021172	0.1853	-0.0317	0.199403	-0.026644
44	 .1340	-0.0301	0.169069	-0.017330	.1494	-.0310	0.178519	-0.019239	0.1806	-.0296	0.191660	-0.023132	 0.1956	-0.0288	0.203662	-0.029379
];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rolling moment coefficient

figure(3)
plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,2),'ks',MarkerSize=10)
hold on
plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,4),'rs','MarkerFaceColor','r',MarkerSize=10)

hold on

plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,6),'ko',MarkerSize=10)
hold on
plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,8),'ro','MarkerFaceColor','r',MarkerSize=10)

hold on
plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,10),'kd',MarkerSize=10)
hold on
plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,12),'rd','MarkerFaceColor','r',MarkerSize=10)

hold on
plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,14),'kv',MarkerSize=10)
hold on
plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,16),'rv','MarkerFaceColor','r',MarkerSize=10)
% plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,6),'kv')
% grid on

hold on
x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,2);
p= polyfit(x,y,1)
dCl_ddF(1) = p(1); 
x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,4);
p= polyfit(x,y,1)
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'-r','linewidth',1)
dCl_ddF(2) = p(1);


hold on
x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,6);
p= polyfit(x,y,1)
dCl_ddF(3) = p(1);

x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,8);
p= polyfit(x,y,1)
dCl_ddF(4) = p(1);
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'--r','linewidth',1)

hold on
x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,10);
p= polyfit(x,y,1)
dCl_ddF(5) = p(1);


x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,12);
p= polyfit(x,y,1)
dCl_ddF(6) = p(1);
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'-.r','linewidth',1)

hold on
x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,14);
p= polyfit(x,y,1)
dCl_ddF(7) = p(1);


x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,16);
p= polyfit(x,y,1)
dCl_ddF(8) = p(1);
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'r','linewidth',1,LineStyle=':')

for i = 1:4
Epsilon_dCl_ddF(i) = 100*abs(dCl_ddF(2*i-1)-dCl_ddF(2*i))/abs(dCl_ddF(2*i-1))
end
leg1 = "$c_{\delta_F} = 0.15c,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(1) );
leg2 = "$c_{\delta_F} = 0.20c,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(2) );
leg3 = "$c_{\delta_F} = 0.3c,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(3) );
leg4 = "$c_{\delta_F} = 0.35c,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(4) );
xlabel('Aileron delfeciton in deg')
ylabel('Rolling moment Coefficient')
legend("$c_{\delta_F} = 0.15c,  \  EXP$",leg1,"$c_{\delta_F} = 0.2c,  \  EXP$",leg2,"$c_{\delta_F} = 0.3c,  \  EXP$",leg3,"$c_{\delta_F} = 0.35c,  \  EXP$",leg4,'Interpreter','latex','location','southoutside')
grid on
ylim([0 0.21])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Yawing moment coefficient

figure(4)
plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,3),'ks',MarkerSize=10)
hold on
plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,5),'rs','MarkerFaceColor','r',MarkerSize=10)

hold on

plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,7),'ko',MarkerSize=10)
hold on
plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,9),'ro','MarkerFaceColor','r',MarkerSize=10)

hold on
plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,11),'kd',MarkerSize=10)
hold on
plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,13),'rd','MarkerFaceColor','r',MarkerSize=10)

hold on
plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,15),'kv',MarkerSize=10)
hold on
plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,17),'rv','MarkerFaceColor','r',MarkerSize=10)
% plot(Clark_Y_Steady_chord(1:end,1),Clark_Y_Steady_chord(1:end,6),'kv')
% grid on

hold on
x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,3);
p= polyfit(x,y,1)
dCl_ddF(1) = p(1); 
x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,5);
p= polyfit(x,y,1)
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'-r','linewidth',1)
dCl_ddF(2) = p(1);


hold on
x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,7);
p= polyfit(x,y,1)
dCl_ddF(3) = p(1);

x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,9);
p= polyfit(x,y,1)
dCl_ddF(4) = p(1);
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'--r','linewidth',1)

hold on
x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,11);
p= polyfit(x,y,1)
dCl_ddF(5) = p(1);


x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,13);
p= polyfit(x,y,1)
dCl_ddF(6) = p(1);
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'-.r','linewidth',1)

hold on
x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,15);
p= polyfit(x,y,1)
dCl_ddF(7) = p(1);


x = Clark_Y_Steady_chord(1:6,1);
y = Clark_Y_Steady_chord(1:6,17);
p= polyfit(x,y,1)
dCl_ddF(8) = p(1);
yfit = polyval(p,x)
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid./SStotal
rsq = -mean(rsq);
hold on
% leg2 = "$\frac{d \alpha_0}{d \delta_F}$  =  " +num2str(p(1)) + "$\ (r^2 = "+num2str(rsq)+")$";
plot(x,yfit,'r','linewidth',1,LineStyle=':')

for i = 1:4
Epsilon_dCl_ddF(i) = 100*abs(dCl_ddF(2*i-1)-dCl_ddF(2*i))/abs(dCl_ddF(2*i-1))
end
leg1 = "$c_{\delta_F} = 0.15c,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(1) );
leg2 = "$c_{\delta_F} = 0.20c,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(2) );
leg3 = "$c_{\delta_F} = 0.3c,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(3) );
leg4 = "$c_{\delta_F} = 0.35c,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(3) );
xlabel('Aileron deflection in deg')
ylabel('Yawing moment coefficient')
legend("$c_{\delta_F} = 0.15c,  \  EXP$",leg1,"$c_{\delta_F} = 0.2c,  \  EXP$",leg2,"$c_{\delta_F} = 0.3c,  \  EXP$",leg3,"$c_{\delta_F} = 0.35c,  \  EXP$",leg4,'Interpreter','latex','location','southoutside')
grid on
