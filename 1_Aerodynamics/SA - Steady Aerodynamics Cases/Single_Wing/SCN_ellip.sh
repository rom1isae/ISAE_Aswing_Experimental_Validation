#!/bin/sh
~/Documents/Softwares/AswingMAC_12_02_21/bin/aswing CASEI <<EOF
node
I 8

oper
K
V 
24


!V 20
!A 8
%
a
d
x
W
SCN/ellip_A8_N6.txt


node
I 14

oper
!V 20
!A 8
%
a
d
x
W
SCN/ellip_A8_N12.txt


node
I 26

oper
!V 20
!A 8
%
a
d
x
W
SCN/ellip_A8_N24.txt


node
I 50

oper
!V 20
!A 8
%
a
d
x
W
SCN/ellip_A8_N48.txt


node
I 98

oper
!V 20
!A 8
%
a
d
x
W
SCN/ellip_A8_N96.txt





EOF
