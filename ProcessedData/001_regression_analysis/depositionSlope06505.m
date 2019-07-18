% March 2017, Sebastian Schwindt
% EPF Lausanne, LCH

% Deposition slope assessments...
%--------------------------------------------------------------------------
clear all;
close all;

g = 9.81;
D84 = 0.01368;  %[m]
wSpill = 0.232; %[m]
hSpill = 0.35;  %[m] from video observations @min22 from 06505

Qpeak = 0.012475; %[m3/s]
q = Qpeak/wSpill;%[m2/s]


PhiPeak=0.089478021;%mean([0.089478021,0.073149915,0.02048011,0.023559125, ...
             %0.045392135]); %[-] from spreadsheet of exp06505

s = 2.68;
tauxCr= 0.05;
Ch = 30; % chezy coefficient @12.4l/s = 2.83*sqrt(g/f)

Seq_J = Ch/q*D84^1.5*(s-1)^1.5*((PhiPeak/3.97)^(2/3)+tauxCr)^1.5;

Seq_Sj = D84/hSpill*tauxCr*(s-1);