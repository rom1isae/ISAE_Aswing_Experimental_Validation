#!/bin/sh
~/Documents/ASWING/ASWING_ISAE_ENAC/bin/aswing [p15_0] <<EOF



oper 
%
a
d
!V 30.0
!B 1.0
g
1
0 0 1
x 
r
%
c
d
x oper.f1
0.001 999
p
s

14 1
17 1

w 
wing1_1.txt
O

x
0.001 999
p
w
wing1_2.txt
O

x
0.001 999
p
w
wing1_3.txt
O

x
0.001 999
p
w
wing1_4.txt
O

x
0.001 999
p
w
wing1_5.txt
O

x
0.001 999
p
w
wing1_6.txt
O

x
0.001 999
p
w
wing1_7.txt
O

EOF
