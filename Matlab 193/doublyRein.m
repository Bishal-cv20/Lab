clc
clear all
% initializaton of variables
L=5      % clear span in m
DL=13      % dead load in kN/m
LL=9       % live load in kN/m
fck=25     % compressive strength of concrete
fy=500     % strength of steel
C=25       % clear cover
dm=16      % dia of main bars
ds=8       % stirups dia
t=0.23
b=230      % width in mm
Tc=3.1     % max 

% Load ccalculations
Wu=1.5*(DL+LL)  % Factored load 

% Effective depth cal
d=L/14
D=d+C+ds+(dm/2)

% effective span cal
Le1=L+t
Le2=L+d
Le=min(Le1,Le2)

%BM and SF calculations
Mu=(Wu*Le*Le)/8
Vu=(Wu*Le)/2

%check for shear
Tv=Vu/b*d
if Tv<Tc
    disp('Not required')
else D=D*0.02   % depth should be increased by 20%
end

    %check for flexure
    H=Mu/(b*d*d)
    Ptreq = input("\nEnter the percentage of tension steel required")
    Astreq=(Ptreq*b*d)/100