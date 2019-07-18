% March 2017, Sebastian Schwindt
% EPF Lausanne, LCH

% Script creates 2D contour plot in grey scale
%% Header
clear all;
close all;

fNref = 'surface_EMPTYRES.xlsx';
write2disc=1;

expNo = [6211, 6505, 6504]; % case 1.i / case 2 / case 3
D84 = 0.01368;  %[m]

% scrsz = get(0,'ScreenSize');
scrsz =   [1,1,1660,1770; ... % case 1.i orig: 2271,1773
            1,1,1660,1770; ... % case 2 orig: 2250,1719
             1,1,1660,1770];    % case 3 orig: 2262,1725

fontS = 56;

disp('Runnning ... ')
%% Get Data and Plot
refData = xlsread(fNref,1,'A1:ATD1600'); % reference Empty reservoir
refData = refData./1000./D84; % conversion mm -> m -> dimless
x_emptRes=(refData(2:end,1));
y_emptRes=(refData(1,2:end));
z_emptRes = refData(2:end,2:end)';
[X_emptRes,Y_emptRes] = meshgrid(x_emptRes,y_emptRes);

for exi = 1:numel(expNo)
    % READ DATA
    fName = ['surface_0', num2str(expNo(exi)), '.xlsx'];
    xyzData = xlsread(fName);
    xyzData = xyzData./1000./D84; % conversion mm -> m -> dimless
    
    % AXIS SETTING
    figure1 = figure('Color',[1 1 1],'Position',scrsz(exi,:));
    axes1 = axes('Parent',figure1,'FontSize',fontS,...
        'FontName','Arial','GridLineStyle','-',...
        'XTick',0:20:120,...
        'YTick',-45:15:45,...
        'LineWidth', 2.5);

    set(axes1,'MinorGridColor',[1 1 1],...
        'MinorGridLineStyle','-','XMinorTick','on','YMinorTick','on',...
        'Xdir', 'reverse',...% 'Ydir', 'reverse', ... %reverse axes dir.
        'YAxisLocation', 'Right'); % shift Y axis...   
    %set(axes1,'Zdir','reverse')

    hold(axes1,'all');
    box(axes1,'on');
    grid(axes1,'on');
    xlim(axes1,[0 120]);
    ylim(axes1,[-45 45]);
    
    
    % ASSIGN DATA 
    x=(xyzData(2:end,1));
    y=(xyzData(1,2:end));
    z = (xyzData(2:end,2:end))';
    [X,Y] = meshgrid(x,y);
    
    Z=z-z_emptRes;
    Z=Z+30/1000/D84;
    for i=1:length(Z(:,1))
        for j=1:length(Z(1,:))
            if Z(i,j)<0
                Z(i,j)=0;
            end
        end
    end

    % PLOT
    switch exi
        case 1
            plot1 = contourf(X,Y,Z,[0.01:3:15]); % change this for data limits
        case 2
            plot1 = contourf(X,Y,Z,[1:3:15]); % change this for data limits
        case 3
            plot1 = contourf(X,Y,Z,[0.3:3:15]); % change this for data limits
    end
    
    contourcmap('gray',[0:3:15]); % change this for colourbar resolution

    caxis([0,15]);

    c = contourcbar();
    c.Label.String = ('Relative deposit height Z_* [-]');
    c.Label.FontSize= fontS;
    c.Label.FontName= 'Arial';
    c.Location = 'westOutside';
    c.Ticks= [0,3,6,9,12,15];
    c.Limits = [0, 15];

    % Create ylabel
    xlabel('Relative length X_* [-]','FontSize',fontS,'FontName','Arial');
    ylabel('Relative width Y_* [-]','FontSize',fontS,'FontName','Arial');


    if write2disc
        cd('figures');
        % export to jpg for powerpoint use
        export_fig(['surface0', num2str(expNo(exi),'%4i'), '.jpg'], '-jpg')
        %export_fig(['surface0', num2str(expNo(exi),'%4i'), '.eps'], '-eps')
        cd ..
        disp(['Plot of exp. 0',num2str(expNo(exi),'%4i'), ' completed.']);
        close all;
    end
    clear xyzData fName
end

disp('Finished job.');
