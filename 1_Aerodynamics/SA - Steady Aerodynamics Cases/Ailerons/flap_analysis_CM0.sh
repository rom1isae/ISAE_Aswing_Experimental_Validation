#!/bin/sh
#rm -r NACA63A012_dF_CM0_Re1E5.txt
~/Documents/Softwares/Xfoil/bin/xfoil NACA63A012.txt<<EOF
oper
iter
500
v
6.5E5
pacc
NACA63A012_dF_CM0_Re6P5E5.txt


gdes
flap
0.7 
999
0.5
-15
exec



oper
a 0


gdes
flap
0.7
999
0.5
1
exec



oper
a 0


gdes
flap
0.7 
999
0.5
1
exec



oper
a 0


gdes
flap
0.7
999
0.5
1
exec



oper
a 0


gdes
flap
0.7
999
0.5
1
exec



oper
a 0


gdes
flap
0.7 
999
0.5
1
exec



oper
a 0


gdes
flap
0.7 
999
0.5
1
exec



oper
a 0


gdes
flap
0.7
999
0.5
1
exec



oper
a 0


gdes
flap
0.7 
999
0.5
1
exec



oper
a 0


gdes
flap
0.7 
999
0.5
1
exec



oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec



oper
a 0


gdes
flap
0.7
999
0.5
1
exec

oper
a 0


gdes
flap
0.75 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7
999
0.5
1
exec

oper
a 0


gdes
flap
0.75 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


gdes
flap
0.7 
999
0.5
1
exec

oper
a 0


EOF
