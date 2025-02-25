 
close all
%%
load('Mowwe_data.mat')
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stagger 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear Legend1
clear Legend2


for i=1:5
   Legend1{i}=strcat('St = ', num2str(1.5+i*1.0),'*c, w/o airframe');
   Legend2{i}=strcat('St = ', num2str(1.5+i*1.0),'*c, w airframe');
%    figure(1)
%    hold on
%    plot(Mowe_data.Stagger{i}.Var3,Mowe_data.Stagger{i}.Var6,'r')
%    hold on
%    plot(Mowe_data.Stagger_frame{i}.Var3,Mowe_data.Stagger_frame{i}.Var6,'b')
%    hold on
%    xlabel('\alpha in degree')
%    ylabel('CL')
%    grid on
%    figure(2)
%    hold on
%    plot(Mowe_data.Stagger{i}.Var3,Mowe_data.Stagger{i}.Var7,'r')
%    hold on
%    plot(Mowe_data.Stagger{i}.Var3,Mowe_data.Stagger{i}.Var8,'--r')
%    hold on
%    plot(Mowe_data.Stagger_frame{i}.Var3,Mowe_data.Stagger_frame{i}.Var7,'b')
%    hold on
%    plot(Mowe_data.Stagger_frame{i}.Var3,Mowe_data.Stagger_frame{i}.Var8,'--b')
%    hold on   
%    xlabel('\alpha in degree')
%    ylabel('CD and CI_i')
%    grid on
%    figure(3)
%    hold on
%    plot(Mowe_data.Stagger{i}.Var3,Mowe_data.Stagger{i}.Var4./Mowe_data.Stagger{i}.Var5,'--')
%    hold on 
%    plot(Mowe_data.Stagger_frame{i}.Var3,Mowe_data.Stagger_frame{i}.Var4./Mowe_data.Stagger_frame{i}.Var5,'-')
%    xlabel('\alpha in degree')
%    ylabel('CL/CD')
%    
%    grid on   
%    figure(4)
%    hold on 
%    plot(1.5+0.5*i,Mowe_data.Stagger_frame{i}.Var6(25)./Mowe_data.Stagger_frame{i}.Var7(25),'bo')
%    hold on
%    plot(1.5+0.5*i,Mowe_data.Stagger{i}.Var6(25)./Mowe_data.Stagger{i}.Var7(25),'ro')   
%    xlabel('stagger in meters')
%    ylabel('CL/CD')
%    grid on 
   
   figure(5) 
   xlabel('\alpha in degree')
   ylabel('CL/CD')
   hold on
   plot(Mowe_data.Stagger{i}.Var3,Mowe_data.Stagger{i}.Var4./Mowe_data.Stagger{i}.Var5,'--s')
   
end
% figure(1)
% hold on 
% plot(Mowe_data.Wingonly.Var3,Mowe_data.Wingonly.Var6,'k')
% legend('CD without airframe','with airframe')
% figure(2)
% hold on 
% plot(Mowe_data.Wingonly.Var3,Mowe_data.Wingonly.Var7,'k')
% hold on 
% plot(Mowe_data.Wingonly.Var3,Mowe_data.Wingonly.Var8,'--k')
% legend('CD without airframe','CD_i without airframe','CD with airframe','CD_i with airframe')
% figure(3)
% legend([Legend1 Legend2])
 

for i = 1:5
    figure(5)
    hold on 
    plot(Mowe_data.Stagger_frame{i}.Var3,Mowe_data.Stagger_frame{i}.Var4./Mowe_data.Stagger_frame{i}.Var5,'-o')
    
end
figure(5) 
legend([Legend1 Legend2])
grid on


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gap 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear Legend1
clear Legend2
Legend=cell(5,1)
for i=1:5
   Legend1{i}=strcat('G = ', num2str(-1.0+i*0.4),'*c w/o airframe');
   Legend2{i}=strcat('G = ', num2str(-1.0+i*0.4),'*c w airframe');
