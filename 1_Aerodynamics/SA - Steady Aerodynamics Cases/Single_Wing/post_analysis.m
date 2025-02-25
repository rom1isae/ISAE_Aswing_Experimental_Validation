clear all
close all
clc


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eliptical Wing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


ellip_asw{1} = readtable('ellipA15asw.txt','NumHeaderLines',34);
ellip_asw{2} = readtable('ellipA3asw.txt','NumHeaderLines',34);
ellip_asw{3} = readtable('ellipA45asw.txt','NumHeaderLines',34);
ellip_asw{4} = readtable('ellipA6asw.txt','NumHeaderLines',34);
ellip_asw{5} = readtable('ellipA75asw.txt','NumHeaderLines',34);

ellip_avl{1} = readtable('ellipA15.txt','NumHeaderLines',21);
ellip_avl{2} = readtable('ellipA3.txt','NumHeaderLines',21);
ellip_avl{3} = readtable('ellipA45.txt','NumHeaderLines',21);
ellip_avl{4} = readtable('ellipA6.txt','NumHeaderLines',21);
ellip_avl{5} = readtable('ellipA75.txt','NumHeaderLines',21);



figure(1)
N = 0.5*length(ellip_avl{1}.Var3)-1;
subplot(5,1,1)
plot(ellip_avl{1}.Var2(1:N),ellip_avl{1}.Var5(1:N),'-ko')
hold on
plot(ellip_asw{1}.Var3,ellip_asw{1}.Var9.*ellip_asw{1}.Var10,'--ro')
xlim([0 max(ellip_avl{1}.Var2) ])
title('\alpha = 1.5°')
legend('AVL','ASWING')
grid on
xlabel('span distribtion m')
ylabel('cl*c')
subplot(5,1,2)
plot(ellip_avl{2}.Var2(1:N),ellip_avl{2}.Var5(1:N),'-ko')
hold on
plot(ellip_asw{2}.Var3,ellip_asw{2}.Var9.*ellip_asw{2}.Var10,'--ro')
xlim([0 max(ellip_avl{2}.Var2) ])
title('\alpha = 3.0°')
legend('AVL','ASWING')
grid on
xlabel('span distribtion m')
ylabel('cl*c')
subplot(5,1,3)
plot(ellip_avl{3}.Var2(1:N),ellip_avl{3}.Var5(1:N),'-ko')
hold on
plot(ellip_asw{3}.Var3,ellip_asw{3}.Var9.*ellip_asw{3}.Var10,'--ro')
xlim([0 max(ellip_avl{3}.Var2) ])
title('\alpha = 4.5°')
legend('AVL','ASWING')
grid on
xlabel('span distribtion m')
ylabel('cl*c')
subplot(5,1,4)
plot(ellip_avl{4}.Var2(1:N),ellip_avl{4}.Var5(1:N),'-ko')
hold on
plot(ellip_asw{4}.Var3,ellip_asw{4}.Var9.*ellip_asw{4}.Var10,'--ro')
xlim([0 max(ellip_avl{4}.Var2) ])
title('\alpha = 6.0°')
legend('AVL','ASWING')
grid on
xlabel('span distribtion m')
ylabel('cl*c')
subplot(5,1,5)
plot(ellip_avl{5}.Var2(1:N),ellip_avl{5}.Var5(1:N),'-ko')
hold on
plot(ellip_asw{5}.Var3,ellip_asw{5}.Var9.*ellip_asw{5}.Var10,'--ro')
xlim([0 max(ellip_avl{5}.Var2) ])
title('\alpha = 7.5°')
legend('AVL','ASWING')
grid on
xlabel('span distribtion m')
ylabel('cl*c')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% rectangular Wing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


rect_asw{1} = readtable('rectA15ASW.txt','NumHeaderLines',34);
rect_asw{2} = readtable('rectA3ASW.txt','NumHeaderLines',34);
rect_asw{3} = readtable('rectA45ASW.txt','NumHeaderLines',34);
rect_asw{4} = readtable('rectA6ASW.txt','NumHeaderLines',34);
rect_asw{5} = readtable('rectA75ASW.txt','NumHeaderLines',34);

rect_avl{1} = readtable('rectA15AVL.txt','NumHeaderLines',21);
rect_avl{2} = readtable('rectA3AVL.txt','NumHeaderLines',21);
rect_avl{3} = readtable('rectA45AVL.txt','NumHeaderLines',21);
rect_avl{4} = readtable('rectA6AVL.txt','NumHeaderLines',21);
rect_avl{5} = readtable('rectA75AVL.txt','NumHeaderLines',21);



figure(2)
N = 0.5*length(rect_avl{1}.Var3)-1;
subplot(5,1,1)
plot(rect_avl{1}.Var2(1:N),rect_avl{1}.Var8(1:N),'-ko')
hold on
plot(rect_asw{1}.Var2,rect_asw{1}.Var8,'--ro')
xlim([0 max(rect_avl{1}.Var2) ])
title('\alpha = 1.5°')
legend('AVL','ASWING')
grid on
xlabel('span distribtion m')
ylabel('cl*c')
subplot(5,1,2)
plot(rect_avl{2}.Var2(1:N),rect_avl{2}.Var8(1:N),'-ko')
hold on
plot(rect_asw{2}.Var2,rect_asw{2}.Var8,'--ro')
xlim([0 max(rect_avl{2}.Var2) ])
title('\alpha = 3.0°')
legend('AVL','ASWING')
grid on
xlabel('span distribtion m')
ylabel('cl*c')
subplot(5,1,3)
plot(rect_avl{2}.Var2(1:N),rect_avl{2}.Var8(1:N),'-ko')
hold on
plot(rect_asw{2}.Var2,rect_asw{2}.Var8,'--ro')
xlim([0 max(rect_avl{3}.Var2) ])
title('\alpha = 4.5°')
legend('AVL','ASWING')
grid on
xlabel('span distribtion m')
ylabel('cl*c')
subplot(5,1,4)
plot(rect_avl{3}.Var2(1:N),rect_avl{3}.Var8(1:N),'-ko')
hold on
plot(rect_asw{3}.Var2,rect_asw{3}.Var8,'--ro')
xlim([0 max(rect_avl{4}.Var2) ])
title('\alpha = 6.0°')
legend('AVL','ASWING')
grid on
xlabel('span distribtion m')
ylabel('cl*c')
subplot(5,1,5)
plot(rect_avl{3}.Var2(1:N),rect_avl{3}.Var8(1:N),'-ko')
hold on
plot(rect_asw{3}.Var2,rect_asw{3}.Var8,'--ro')
xlim([0 max(rect_avl{5}.Var2) ])
title('\alpha = 7.5°')
legend('AVL','ASWING')
grid on
xlabel('span distribtion m')
ylabel('cl*c')





