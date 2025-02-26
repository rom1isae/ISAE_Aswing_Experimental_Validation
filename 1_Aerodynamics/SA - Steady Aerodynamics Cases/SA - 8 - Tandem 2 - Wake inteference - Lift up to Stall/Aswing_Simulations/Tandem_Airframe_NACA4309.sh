#!/bin/sh
~/Documents/AswingMAC_5_05_2021/bin/aswing Tandem_Airframe_NACA4309 <<EOF
oper 
k
I
100
F

%
a
d
!V 30
!A -6.0
+
!A -5.0
+
!A -4.0
+
!A -3.0
+
!A -2.0
+
!A -1.0
+
!A 0.0
+
!A 2.0
+
!A 3.0
+
!A 4.0
+
!A 5.0
+
!A 6.0
+
!A 7.0
+
!A 8.0
+
!A 9.0
+
!A 10.0
+
!A 11.0
+
!A 12.0
xx
p
s
68 72 73 74 75 76 77 78

w
Tandem_Airframe_NACA4309.txt
o
EOF
