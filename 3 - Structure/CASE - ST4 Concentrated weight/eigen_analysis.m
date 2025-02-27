function [Vf, fb1, fb2, ft, ff] = eigen_analysis(vaccum,air,twist_position,V_range)

eig_vaccum = readtable(vaccum,'NumHeaderLines',3);

natural_freq = (1/(2*pi))*eig_vaccum.Var3;
fb1 = natural_freq(1);
if twist_position == 2
    ft = natural_freq(2);
    fb2 = natural_freq(3);
elseif twist_position == 3
    ft = natural_freq(3);
    fb2 = natural_freq(2);
end

eig_air = readtable(air,'NumHeaderLines',3);
% find flutter speed
i = 1;
while(eig_air.Var2(i) <0 && i< length(eig_air.Var2))
    i = i+1;
end
if i == length(eig_air.Var2)
   disp('no flutter speed found, please change speed range') 
    
   
else
    ff= (1/(2*pi))*eig_air.Var3(i);
    I = eig_air.Var1(i);
    Vf = V_range(1,I);
    
end


end
