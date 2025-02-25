#!/bin/sh
~/Téléchargements/Xfoil2/bin/xfoil <<EOF
N
NACA0012
oper
v
#Reynold
833829
VPAR
N 2.7

pacc 
Polars_Temp.txt

aseq 
#alpha_min
-17
#alpha_max
17
0.1


EOF
