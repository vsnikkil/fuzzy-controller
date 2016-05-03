function [] = animation(theta, t,cartx,l)
%Animation: Plots the animation of a inverted pendulum on a cart
%   inputs:
%       theta: vector containing the angle values
%       t: vector containing time values
%       cartx: vector containing the cart positions
%       l: lenght of the pendulum

figHandle = figure; % Create a new figure where the animation is shown
set(figHandle, 'Position', [100 200 1200 500]) % Set the size of the window (these parameters should be good)
axis([min(cartx)-1 max(cartx)+1 -0.5 1]); % Set the axis. X coordinate is selected so that cart stays between the min and max values

for i = 1:(length(t)-1)
    cla % Clear the axis before drawing anything new    
    
    a = theta(i); % Read the angle of the pendulum
    x = l*sin(a); % Calculate the x coordinate of the end of the pendulum relative to the cart
    y = l*cos(a); % Calculate the y coordinate of the end of the pendulum relative to the cart
    
    rectangle('Position',[x+cartx(i)-0.05, y-0.05, 0.1,0.1], 'Curvature',[1 1],'FaceColor','k'); % Draw the ball at the end of the pendulum
    hold on % Hold the drawing
    plot([x+cartx(i) cartx(i)],[y 0],'k','Linewidth',4); % Draw the pendulum    
    rectangle('Position',[cartx(i)-0.5 -0.35 0.1 0.1],'Curvature',[1 1],'FaceColor','k'); % Draw the left wheel of the cart
    rectangle('Position',[cartx(i)+0.40 -0.35 0.1 0.1],'Curvature',[1 1],'FaceColor','k'); % Draw the right wheel of the cart
    rectangle('Position',[cartx(i)-0.5 -0.25 1 0.25], 'Facecolor','r') % Draw the cart
    
    title(['Time: ' num2str(t(i)) ' s Angle: ' num2str(theta(i)/(2*pi)*360) ' deg']); % Set the title for the drawing (Time and angle of the pendulum)
    xlabel(['Cart position: ' num2str(cartx(i)) ' m']); % Set the label of the x axis to show the position of the cart
    
    pause(0.9*(t(i+1)-t(i))) % Pause the get the animation effect. Note: the factor 0.9 can be changed to determine the speed of the animation.
    hold off % Remove hold so that the next drawing era
    
    if i == 1 % Pause the animation at start so that window size might be adjusted to get the best looking animation
        waitforbuttonpress
    end
end
end