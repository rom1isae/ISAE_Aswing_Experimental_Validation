#!/bin/sh
~/Documents/ASWING/ASWING_ISAE_ENAC/bin/aswing Pazy_wing <<EOF



oper 
%
a
7 0
d
!V 51.5
!B 3.0
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
V2_1.txt
O

x
0.001 999
p
w
V2_2.txt
O

x
0.001 999
p
w
V2_3.txt
O

x
0.001 999
p
w
V2_4.txt
O



EOF
