clear all 
close all

Clark_Y_Steady_Span = readtable('ClarkY_Steady_span_varying.csv',NumHeaderLines=3)



Clark_Y_Steady_Span = [0	0	0	0	0	0	0	0	0	0	0	0	0
4	.0124	-.0053	0.008638	-0.002535	.0180	-.0059	0.011516	-0.003373	.0212	-.0055	0.013009	-0.003970
8	.0241	-.0102	0.017004	-0.005006	.0345	-.0112	0.022899	-0.006824	.0400	-.0118	0.026502	-0.008201
12	.035	-.0145	0.024970	-0.007417	.0492	-.0160	0.033968	-0.010398	.0568	-.0161	0.040179	-0.012743
16	.0465	-.0174	0.032542	-0.009829	.0625	-.0205	0.044696	-0.014157	.0723	-.0215	0.053657	-0.017595
20	.0568	-.0195	0.039788	-0.012323	.0750	-.0247	0.055152	-0.018172	.0852	-.0250	0.066892	-0.022803
24	.0661	-.020	0.046793	-0.014972	.0850	-.0274	0.065422	-0.022506	.0973	-.0270	0.079953	-0.028420
28	.0680	-.0220	0.053624	-0.017827	0.0881	-.0295	0.075567	-0.027193	.1007	-.0282	0.092903	-0.034471
32	.0690	-.0225	0.060330	-0.020919	.0915	-.0302	0.085640	-0.032250	.1032	-.0294	0.105799	-0.040966
36	.0736	-.0228	0.066955	-0.024279	.0965	-.0297	0.095690	-0.037698	.1095	-.0299	0.118697	-0.047916
40	.0764	-.0230	0.073540	-0.027941	.1020	-.0289	0.105764	-0.043553	.1145	-.0306	0.131649	-0.055326
44	.0766	-.0228	0.080122	-0.031919	.1080	-.0263	0.115907	-0.049814	.1186	-.0310	0.144688	-0.063184
];






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
xlabel('Aileron deflection in deg')
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

plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,7),'ko',MarkerSize=10)
hold on
plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,9),'ro','MarkerFaceColor','r',MarkerSize=10)

hold on
plot(Clark_Y_Steady_Span(1:end,1),Clark_Y_Steady_Span(1:end,11),'kd',MarkerSize=10)
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
xlabel('Aileron deflection in deg')
ylabel('Yawing moment coefficient')
legend("$b_{\delta_F} = b/3,  \  EXP$",leg1,"$b_{\delta_F} = b/2,  \  EXP$",leg2,"$b_{\delta_F} = 2b/3,  \  EXP$",leg3,'Interpreter','latex','location','southoutside')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CHORD VARYING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Clark_Y_Steady_chord = [0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.	0	0
4	.0095	-0.0081	0.009420	-0.002869	.0115	-.0090	0.010612	-0.003233	.0147	-.0117	0.014456	-0.004416	.0126	-.0145	0.016884	-0.005167
8	.0195	-.0147	0.019084	-0.005853	.0217	-0.0175	0.021545	-0.006625	.0270	-.0212	0.029490	-0.009166	.0232	-0.0260	0.034471	-0.010807
12	.0295	-.0213	 0.028991	-0.009004	0.0308	-.0240	0.032728	-0.010228	.0388	-.0294	0.044619	-0.014295	.0335	-.0350	0.051956	-0.016959
16	.0420	-.0270	0.038941	-0.012318	.0394	-0.0290	0.043881	-0.014034	.0502	-.0362	0.059459	-0.019821	.0480	-.0430	0.069040	-0.023693
20	.0455	-0.0320	0.048786	-0.015793	0.0478	-0.033	0.054869	-0.018053	.0625	-.0410	0.074033	-0.025814	.0636	-0.0485	0.085850	 -0.031116
24	0.0460	-0.0370	0.058495	-0.019445	.0508	-.0365	0.065697	-0.022314	.0752	-0.0422	0.088438	-0.032331	.0760	-.0500	0.102519	-0.039270
28	.0463	-0.0410	0.068086	-0.023296	.0527	-.0390	0.076404	-0.026845	.0790	-.0420	0.102753	-0.039390	.0843	-.0500	0.119166	-0.048177
32	0.0468	-0.0445	0.077588	-0.027367	.0550	-0.0410	0.087027	-0.031666	.0822	-0.0430	0.117053	-0.047006	.0901	-.0510	 0.135907	-0.057849
36	0.0476	-.0468	0.087027	-0.031666	0.0580	-0.0425	0.097596	-0.036781	.0883	-.0457	0.131413	-0.055187	.0893	-.0545	0.152744	-0.068258
40	0.0485	-.0490	0.096424	-0.036198	.0616	-0.0433	0.108143	-0.042196	.0942	-.0515	0.145875	-0.063920	.0912	-.0600	 0.168301	-0.079463
44	0.0509	-.0510	0.105799	-0.040966	.0673	-0.0435	0.118697	-0.047916	.1011	-.0665	0.160143	-0.073191	.0990	-.0700	0.178998	-0.091607
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
leg4 = "$c_{\delta_F} = 0.35c,  \  ASWING, \ \epsilon  =$" +num2str(Epsilon_dCl_ddF(3) );
xlabel('Aileron deflection in deg')
ylabel('Rolling moment coefficient')
legend("$c_{\delta_F} = 0.15c,  \  EXP$",leg1,"$c_{\delta_F} = 0.2c,  \  EXP$",leg2,"$c_{\delta_F} = 0.3c,  \  EXP$",leg3,"$c_{\delta_F} = 0.35c,  \  EXP$",leg4,'Interpreter','latex','location','southoutside')
grid on
ylim([0 0.21])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Yawing moment coefficient

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
