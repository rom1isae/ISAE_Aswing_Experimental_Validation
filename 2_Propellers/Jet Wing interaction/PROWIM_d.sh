#!/bin/sh
~/Documents/ASWING/ASWING_ISAE_ENAC/bin/aswing PROWIMd<<EOF
node 
I 150



oper 
!V  50
!E1 500
!E2 333
x
w
PROWINA0d.txt
O
!A 4
!E1 500
x
w
PROWINA4d.txt
O
!A 10
!E1 500
x
w
PROWINA10d.txt
O
EOF
