% Write a function that computes engineering strain by comparing the left and right edges of the your DIC data
%% Project 2 - Part 2, Nagy, 4/10/22, Version 1.0

function [strain] = compute_strain(x0,xn)
left = squeeze(xn(:,1,:)); right = squeeze(xn(:,end,:)); % squeeze values for size
figure, set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1]); % expand window
plot(left(:,:)','b'); hold on, plot(right(:,:)','r') % plots of disp
strain = (right - left)./(x0(:,end) - x0(:,1)); % strain calculation
xlabel('Time (s)'); ylabel('X-Displacement (mm)'); % labels
end