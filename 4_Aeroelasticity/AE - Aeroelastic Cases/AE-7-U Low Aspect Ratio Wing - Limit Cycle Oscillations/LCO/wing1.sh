#!/bin/sh
~/Documents/ASWING/ASWING_ISAE_ENAC/bin/aswing wing1 <<EOF



oper 
%
a
d
!V 23
!B 1.0
g
1
0 0 1
x 
r
!V 24
x
!V 24.5
x
!V 25
x
!V 25.5
x 
!V 26
x
!V 26.5
x
!V 27
x
!V 27.5
x
!V 28
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
