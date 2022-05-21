% Write a function that visualizes collected data with a flag for creating movies of the results
%% Project 2 - Part 2, Nagy, 4/10/22, Version 1.0

function visualize_data(xn,yn,xn0,yn0,create_movies)
writerObj = VideoWriter('Nagy_P2_NodalPositions.avi'); % create writer object
open(writerObj); set(gcf,'Renderer','zbuffer'); % set rendered
for t = 1:size(xn,3) % loop through timestep dimention of matrix
    if t == 1 % if t is 1 then plot single point
        set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1]); % expand window
        plot(xn0+xn(:,:,t),yn0+yn(:,:,t),'c.'); hold on % hold data plotted
        title(['Frame ' num2str(t)]) % title
        xlabel('X Position (mm)'); ylabel('Y Position (mm)'); % labels
        set(gca,'Color',[200 200 200]/250); % color background change
    else % if t isn't 1 then plot current and previous point
        % previous plotted point => black; current point => cyan
        plot(xn0+xn(:,:,t-1),yn0+yn(:,:,t-1),'k.'); hold on 
        plot(xn0+xn(:,:,t),yn0+yn(:,:,t),'c.','MarkerSize',7); hold on
        title(['Frame ' num2str(t)])% title
        xlabel('X Position (mm)'); ylabel('Y Position (mm)'); % labels
        set(gca,'Color',[200 200 200]/250); % color background change
    end
    if create_movies == 1 % if create movie flag on, create avi file from plot
        frame = getframe(gcf); % get and frame for video
        writeVideo(writerObj,frame); % write frame for video
    end
    pause(0.1) % create moving animation
end
close(writerObj); % close the file
end