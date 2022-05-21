% Write a script that uses your functions to summarize the results for all phantoms
%% Project 2 - Part 3, Nagy, 4/10/22, Version 1.0
clear all, close all

% filepath for function (specific file location)
d = ['C:\Users\nagya\Desktop\MATLAB\ME260\Projects\Project 2\Project_2_Data\Project_2_Data\'];
for i = 1:4 % loop through each phantom data file
    f = 0; % flag for plots on load data
    phantom_file = ['Phantom_' num2str(i) '.mat']; % phantom file from load data
    force_file = ['Phantom_' num2str(i) '_Force.mat']; % force data path
    [xn,yn,xn0,yn0] = load_data(d,phantom_file,f); % function called
    alldata(i).xn = xn; alldata(i).yn = yn; alldata(i).xn0 = xn0; alldata(i).yn0 = yn0; 
    load([d force_file]) % load force files
    s = compute_strain(xn0,xn); % output strain
	[Eloading(i),Eunloading(i)] = compute_Emods(force,s); % output moduli data
end
EL_std = std(Eloading); EU_std = std(Eunloading); % take standard deviations
E = mean([Eloading; Eunloading]'); stds = [EL_std; EU_std]'; % compress into array
xticks = {'Loading','Unloading'}; % labels for each bar

figure, set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1]); % expand window
b = bar(1:2,E); hold on; e = errorbar(1:2,E,stds,stds); grid on; % bar + errorbar
e.LineStyle = 'none'; e.LineWidth = 1.5; % errorbar line formatting
set(gca,'xticklabel',xticks,'FontSize',15,'FontName','Times New Roman'); % xlabels on ticks
ylabel('Elastic Modulus (MPa)','FontSize',15,'FontName','Times New Roman'); 
title('Average Elastic Moduli For Loading and Unloading (MPa)','FontSize',18,'FontName','Times New Roman');
set(gcf,'color',[200 200 200]/250); % change color background

[h, p] = ttest2(Eloading,Eunloading); % ttest2; p > 0.05 indicates significance
if p < 0.05 % logic for statistically significant difference
    disp('There is a statistically significant difference between the elastic modulus values for loading and unloading.')
else % logic for no statistically significant difference
    disp('There is not a statistically significant difference between the elastic modulus values for loading and unloading.')
end