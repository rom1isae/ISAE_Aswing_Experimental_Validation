#!/bin/sh
~/Documents/Softwares/Xfoil/bin/xfoil <<EOF
N
NACA0012
oper
v
#Reynold
2109724
VPAR
N 2.7

pacc 
Polars_Temp.txt

aseq 
#alpha_min
-15
#alpha_max
15
0.1


EOF
