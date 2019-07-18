% Novembre 2016, Sebastian Schwindt
% EPF Lausanne, LCH

% Script gets mean flow depth of single measurements and transfers it to
% excel file
%--------------------------------------------------------------------------
clear all;
close all;

expNo = 6210;
fileNo = 2;

targetName = ['Q-h_0',num2str(expNo),'.xlsx'];
targetRange = 'D4:D58';


t_corr = +3;        %[s] diff. stopwatch PC and discharges_001
t_start = 3*60+17; %[s] start of hydrograph (stop watch PC)

result = nan(55,1); % 55 = No. of minutes (hydrograph duration)

% DATA TREATMENT ----------------------------------------------------------
cd ..\..

cd(['Analysis_No_', num2str(expNo,'%05i'),'\Pump'])

csvData=csvread('Discharges_001.csv');

for i = 1:numel(result(:,1))
    t_ini = (i)*60+t_start+1;
    t_end = (i+1)*60+t_start;
    result(i,1) = nanmean(csvData(t_ini:t_end,2))*10^-3;
end

cd ..\..

% WRITE DATA --------------------------------------------------------------
cd('6perCent_Reservoir\Hydrograph')
xlswrite(targetName,result, 1, targetRange);

disp('Discharge data copied.');
