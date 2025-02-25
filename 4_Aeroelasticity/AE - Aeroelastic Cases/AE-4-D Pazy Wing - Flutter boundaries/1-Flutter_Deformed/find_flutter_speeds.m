function [V1,V2,f1,f2] = find_flutter_speeds(filename)
%FIND_FLUTTER_SPEEDS Summary of this function goes here
%   Detailed explanation goes here
data_temp = readtable(filename,NumHeaderLines=3);
V = data_temp.Var1;
Real = data_temp.Var2;
Imag = data_temp.Var3;


%% find first flutter speed
I = find(Real > 0)
i = 1;
while (V(I(i)) == 1)
    i=i+1;
end

V1 = V(I(i))
f1 = sqrt(Real(I(i))^2 + Imag(I(i))^2)/(2*pi)
%% find second offset flutterspeed
% method : from I(1) we increment I and stop when the speed jump is no
% longer equal to 1
j = i+1;
while (V(I(j))-V(I(j-1))==1)
    j = j+1;
end
V2 = V(I(j-1))
f2 = sqrt(Real(I(j-1))^2 + Imag(I(j-1))^2)/(2*pi)




%% find second flutter speed



end

