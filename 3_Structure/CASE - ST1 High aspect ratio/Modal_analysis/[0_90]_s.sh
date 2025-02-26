#!/bin/sh
~/Documents/Softwares/AswingMAC_forced/bin/aswing [0_90]_s <<EOF
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
[0_90]_s_eigen.txt
o
EOF
