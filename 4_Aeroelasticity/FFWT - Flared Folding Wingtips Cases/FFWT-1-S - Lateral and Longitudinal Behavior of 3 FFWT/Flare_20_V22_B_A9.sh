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
!A 9
!B -9.95057202023288
x
+
!B -5.986624571409173
x
+
!B -1.930882303017956
x
+
!B 1.9881861696710494
x
+
!B 5.99891367077435
x
+ 
!B 10.010591709950099
x
+
!B 14.023899242964323
x
+
!B 16.031978816580104
x
+
!B 17.996129952133618
x
+
!B 21.10398207556778
x
+
!B 21.927012255151578
x
+
!B 22.474522184879664
x
+
!B 23.02189632345453
x
+
!B 23.477475642461894
x
p
s
67

16 3
21 3
25 1

w
Aswing_simulation/FFWT_Flare20_V22_B_A9.txt
O
EOF
