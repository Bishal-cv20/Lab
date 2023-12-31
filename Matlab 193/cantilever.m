clc
clear all
%BMD AND SFD OF CANTILEVER SUBJECTED TO POINT LOAD AT FREE END
P=100 %POINT LOAD IN KN
L=6 %SPAN IN m
%REACTIONS
RA=+P %VERTICAL REACTION FORCE AT POINT A IN KN
MA=P*L %MOMENT  REACTION AT POINT A IN KNm
HA=0
%BMD AND SFD CALCULATIONS AND PLOTTING
%AE FOR BM MXX=-P*X
X1=0 % AT PT B %SECXX AT PT B X=0
MB=-P*X1 %BM AT PT B
X2=L % AT PT A %SECXX AT PT A X=L
MA=-P*X2 %BM AT PT A
[X]=[X1 X2]
[M]=[MB MA]


plot(X,M)
xlabel"LENGTH OF BEAM"
ylabel"BENDING MOMENT IN KNm"
title"BMD"

X1=0 % AT PT B SECXX AT PT B X=0
VB1=0
VB2=P % SF AT B
X2=L % AT PT A SECXX AT PT A X=L
VA1=P
VA2=0
[X9]=[X1 X1 X2 X2]
[V]=[VB1 VB2 VA1 VA2]

% plot(X9,V)
% xlabel"LENGTH OF BEAM"
% ylabel"SHEAR FORCE IN KN"
% title"SFD" 