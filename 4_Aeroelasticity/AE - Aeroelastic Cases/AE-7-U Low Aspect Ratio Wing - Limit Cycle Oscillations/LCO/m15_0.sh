#!/bin/sh
~/Documents/ASWING/ASWING_ISAE_ENAC/bin/aswing [m15_0] <<EOF



oper 
%
a
d
!V 10.0
!B 1.0
g
1
0 0 1
x 
r
!V 11.0
x
!V 12.0
x
!V 13.0
x
!V 14.0
x
!V 15.0
x
!V 16.0
x
!V 17.0
x
!V 18.0
x
!V 19.0
x
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