%    figure(1)
%    hold on
%    plot(Mowe_data.Gap{i}.Var3,Mowe_data.Gap{i}.Var6,'r')
%    hold on
%    plot(Mowe_data.Gap_frame{i}.Var3,Mowe_data.Gap_frame{i}.Var6,'b')
%    hold on
%    xlabel('\alpha in degree')
%    ylabel('CL')
%    grid on
%    figure(2)
%    hold on
%    plot(Mowe_data.Gap{i}.Var3,Mowe_data.Gap{i}.Var7,'r')
%    hold on
%    plot(Mowe_data.Gap{i}.Var3,Mowe_data.Gap{i}.Var8,'--r')
%    hold on
%    plot(Mowe_data.Gap_frame{i}.Var3,Mowe_data.Gap_frame{i}.Var7,'b')
%    hold on
%    plot(Mowe_data.Gap_frame{i}.Var3,Mowe_data.Gap_frame{i}.Var8,'--b')
%    hold on   
%    xlabel('\alpha in degree')
%    ylabel('CD and CI_i')
%    grid on
%    figure(3)
%    subplot(1,2,1)
%    hold on
%    plot(Mowe_data.Gap{i}.Var3,Mowe_data.Gap{i}.Var6./Mowe_data.Gap{i}.Var7,'r')
%    hold on 
%    plot(Mowe_data.Gap_frame{i}.Var3,Mowe_data.Gap_frame{i}.Var6./Mowe_data.Gap_frame{i}.Var7,'b')
%    xlabel('\alpha in degree')
%    ylabel('CL/CD')
%    grid on
%    subplot(1,2,2)
%    hold on
% %    plot(Mowe_data.Gap{i}.Var3,Mowe_data.Gap{i}.Var6./Mowe_data.Gap{i}.Var7,'--')
% %    hold on 
%    plot(Mowe_data.Gap_frame{i}.Var3,Mowe_data.Gap_frame{i}.Var6./Mowe_data.Gap_frame{i}.Var7,'-o')
%    xlabel('\alpha in degree')
%    ylabel('CL/CD')
%    
%    grid on
   
   figure(5)
   hold on
   plot(Mowe_data.Gap{i}.Var3,Mowe_data.Gap{i}.Var6./Mowe_data.Gap{i}.Var7,'-o')
   hold on 
   xlabel('\alpha in degree')
   ylabel('CL/CD')
   grid on
end
% figure(1)
% legend('CD without airframe','with airframe')
% figure(2)
% legend('CD without airframe','CD_i without airframe','CD with airframe','CD_i with airframe')
% figure(3)
% subplot(1,2,1)
% legend('CL/CD without airframe','CL/CD with airframe')
% subplot(1,2,2)
% legend([Legend1])

% for i = 1:5
%     figure(5)
%    hold on
%    plot(Mowe_data.Gap_frame{i}.Var3,Mowe_data.Gap_frame{i}.Var6./Mowe_data.Gap_frame{i}.Var7,'--o')
% 
% end
% figure(5)
% legend([Legend1 Legend2])
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wing1_twist
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear Legend1
clear Legend2
Legend=cell(5,1)
for i=1:5
   Legend1{i}=strcat('\vartheta_1 = ', num2str(-5+2*i),'degrees');
   figure(1)
   hold on
   plot(Mowe_data.Twist1_frame{i}.Var3,Mowe_data.Twist1_frame{i}.Var6,'b')
   hold on
   xlabel('\alpha in degree')
   ylabel('CL')
   grid on
   figure(2)
   hold on
   plot(Mowe_data.Twist1_frame{i}.Var3,Mowe_data.Twist1_frame{i}.Var7,'b')
   hold on
   plot(Mowe_data.Twist1_frame{i}.Var3,Mowe_data.Twist1_frame{i}.Var8,'--b')
   hold on   
   xlabel('\alpha in degree')
   ylabel('CD and CI_i')
   grid on
   figure(3)
   hold on
   plot(Mowe_data.Twist1_frame{i}.Var3,Mowe_data.Twist1_frame{i}.Var6./Mowe_data.Twist1_frame{i}.Var7,'-o')
   xlabel('\alpha in degree')
   ylabel('CL/CD')
   
   grid on
