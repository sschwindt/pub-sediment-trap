% November 2016, Sebastian Schwindt
% EPF Lausanne, LCH

% Script gets mean flow depth of single measurements and transfers it to
% excel file
%--------------------------------------------------------------------------
clear all;
close all;

Date = '20161123';
expNo = 6509;
fileNo = 2;
dur = 8; % [min] experiment duration

targetName = [Date,'_Flush_0',num2str(expNo),'.xlsx'];
targetRange = ['C4:C',num2str(4+dur-1)];


t_corr = -7;        %[s] diff. stopwatch PC and discharges_001
t_start = 1*3600+29*60; %[s] start of hydrograph (stop watch PC)

result = nan(dur,1); % No. of minutes (flushing duration)

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
cd('6perCent_Reservoir\Flushing')
xlswrite(targetName,result, 1, targetRange);

disp('Discharge data copied.');
