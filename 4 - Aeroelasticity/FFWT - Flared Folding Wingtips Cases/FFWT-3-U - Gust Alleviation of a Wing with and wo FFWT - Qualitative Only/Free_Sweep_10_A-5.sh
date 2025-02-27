#!/bin/sh
~/Documents/ASWING/ASWING_ISAE_ENAC/bin/aswing Free_Sweep_10 <<EOF



gmod
5
-10 0 8 0.75



oper 
!V 20
!A -5.0 
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
Free_Sweep_10_A-5.txt
O

h
EOF
