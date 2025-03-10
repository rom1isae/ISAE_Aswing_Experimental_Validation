L1 = [5.154 3.362 1.98 2.515 1.477];
L2 = [0.936 0.597 0.336 0.436 0.1084];

L1p = L1*cos(30*pi/180);

t1 = 0.016;
t2 = 0.032;
for i =1:length(L1)

Iyy(i) = (L1(i)*(L2(i)+2*t1)^3)/12 - ((L1(i)-2*t2)*(L2(i))^3)/12;
Izz(i) = ((L1(i)^3)*(L2(i)+2*t1))/12 - (((L1(i)-2*t2)^3)*(L2(i)))/12;
A(i) = 2*(L1(i)*t1 + L2(i)*t2);
J(i) = (4*((L1(i)-t2)*(L2(i)+t1))^2)/(2*L1(i)/t1 + 2*L2(i)/t2);

Iyyp(i) = (L1p(i)*(L2(i)+2*t1)^3)/12 - ((L1p(i)-2*t2)*(L2(i))^3)/12;
Izzp(i) = ((L1p(i)^3)*(L2(i)+2*t1))/12 - (((L1p(i)-2*t2)^3)*(L2(i)))/12;
Ap(i) = 2*(L1p(i)*t1 + L2(i)*t2);
Jp(i) = (4*((L1p(i)-t2)*(L2(i)+t1))^2)/(2*L1p(i)/t1 + 2*L2(i)/t2);

end

[L1' L2' A' Iyy' Izz' J']

[L1' L2' Ap' Iyyp' Izzp' Jp']