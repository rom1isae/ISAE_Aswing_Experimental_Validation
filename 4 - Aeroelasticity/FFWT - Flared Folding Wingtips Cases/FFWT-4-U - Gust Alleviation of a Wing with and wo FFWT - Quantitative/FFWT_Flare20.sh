#!/bin/sh
/Users/r.jan/Documents/MIT_Aeronautics_Suite/Aswing_R_5_92/bin/aswing FFWT_Flare20_PM2 <<EOF
nodes
B 1
I 100
B 2 
I 40
B 3 
I 40




GMOD 
5
-10.9366     0   10.9366    0.6978




oper 
!A 6
!B 16
!V 22
%
a
13 13
d
x
r
%
.
d
x
0.0149 200
p
s

25 1

w
FFWT_Flare20/FFWT_Flare20-1.txt
O






GMOD
5
-5.6786     0    5.6786    0.8751





OPER
1
%
.
d
x
0.0077 200
p
w
FFWT_Flare20/FFWT_Flare20-2.txt
O






GMOD
5
-3.8516         0    3.8516    1.0066




OPER
1
%
.
d
x
0.0053 200
p
w
FFWT_Flare20/FFWT_Flare20-3.txt
O






GMOD
5
-2.9045         0    2.9045    1.0737



OPER
1
%
.
d
x
0.0040 200
p
w
FFWT_Flare20/FFWT_Flare20-4.txt
O






GMOD
5
-2.3312         0    2.3312    1.1302




OPER
1
%
.
d
x
0.0032 200
p
w
FFWT_Flare20/FFWT_Flare20-5.txt
O






GMOD
5
-1.9470         0    1.9470    1.1361




OPER
1
%
.
d
x
0.0027 200
p
w
FFWT_Flare20/FFWT_Flare20-6.txt
O






GMOD
5
-1.6778         0    1.6778    1.0762



OPER
1
%
.
d
x
0.0023 200
p
w
FFWT_Flare20/FFWT_Flare20-7.txt
O






GMOD
5
-1.4618         0    1.4618    0.9551



OPER
1
%
.
d
x
0.0020 200
p
w
FFWT_Flare20/FFWT_Flare20-8.txt
O





EOF
