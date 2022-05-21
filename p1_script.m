% Write a script that runs load_data for all phantoms
%% Project 2 - Part 1, Nagy, 4/10/22, Version 1.0
clear all, close all

% filepath for function (specific file location)
d = ['C:\Users\nagya\Desktop\MATLAB\ME260\Projects\Project 2\Project_2_Data\Project_2_Data\'];
for i = 1:4 % loop through each phantom data file
    f = 1; % flag for function
    phantom_file = ['Phantom_' num2str(i) '.mat']; % dataset for function (specific file)
    [xn,yn,xn0,yn0] = load_data(d,phantom_file,f); % function called
    alldata(i).xn = xn; alldata(i).yn = yn; alldata(i).xn0 = xn0; alldata(i).yn0 = yn0; 
end
save('alldata', 'alldata') % structure saved; stores xn, yn, xn0, yn0 data for the 4 phantoms