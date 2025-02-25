#!/bin/sh
~/Documents/ASWING/ASWING_ISAE_ENAC/bin/aswing C130J_ailes_flap_off <<EOF
node 
I 100



oper
!V 70
!A 9.0
!F1 22.5
!F2 22.5
!E1 1.20E6
!E2 1.2E6
!E3 1.2E6
!E4 1.2E6
%
a
d
K
V
3
5
7
8
12
22
27
24


x
w
A9.txt
o




EOF
