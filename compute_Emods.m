% Write a second function that uses strain to compute elastic modulus for the loading and unloading portions of the curve
%% Project 2 - Part 3, Nagy, 4/10/22, Version 1.0

function [EL_data,EU_data] = compute_Emods(force,strain)
k_unitsPreferenceActivate('mm_N_s'); % set units basis
k_unitsVariables('N, mm, s, MPa'); % units used in calculations
time = 0.01*(1:size(strain, 2))'*s; % 100 Hz => 1/100 s time step
% predefined values with units; equations of force and area
force = force*N; length = 16*mm; width = 12*mm; area = length*width; 
stress = (force/area)'; % formula for stress 
[val, loc] = max(stress); % indici of max stress point
avg_strain = mean(strain)'*(mm/mm); % average strain

figure, set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1]); % expand window
subplot(4,1,1)
k_plot(time,avg_strain); % plot average strain vs time
subplot(4,1,2)
k_plot(time,stress); % plot stress vs time
subplot(2,1,2)
k_plot(avg_strain,stress); % plot stress vs average strain 
title('Stress vs. Strain');

Emods = stress./avg_strain; % total elastic modulus for load and unloading
Eloading = Emods(1:loc,:); Eloading = mean(Eloading,'omitnan'); % Eloading
EL_data = Eloading.Data; EL_units = Eloading.Units; % grab just units and data
Eunloading = Emods(loc:end,:); Eunloading = mean(Eunloading,'omitnan'); % Eunloading
EU_data = Eunloading.Data; EU_units = Eunloading.Units; % grab just units and data
% loading and unloading displays 
disp(['Elastic Modulus (loading): ' num2str(EL_data) ' ' char(EL_units)])
disp(['Elastic Modulus (unloading): ' num2str(EU_data) ' ' char(EU_units)])
end