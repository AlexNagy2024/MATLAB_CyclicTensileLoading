% Write a function that loads the file, computes cumulative displacements and displays data if desired.
%% Project 2 - Part 1, Nagy, 4/10/22, Version 1.0

function [xn,yn,xn0,yn0] = load_data(filepath,dataset,flag)
file_location = [filepath dataset]; % create path to access the phantom file
p_mat = load(file_location); % load phantom file being called
xn0 = p_mat.xn0; yn0 = p_mat.yn0; % give xn0 and yn0 values from the phantom file called
xn_nodal = cumsum(p_mat.dxn, 2); yn_nodal = cumsum(p_mat.dyn, 2); % cumulative disps
xn = reshape(xn_nodal,[size(p_mat.xn0,1),size(p_mat.xn0,2),size(p_mat.dxn,2)]); 
yn = reshape(yn_nodal,[size(p_mat.yn0,1),size(p_mat.yn0,2),size(p_mat.dyn,2)]); 
avg_xn_nodal = mean(xn_nodal); avg_yn_nodal = mean(yn_nodal); % mean cumulative disp


if flag == 1 % if flag is on then create plots; 
    figure, set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1]); % expand window
    subplot(3,2,1), plot(p_mat.dxn'), title('Nodal Incremental Displacement (x data)')
    xlim([0 101]); ylim([min(p_mat.dxn(:)') max(p_mat.dxn(:)')]) % ylimits = xlimits
    subplot(3,2,2), plot(p_mat.dyn'), title('Nodal Incremental Displacement (y data)')
    xlim([0 101]); ylim([min(p_mat.dxn(:)') max(p_mat.dxn(:)')]) % ylimits = xlimits
    
    subplot(3,2,3), plot(xn_nodal'), title('Nodal Cumulative Displacement (x data)')
    xlim([0 101]); ylim([min(xn_nodal(:)') max(xn_nodal(:)')]) % ylimits = xlimits
    subplot(3,2,4), plot(yn_nodal'), title('Nodal Cumulative Displacement (y data)')
    xlim([0 101]); ylim([min(xn_nodal(:)') max(xn_nodal(:)')]) % ylimits = xlimits
    
    subplot(3,2,5), plot(avg_xn_nodal), title('Mean Cumulative Displacement (x data)')
    xlim([0 101]); ylim([min(avg_xn_nodal) max(avg_xn_nodal)]) % ylimits = xlimits
    subplot(3,2,6), plot(avg_yn_nodal), title('Mean Cumulative Displacement (y data)')
    xlim([0 101]); ylim([min(avg_xn_nodal) max(avg_xn_nodal)]) % ylimits = xlimits
    
    num = isstrprop(dataset,'digit'); % grab indicie of where phantom file # is indicated
    t = sgtitle(['Phantom ' dataset(num)]); % title based on indicie grabbed of phantom file
    t.FontWeight = 'bold'; t.FontSize = 18; % increase font size
end
end