#!/bin/sh
~/Documents/ASWING/ASWING_ISAE_ENAC/bin/aswing PROWIM<<EOF
node 
I 150



oper 
!V  50
!E1 500
!E2 333
x
w
PROWINA0.txt
O
!A 4
!E1 500
x
w
PROWINA4.txt
O
!A 10
!E1 500
x
w
PROWINA10.txt
O
EOF
