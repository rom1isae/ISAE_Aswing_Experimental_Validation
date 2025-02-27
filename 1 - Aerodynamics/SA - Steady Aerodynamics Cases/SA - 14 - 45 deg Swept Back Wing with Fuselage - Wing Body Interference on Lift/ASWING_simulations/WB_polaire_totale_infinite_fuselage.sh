#!/bin/sh
~/Documents/ASWING/ASWING_ISAE_ENAC/bin/aswing NACA_TN_3730_bench_infinite_fuselage <<EOF
oper
k
iter 
10

!V 70
%
a
d
k
m

!A 0.0
+
!A 0.5
+
!A 1.0
+
!A 1.5
+
!A 2.0
+
!A 2.5
+
!A 3.0
+
!A 3.5
+
!A 4.0  
+
!A 4.5
+
!A 5.0 
+
!A 5.5
+
!A 6.0 
+
!A 6.5
+
!A 7.0
+
!A 7.5
+
!A 8.0
+
!A 8.5
+
!A 9.0
+
!A 9.5
+
!A 10.0
+
!A 10.5
+
!A 11.0
+
!A 11.5
+
!A 12.0
+
!A 12.5
+
!A 13.0
+
!A 13.5
+
!A 14.0
+
!A 14.5
+
!A 15.0
+
!A 15.5
+
!A 16.0
+
!A 16.5
+
!A 17.0
+
!A 17.5
+
!A 18.0
+
!A 18.5
+
!A 19.0
+
!A 19.5
+
!A 20.0
+
!A 20.5
+
!A 21.0
+
!A 21.5
+
!A 22.0
+
!A 22.5
+
!A 23.0
+
!A 23.5
+
!A 24.0
+
!A 24.5
+
!A 25.0
+
!A 26.0
+
!A 26.5
+
!A 27.0
+
!A 28.5
+
!A 29.0
+
!A 29.5
+
!A 30.0
+
!A 30.5
+
!A 31.0
xx
rr
p
s
68 74

w
WB_polaire_totale_infinite_fuselage.txt
o
EOF
