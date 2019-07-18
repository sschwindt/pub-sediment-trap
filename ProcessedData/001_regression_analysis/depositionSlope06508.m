% March 2017, Sebastian Schwindt
% EPF Lausanne, LCH

% Deposition slope assessments...
%--------------------------------------------------------------------------
clear all;
close all;

g = 9.81;
D84 = 0.01368;  %[m]
wSpill = 0.232; %[m]
hSpill = 0.027; %[m], from picture observations of 06508 @peak

Qpeak = 0.0129; %[m3/s]
q = Qpeak/wSpill;%[m2/s]

QBpeak=0.106; %[m3/s]
PhiPeak=0.20913493;%[-] from spreadsheet of exp06508

s = 2.68;
tauxCr= 0.05;
Ch = 30; % chezy coefficient @12.4l/s = 2.83*sqrt(g/f)

Seq_J = Ch/q*D84^1.5*(s-1)^1.5*((PhiPeak/3.97)^(2/3)+tauxCr)^1.5;

Seq_Sj = D84/hSpill*tauxCr*(s-1);