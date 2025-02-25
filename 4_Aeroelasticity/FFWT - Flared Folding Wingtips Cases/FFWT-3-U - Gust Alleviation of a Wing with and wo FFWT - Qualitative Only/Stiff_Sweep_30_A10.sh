#!/bin/sh
~/Documents/ASWING/ASWING_ISAE_ENAC/bin/aswing Stiff_Sweep_30 <<EOF



gmod
5
-10 0 8 0.75



oper 
!V 20
!A 10 
%
1 0
d
x
%
c
d
x
0.01 200
p
s
74
71
72

16 2
16 3
25 1
24 1

w
Stiff_Sweep_30_A10.txt
O

h
EOF
