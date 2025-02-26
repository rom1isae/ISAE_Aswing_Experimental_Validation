function [fb1, fb2, ft] = eigen_analysis2(vaccum,twist_position,V_range)

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



end
