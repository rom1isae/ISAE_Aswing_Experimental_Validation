#!/bin/sh
/Users/r.jan/Documents/MIT_Aeronautics_Suite/Aswing_R_5_92/bin/aswing FFWT_Flare20 <<EOF
nodes
B 1
I 100
B 2 
I 40
B 3 
I 40


oper 
%
a
d
k
i
30

!V 22
!A 12
!B -9.993957293682316
x
+
!B -5.938486607597513
x
+
!B -1.928166479953827
x
+
!B 1.9910377838883804
x
+
!B 6.0021726584513
x
+
!B 10.014393862239878
x
+
!B 13.98255083681298
x
+
!B 15.94425773160879
x
+
!B 17.953016260990598
x
+
!B 19.9616389992192
x
+
!B 22.061784974708903
x
+
!B 22.609838069049804
x
+
!B 23.430831381335512
x
+
!B 24.023356078351494
x
p
s
67

16 3
21 3
25 1

w
Aswing_simulation/FFWT_Flare20_V22_B_A12.txt
O
EOF
