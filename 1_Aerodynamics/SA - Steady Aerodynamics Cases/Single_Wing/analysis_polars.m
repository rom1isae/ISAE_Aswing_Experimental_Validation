clear all
close all

system('sh ./CASE2_POLAIRE.sh')
system('sh ./CASE2_POLAIRE_mod.sh')


%%
close all

ASWING =  readtable('CASE2_TEST_POLAIRE.txt','NumHeaderLines',3)
ASWING_ISAE = readtable('CASE2_TEST_POLAIREmod.txt','NumHeaderLines',3)


figure(1)
plot(ASWING.Var3,ASWING.Var6,'*b')
hold on
plot(ASWING_ISAE.Var3,ASWING_ISAE.Var6,'-d','color',[0 0.5 0],'Linewidth',1)
figure(2)
plot(ASWING.Var3,ASWING.Var7,'*b')
hold on
plot(ASWING_ISAE.Var3,ASWING_ISAE.Var7-(ASWING_ISAE.Var7(1)-ASWING.Var7(1)),'-d','color',[0 0.5 0],'Linewidth',1)
figure(3)
plot(ASWING.Var3,ASWING.Var9,'*b')
hold on
plot(ASWING_ISAE.Var3,ASWING_ISAE.Var9,'-d','color',[0 0.5 0],'Linewidth',1)