#!/bin/sh
../bin/aswing C130J_ailes_flap_on <<EOF
nodes 
I 100


oper
!V 70
!A 5.0
%
a
d
K
V
24


+
!A 10.0
+
!A 11.0
+
!A 12.0
+
!A 9.0
!F1 22.5
!F2 22.5
+
!A 10.0
+
!A 11.0
+
!A 12.0
+
!A 9.0
!E1 1.2E6
!E2 1.2E6
+
!A 10.0
!E1 1.2E6
!E2 1.2E6
+
!A 11.0
!E1 1.2E6
!E2 1.2E6
+
!A 12.0
!E1 1.2E6
!E2 1.2E6
+
!A 9.0
!E1 0.0E6
!E2 0.0E6
!E3 1.2E6
!E4 1.2E6
+
!A 10.0
!E3 1.2E6
!E4 1.2E6
+
!A 11.0
!E3 1.2E6
!E4 1.2E6
+
!A 12.0
!E3 1.2E6
!E4 1.2E6
+
!A 9.0
!E1 1.2E6
!E2 1.2E6
!E3 1.2E6
!E4 1.2E6
+
!A 10.0
!E1 1.2E6
!E2 1.2E6
!E3 1.2E6
!E4 1.2E6
+
!A 11.0
!E1 1.2E6
!E2 1.2E6
!E3 1.2E6
!E4 1.2E6
+
!A 12.0
!E1 1.2E6
!E2 1.2E6
!E3 1.2E6
!E4 1.2E6
xx
h
1
w
A9.txt
o
2
w
A10.txt
o
3
w
A11.txt
o
4
w
A12.txt
o
5
w
F1F2_225_A9.txt
o
6
w
F1F2_225_A10.txt
o
7
w
F1F2_225_A11.txt
o
8
w
F1F2_225_A12.txt
o
9
w
E1_A9.txt
o
10
w
E1_A10.txt
o
11
w
E1_A11.txt
o
12
w
E1_A12.txt
o
13
w
E2_A9.txt
o
14
w
E2_A10.txt
o
15
w
E2_A11.txt
o
16
w
E2_A12.txt
o
17
w
E1E2_A9.txt
o
18
w
E1E2_A10.txt
o
19
w
E1E2_A11.txt
o
20
w
E1E2_A12.txt
o




EOF
