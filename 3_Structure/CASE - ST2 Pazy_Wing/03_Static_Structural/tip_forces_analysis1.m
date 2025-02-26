function [Delta_Z,Twist] = tip_forces_analysis1(filename,M)
Delta_Z = zeros(1,length(M));
Twist =  zeros(1,length(M));
for i = 1:length(M)
    change_mass(filename,M(i)/2,M(i)/2);
    [dum1 dum2] = system('sh ./temp_analysis1.sh');
    data_temp = readtable('temp.txt',NumHeaderLines=34);
    Delta_Z(i) = data_temp.Var3(end);
    Twist(i) = data_temp.Var4(end);
end

