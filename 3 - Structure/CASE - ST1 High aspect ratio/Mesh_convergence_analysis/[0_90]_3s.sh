#!/bin/sh
~/Documents/Softwares/AswingMAC_forced/bin/aswing [0_90]_3s <<EOF
nodes 
I 4


oper
%
a
d
x
p
s

28 1 
29 1
30 1

w
[0_90]_3s_Sensor_I4.txt
o




mode
%
t
a
.
d
n
16
-0.1 300
w 
[0_90]_3s_I4.e00
o




nodes 
I 8


oper
%
a
d
x
p
w
[0_90]_3s_Sensor_I8.txt
o




mode
%
t
a
.
d
n
16
-0.1 300
w 
[0_90]_3s_I8.e00
o








nodes 
I 16


oper
%
a
d
x
p
w
[0_90]_3s_Sensor_I16.txt
o




mode
%
t
a
.
d
n
16
-0.1 300
w 
[0_90]_3s_I16.e00
o





nodes 
I 32


oper
%
a
d
x
p
w
[0_90]_3s_Sensor_I32.txt
o




mode
%
t
a
.
d
n
16
-0.1 300
w 
[0_90]_3s_I32.e00
o





nodes 
I 64


oper
%
a
d
x
p
w
[0_90]_3s_Sensor_I64.txt
o




mode
%
t
a
.
d
n
16
-0.1 300
w 
[0_90]_3s_I64.e00
o





nodes 
I 128


oper
%
a
d
x
p
w
[0_90]_3s_Sensor_I128.txt
o




mode
%
t
a
.
d
n
16
-0.1 300
w 
[0_90]_3s_I128.e00
o





nodes 
I 256


oper
%
a
d
x
p
w
[0_90]_3s_Sensor_I256.txt
o




mode
%
t
a
.
d
n
16
-0.1 300
w 
[0_90]_3s_I256.e00
o
EOF
