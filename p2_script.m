% Write a script that runs load_data and visualize_data for a single phantom
%% Project 2 - Part 2, Nagy, 4/10/22, Version 1.0
clear all, close all

d = 'C:\Users\nagya\Desktop\MATLAB\ME260\Projects\Project 2\Project_2_Data\Project_2_Data\';
phantom_file = 'Phantom_2.mat'; % path and file for load data function
f = 0; % flag off for load data; dont need plots
cm = 1; % create movies flag on; create avi file
[xn,yn,xn0,yn0] = load_data(d,phantom_file,f); % call load data to get data
visualize_data(xn,yn,xn0,yn0,cm); % call visualize_data function; no outputs