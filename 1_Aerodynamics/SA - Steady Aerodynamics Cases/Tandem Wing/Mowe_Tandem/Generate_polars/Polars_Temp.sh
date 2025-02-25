#!/bin/sh
~/Téléchargements/Xfoil2/bin/xfoil <<EOF
NACA0012
oper
ITER 
500
v
#Reynold
198530
pacc 
Polars_Temp

aseq 
#alpha_min
-10
#alpha_max
10
0.1


EOF