end
figure(1)
legend('CD without airframe','with airframe')
figure(2)
legend('CD without airframe','CD_i without airframe','CD with airframe','CD_i with airframe')
figure(3)
legend([Legend1])

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wing2_twist
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear Legend1
clear Legend2
Legend=cell(5,1)
for i=1:5
   Legend1{i}=strcat('\vartheta_2 = ', num2str(-5+2*i),'degrees');
   figure(1)
   hold on
   plot(Mowe_data.Twist2{i}.Var3,Mowe_data.Twist2{i}.Var6,'b')
   hold on
   xlabel('\alpha in degree')
   ylabel('CL')
   grid on
   figure(2)
   hold on
   plot(Mowe_data.Twist2{i}.Var3,Mowe_data.Twist2{i}.Var7,'b')
   hold on
   plot(Mowe_data.Twist2{i}.Var3,Mowe_data.Twist2{i}.Var8,'--b')
   hold on   
   xlabel('\alpha in degree')
   ylabel('CD and CI_i')
   grid on
   figure(3)
   hold on
   plot(Mowe_data.Twist2{i}.Var3,Mowe_data.Twist2{i}.Var6./Mowe_data.Twist2{i}.Var7,'-o')
   xlabel('\alpha in degree')
   ylabel('CL/CD')
   
   grid on
end
figure(1)
legend('CD without airframe','with airframe')
figure(2)
legend('CD without airframe','CD_i without airframe','CD with airframe','CD_i with airframe')
figure(3)
legend([Legend1])

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wing1_Dihedral
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear Legend1
clear Legend2
Legend=cell(5,1)
for i=1:5
   Legend1{i}=strcat('\Lambda_1 = ', num2str(0+1.0*(i-1)),' degrees,',' \Lambda_2 = 0');
   figure(1)
   hold on
   plot(Mowe_data.Dihedral1_frame{i}.Var3,Mowe_data.Dihedral1_frame{i}.Var6,'b')
   hold on
   xlabel('\alpha in degree')
   ylabel('CL')
   grid on
   figure(2)
   hold on
   plot(Mowe_data.Dihedral1_frame{i}.Var3,Mowe_data.Dihedral1_frame{i}.Var7,'b')
   hold on
   plot(Mowe_data.Dihedral1_frame{i}.Var3,Mowe_data.Dihedral1_frame{i}.Var8,'--b')
   hold on   
   xlabel('\alpha in degree')
   ylabel('CD and CI_i')
   grid on
   figure(3)
   hold on
   plot(Mowe_data.Dihedral1_frame{i}.Var3,Mowe_data.Dihedral1_frame{i}.Var6./Mowe_data.Dihedral1_frame{i}.Var7,'-o')
   grid on
   xlabel('\alpha in degree')
   ylabel('CL/CD')   
   grid on
end
figure(1)
legend('CD without airframe','with airframe')
figure(2)
legend('CD without airframe','CD_i without airframe','CD with airframe','CD_i with airframe')
figure(3)
legend([Legend1])


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wing2_Dihedral
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear Legend1
clear Legend2

Legend=cell(5,1)
for i=1:5
   Legend1{i}=strcat('\Lambda_1 = 0, ','\Lambda_2 = ', num2str(0+1.0*(i-1)),' degrees');
   figure(1)
   hold on
   plot(Mowe_data.Dihedral2_frame{i}.Var3,Mowe_data.Dihedral2_frame{i}.Var6,'b')
   hold on
   xlabel('\alpha in degree')
   ylabel('CL')
   grid on
   figure(2)
   hold on
   plot(Mowe_data.Dihedral2_frame{i}.Var3,Mowe_data.Dihedral2_frame{i}.Var7,'')
   hold on
   plot(Mowe_data.Dihedral2_frame{i}.Var3,Mowe_data.Dihedral2_frame{i}.Var8,'--')
   hold on   
   xlabel('\alpha in degree')
   ylabel('CD and CI_i')
   grid on
   
   figure(3)
   hold on
   grid on
   plot(Mowe_data.Dihedral2_frame{i}.Var3,Mowe_data.Dihedral2_frame{i}.Var6./Mowe_data.Dihedral2_frame{i}.Var7,'-o')
   xlabel('\alpha in degree')
   ylabel('CL/CD')
   
   grid on
end
figure(1)
legend('CD without airframe','with airframe')
figure(2)
legend('CD without airframe','CD_i without airframe','CD with airframe','CD_i with airframe')
figure(3)
legend([Legend1])

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wing Dual Dihedral
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear Legend1
clear Legend2

