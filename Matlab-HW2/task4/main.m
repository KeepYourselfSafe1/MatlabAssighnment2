% Solar System Visualization with different colors for each planet
% Defines the distances from the Sun in astronomical units (AU) and planet sizes relative to Earth

planet_distances = [0.39, 0.72, 1, 1.52, 5.2, 9.58, 19.2, 30.05];  % in AU (Mercury to Neptune)
planet_sizes = [0.38, 0.95, 1, 0.53, 11.21, 9.45, 4.01, 3.88];  % relative to 1 Earth (Mercury to Neptune)

planet_names = {'Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'};

% Colors for each planet (8 different colors for scatter and bar chart)
planet_colors = lines(length(planet_names));

% Create a figure with two subplots
figure;

% First Subplot: Scatter plot of planet distances vs. planet sizes
subplot(1, 2, 1);
hold on;  % Keep the plot active to add points
for i = 1:length(planet_distances)
    scatter(planet_distances(i), planet_sizes(i), planet_sizes(i)*300, planet_colors(i, :), 'filled');  
    % planet_sizes(i)*300 scales the marker size
    %text(planet_distances(i) + 0.1, planet_sizes(i), ['  ' planet_names{i}], 'VerticalAlignment', 'bottom');  % Add labels
end
hold off;

% Set title, labels, grid, and legend for the scatter plot / subplot 1
title('Planet Distances vs. Sizes');
xlabel('Distance from Sun (AU)');
ylabel('Relative Planet Size (Earth = 1)');

grid on;
legend(planet_names, 'Location', 'northeastoutside');  % Move legend outside for clarity

% Second Subplot: Bar chart of planet distances
subplot(1, 2, 2);
bar_handle = bar(planet_distances, 'FaceColor', 'flat');  % Create bar chart with colored bars

% Assign colors to each bar, making sure each planet has a different one.
for i = 1:length(planet_distances)
    bar_handle.CData(i, :) = planet_colors(i, :);
end

% Set title, labels, and tick labels for the bar chart
title('Planet Distances from the Sun');
xlabel('Planet');
ylabel('Distance from Sun (AU)');
set(gca, 'XTickLabel', planet_names);  % Label bars with planet names
grid on;

% Saves the figure as a png titled 'solar_system_visualization'.
saveas(gcf, 'solar_system_visualization.png');