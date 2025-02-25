#!/bin/sh
#rm -r NACA63A012_alpha0_dF_Re1E5.txt
xfoil NACA63A012.txt<<EOF
oper
iter
500
v
6.5E5
pacc
NACA63A012_alpha0_dF_Re6P5E5.txt


gdes
flap
0.70 
999
0.5
-15
exec



oper
cl 0


gdes
flap
0.70 
999
0.5
1
exec



oper
cl 0


gdes
flap
0.7
999
0.5
1
exec



oper
cl 0


gdes
flap
0.7
999
0.5
1
exec



oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec



oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec



oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec



oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec



oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec



oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec



oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7
999
0.5
1
exec



oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


gdes
flap
0.7 
999
0.5
1
exec

oper
cl 0


EOF