Legend=cell(5,1)
for i=1:5
   Legend1{i}=strcat('\Lambda_1 = ', num2str(0+1.0*(i-1)),' degrees, ''\Lambda_2 = ', num2str(0+1.0*(i-1)),' degrees');
   figure(1)
   hold on
   plot(Mowe_data.Dihedraldual_frame{i}.Var3,Mowe_data.Dihedraldual_frame{i}.Var6,'b')
   hold on
   xlabel('\alpha in degree')
   ylabel('CL')
   grid on
   figure(2)
   hold on
   plot(Mowe_data.Dihedraldual_frame{i}.Var3,Mowe_data.Dihedraldual_frame{i}.Var7,'')
   hold on
   plot(Mowe_data.Dihedraldual_frame{i}.Var3,Mowe_data.Dihedraldual_frame{i}.Var8,'--')
   hold on   
   xlabel('\alpha in degree')
   ylabel('CD and CI_i')
   grid on
   
   figure(3)
   hold on
   grid on
   plot(Mowe_data.Dihedraldual_frame{i}.Var3,Mowe_data.Dihedraldual_frame{i}.Var6./Mowe_data.Dihedraldual_frame{i}.Var7,'-o')
   xlabel('\alpha in degree')
   ylabel('CL/CD')
   
   grid on
end
figure(1)
legend('CD without airframe','with airframe')
figure(2)
legend('CD without airframe','CD_i without airframe','CD with airframe','CD_i with airframe')
figure(3)
legend([Legend1])


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wing Dual Dihedral
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear Legend1
clear Legend2

Legend=cell(5,1)
for i=1:5
   Legend1{i}=strcat('\Lambda_1 = ', num2str(0+1.0*(i-1)),' degrees, ''\Lambda_2 = ', num2str(0-1.0*(i-1)),' degrees');
   figure(1)
   hold on
   plot(Mowe_data.Dihedraldual_inverted{i}.Var3,Mowe_data.Dihedraldual_inverted{i}.Var6,'b')
   hold on
   xlabel('\alpha in degree')
   ylabel('CL')
   grid on
   figure(2)
   hold on
   plot(Mowe_data.Dihedraldual_inverted{i}.Var3,Mowe_data.Dihedraldual_inverted{i}.Var7,'')
   hold on
   plot(Mowe_data.Dihedraldual_inverted{i}.Var3,Mowe_data.Dihedraldual_inverted{i}.Var8,'--')
   hold on   
   xlabel('\alpha in degree')
   ylabel('CD and CI_i')
   grid on
   
   figure(3)
   hold on
   grid on
   plot(Mowe_data.Dihedraldual_inverted{i}.Var3,Mowe_data.Dihedraldual_inverted{i}.Var6./Mowe_data.Dihedraldual_inverted{i}.Var7,'-o')
   xlabel('\alpha in degree')
   ylabel('CL/CD')
   
   grid on
end
figure(1)
legend('CD without airframe','with airframe')
figure(2)
legend('CD without airframe','CD_i without airframe','CD with airframe','CD_i with airframe')
figure(3)
legend([Legend1])

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ANALYSE FINALE:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear Legend1
clear Legend2
figure(1)
hold on
plot(Mowe_data.Final.Var3,Mowe_data.Final.Var6,'-bo')
hold on
plot(Mowe_data.Initial.Var3,Mowe_data.Initial.Var6,'-rs')
xlabel('\alpha in degree')
ylabel('CL')
legend('optimized geometry','initial geometry')
grid on
figure(2)
hold on
plot(Mowe_data.Final.Var3,Mowe_data.Final.Var7,'-bo')
hold on
plot(Mowe_data.Final.Var3,Mowe_data.Final.Var8,'--bs')
hold on
plot(Mowe_data.Initial.Var3,Mowe_data.Initial.Var7,'-ro')
hold on
plot(Mowe_data.Initial.Var3,Mowe_data.Initial.Var8,'--rs')
xlabel('\alpha in degree')
ylabel('CD and CD_i')
legend('CD : optimized geometry','CD_i optimized geometry', 'CD : initial geometry','CD_i initial geometry')
grid on

figure(3)
hold on
grid on
plot(Mowe_data.Final.Var3,Mowe_data.Final.Var6./Mowe_data.Final.Var7,'-bo')
hold on
plot(Mowe_data.Initial.Var3,Mowe_data.Initial.Var6./Mowe_data.Initial.Var7,'-rs')
xlabel('\alpha in degree')
ylabel('CL/CD')
legend('Optimized geometry','initial geometry')
grid on
   
   


