% March 2017, Sebastian Schwindt
% EPF Lausanne, LCH

% Script makes linear regression curves for X-/Z-/-Data from Kinect (Alessandro)

%% PREAMBLE
clear all;
close all;
sourceName = 'xProfilesData.xlsx';
S0 = 0.055021; %[-] bottom slope
D84= 0.01368;  %[m]
cases = [6210,6211, nan, nan, nan, nan; ... % case 1.i
         6505,6506, nan, nan, nan, nan; ... % case 2
         6502,6507,6508,6509,6503,6504];    % case 3

interpAnalysis = 1; % (de)activates interpolation analysis for reg. curves
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
            if interpAnalysis
                for j = 1:numel(c1xData(:,1)) % limit to linear range
                    if or(c1xData(j,1)<0.2/D84, c1xData(j,1)>1.5/D84)
                        c1xData(j,1) = nan;
                    end
                    if or(c1xData(j,2)<0.2/D84, c1xData(j,2)>1.5/D84)
                        c1xData(j,2) = nan;
                    end
                end
                cftool(c1xData,c1zData);
            end
        case 2
            c2xData = [data(:, 9),data(:,11)];
            c2zData = [data(:,10),data(:,12)];            
            if interpAnalysis
                for j = 1:numel(c2xData(:,1)) % limit to linear range
                    if or(c2xData(j,1)<0.065/D84, c2xData(j,1)>1.0/D84)
                        c2xData(j,1) = nan;
                    end
                    if or(c2xData(j,2)<0.01/D84, c2xData(j,2)>1.1/D84)
                        c2xData(j,2) = nan;
                    end
                end
                cftool(c2xData,c2zData);
            end
        case 3
            c3xData = [data(:,3),data(:,13),data(:,15),data(:,17),data(:,5),data(:,7)];
            c3zData = [data(:,4),data(:,14),data(:,16),data(:,18),data(:,6),data(:,8)];
            if interpAnalysis
                for j = 1:numel(c3xData(:,1)) % limit to linear range
                    if or(c3xData(j,1)<0.065/D84, c3xData(j,1)>1.0/D84)
                        c3xData(j,1) = nan;
                    end
                    if interpAnalysis%or(c3xData(j,2)<0.05/D84, c3xData(j,2)>0.93/D84)
                        c3xData(j,2) = nan;
                    end
                    if or(c3xData(j,3)<0.01/D84, c3xData(j,3)>0.95/D84)
                        c3xData(j,3) = nan;
                    end
                    if interpAnalysis%or(c3xData(j,4)<0.1/D84, c3xData(j,4)>1.11/D84)
                        c3xData(j,4) = nan;
                    end
                    if or(c3xData(j,5)<0.025/D84, c3xData(j,5)>0.9/D84)
                        c3xData(j,5) = nan;
                    end
                    if or(c3xData(j,6)<0.02/D84, c3xData(j,6)>0.99/D84)
                        c3xData(j,6) = nan;
                    end
                end
                cftool(c3xData,c3zData);
            end
    end
end

disp('Data processed.');
