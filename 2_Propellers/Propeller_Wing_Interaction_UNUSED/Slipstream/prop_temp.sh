#!/bin/sh
~/Documents/ASWING/ASWING_ISAE_ENAC/bin/aswing prop_temp <<EOF
plpa
g


oper
!V 20
!E1 20
!F1 15
x
r
h
p
s

19 1 
20 1
21 1
19 2 
20 2
21 2
19 3 
20 3
21 3
19 4 
20 4
21 4
19 5 
20 5
21 5
19 6
20 6
21 6
19 7 
20 7
21 7
19 8 
20 8
21 8
19 9 
20 9
21 9
19 10 
20 10
21 10

w
prop_temp.txt
O
EOF
