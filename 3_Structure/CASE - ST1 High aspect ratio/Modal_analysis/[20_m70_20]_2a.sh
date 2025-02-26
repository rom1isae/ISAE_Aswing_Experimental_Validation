#!/bin/sh
~/Documents/Softwares/AswingMAC_forced/bin/aswing [20_m70_20]_2a <<EOF
nodes 
I 40


oper
I 100
%
a
d
x
r
p
s

28 1 
29 1
30 1

w
sensor.txt
o



modes
%
a
.
d
f
n
10
-0.1 300
w
[20_m70_20]_2a_eigen.txt
o
EOF
