% April 2017, Sebastian Schwindt
% EPF Lausanne, LCH

% Script creates plot according to X-/Z-/-Data from Kinect (Alessandro)
% Also implied: interpolation of linear functions for Sdep
%% PREAMBLE
clear all;
close all;
sourceName = 'xProfilesData.xlsx';
S0 = 0.055021; %[-] bottom slope
D84= 0.01368;  %[m]
cases = [6210,6211, nan, nan, nan, nan; ... % case 1.i
         6505,6506, nan, nan, nan, nan; ... % case 2
         6502,6507,6508,6509,6503,6504];    % case 3


%% READ DATA
disp('Running ...')
data = xlsread(sourceName, 1, 'A4:V2665')./D84./1000; % dimensionless data
refxData = data(:,1);
refzData = data(:,2);
for i = 1:numel(refxData) % eliminate the barrier
    if refxData(i)<80/D84
        refxData(i) = nan;
    end
end
for i = 1:numel(cases(:,1))
    switch i
        case 1
            c1xData = [data(:,19),data(:,21)];
            c1zData = [data(:,20),data(:,22)];
            ic = xlsread('regressionData.xlsx', 1, 'C6:E6');
            xInt1 = 15:1:110;
            yInt1 = ic(1).*xInt1+ic(3);
            dyInt1=0.65;
        case 2
            c2xData = [data(:, 9),data(:,11)];
            c2zData = [data(:,10),data(:,12)];
            ic = xlsread('regressionData.xlsx', 1, 'C14:E14');
            xInt2 = 5:1:80;
            yInt2 = ic(1).*xInt2+ic(3);
            dyInt2=0.6;
        case 3
            c3xData = [data(:,3),data(:,13),data(:,15),data(:,17),data(:,5),data(:,7)];
            c3zData = [data(:,4),data(:,14),data(:,16),data(:,18),data(:,6),data(:,8)];
            ic = xlsread('regressionData.xlsx', 1, 'C22:E22');
            xInt3 = 2:1:77;
            yInt3 = ic(1).*xInt3+ic(3);
            dyInt3=0.5;
    end
end


%% SEND TO PLOTTING
fPlot_xProfileVert(c1xData, c2xData, c3xData,...
                 c1zData, c2zData, c3zData,...
                  xInt1, xInt2, xInt3,...
                   yInt1, yInt2, yInt3, dyInt1, dyInt2, dyInt3, 1)
disp('Data processed.');
