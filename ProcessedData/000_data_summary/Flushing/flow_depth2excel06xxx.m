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
targetRangeh = ['E4:E',num2str(4+dur-1)];
targetRangehcr = ['F4:F',num2str(4+dur-1)];

alpha_geo = 28.02;
w_geo = 0.1164;

h = nan(dur,1); % No. of minutes (hydrograph duration)
hcr = nan(dur,1); % No. of minutes (hydrograph duration)

% DATA TREATMENT ----------------------------------------------------------
Q = xlsread(targetName, 1, ['C4:C',num2str(4+dur)]);
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
cd('6perCent_Reservoir\Flushing')
xlswrite(targetName,h, 1, targetRangeh);
xlswrite(targetName,hcr, 1, targetRangehcr);

disp('Data successfully processed.');
