% Novembre 2016, Sebastian Schwindt
% EPF Lausanne, LCH

% Script gets mean flow depth of single measurements and transfers it to
% excel file
%--------------------------------------------------------------------------
clear all;
close all;

expNo = 6210;
fileNo = 3;

targetName = ['Q-h_0',num2str(expNo),'.xlsx'];
targetRangeh = 'G4:G58';
targetRangehcr = 'K4:K58';

alpha_geo = 28.02;
w_geo = 0.1164;

h = nan(55,1); % 55 = No. of minutes (hydrograph duration)
hcr = nan(55,1); % 55 = No. of minutes (hydrograph duration)

% DATA TREATMENT ----------------------------------------------------------
Q = xlsread(targetName, 1, 'D4:D58');
cd ..\..

cd(['Analysis_No_', num2str(expNo,'%05i'),'\FlowDepth'])

csvData=csvread(['FlowDepth_', num2str(fileNo,'%03i'),'.csv']);

for i = 1:numel(h(:,1))
    t_ini = (i-1)*60+1;
    t_end = i*60;
    h(i,1) = nanmean(csvData(t_ini:t_end,5));
    hcr(i,1)=fGethcr(alpha_geo, Q(i), w_geo);
end

cd ..\..

% WRITE DATA --------------------------------------------------------------
cd('6perCent_Reservoir\Hydrograph')
xlswrite(targetName,h, 1, targetRangeh);
xlswrite(targetName,hcr, 1, targetRangehcr);

disp('Data successfully processed.');
