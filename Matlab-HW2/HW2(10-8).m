    % Author Name: Noah Yamanaka
% Email: yamana16@rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Assignment 2
% Task: Assighnment Matlab 2
% Date: 10/11/24

%Task 1
%Initializes Population vector with given values and growth_rate vector
population = [5000 5200 5350 5600 5800] 
growth_rate = []

%assigns grwoth_rate vector by dividing population(i + 1) with population (i) getting the percentage growth for each year.
for i = 1:length(population) - 1
    growth_rate(i) = population(i + 1) / population(i) - 1
    growth_rate(i) = growth_rate(i) * 100;
end
%Sets the rate of growth for year 0 to 0.
growth_rate = [0 growth_rate];

%initalizes a 2 x 5 matrix with the population and growth_rate vectors
pop_data = [population; growth_rate];

fprintf("\n");
%Prints out the population vector from the pop_data matrix
for i = 1:length(population)
    fprintf("%d ", pop_data(1, i));
end

%Prints out the growth_rate vector from the pop_data matrix.
for i = 1:length(population)
    fprintf("%f ", pop_data(2, i));
end

%Task 2


function caesar_cipher = caesar(textInput, shiftValue)
% Convert the input text to its ASCII (numeric) representation
textToDouble = double(textInput);
% Shift each character's ASCII value by the given shiftValue
shiftedDouble = textToDouble+shiftValue;
% Get the length of the shifted ASCII array
doubleLength = length(shiftedDouble);

% Loop through each character in the shifted array
for i = 1:doubleLength
    % Ensure shifted characters wrap around the alphabet if they exceed 'z' (ASCII 122)
    while shiftedDouble(i) > 122
        shiftedDouble(i) = shiftedDouble(i)-26;
    end
    % Ensure shifted characters wrap around the alphabet if they fall below 'a' (ASCII 97)
    while shiftedDouble(i) < 97
        shiftedDouble(i) = shiftedDouble(i)+26;
    end
end
% Convert the shifted ASCII values back to characters
caesar_cipher = char(shiftedDouble);
end

% Prompt user for input message and how many values they want to shift it.
text = input('Enter a message to encrypt: ', 's');
shift = input('Enter a shift value (1-25): ');

% Call the caesar function to encrypt the input message
output = caesar(text, shift);

% Display the original and encrypted messages
fprintf('Original Message: %s\n', text);
fprintf('Encrypted Message: %s\n', output);

% Task 3
% Initializes data for every day in one 1 x 4 cell for each 
day1 = {'2024-09-01', 25.5, 60, 0};
day2 = {'2024-09-02', 26.0, 65, 5};
day3 = {'2024-09-03', 24.5, 70, 10};
day4 = {'2024-09-04', 23.0, 75, 15};
day5 = {'2024-09-05', 22.5, 85, 20};

% Open file for writing and adds headers
fileID = fopen('weather.txt', 'w');
fprintf(fileID, '%s %s %s %s\n', 'date', 'temp', 'humid', 'rain');

% Writes each day's data into weather.txt while also sticking to the headings
days = {day1, day2, day3, day4, day5};
for i = 1:length(days)
    fprintf(fileID, '%s %f %f %f\n', days{i}{1}, days{i}{2}, days{i}{3}, days{i}{4});
end

fclose(fileID);

% Display the written file
type weather.txt

% Open file for reading
fileID = fopen('weather.txt', 'r');
format = '%s %f %f %f';
data = textscan(fileID, format, 'Delimiter', ' ', 'HeaderLines', 1);

% Close the file
fclose(fileID);

% Extract the data from cell arrays
temperature = data{2};
humidity = data{3};
precipitation = data{4};

% Calculate average temperature, mwean of all humidity, and total precipitation
tempAvg = mean(temperature);
humidAvg = mean(humidity);
rainTotal = sum(precipitation);

% Writes summary with the average temperature, mean of the humidity, and total rain to another file called summary.txt
summaryFileID = fopen('weather_summary.txt', 'w');
fprintf(summaryFileID, 'Weather Summary\n');
fprintf(summaryFileID, '---------------\n');
fprintf(summaryFileID, 'Average Temperature: %.2f\n', tempAvg);
fprintf(summaryFileID, 'Average Humiditity: %.2f\n', humidAvg);
fprintf(summaryFileID, 'Total Rain: %.2f\n', rainTotal);

% Close the file
fclose(summaryFileID);

% Display the summary file
type weather_summary.txt;


%Task 4

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

% Save the figure as a png
saveas(gcf, 'solar_system_visualization.png');

%Task 5

%Initializes stock prices for every day.
stockData = {68.27 31.90 210.30 112.50 203.78 298.40 53.20 150.58 20.94 61954.43 49.40 2444.69 217.94 786.37 223.52 742.95 832.09 444.87 196.97 445.60 1.28 7.06 36.88 78.19 11.25 11.26 11.27 11.30 12.30 13.50}

% Creates / Opens .txt file called stockData with write permissions
fileID = fopen('stockData.txt', 'w');
% Assigns 'A' to stockData in a matrix form.
A = cell2mat(stockData)
% Calculates and displays and average of the stock prices
Avg = [mean(A)];
fprintf("Average: %f", Avg);

% Gets the highest and lowest stock price and displays them
highValue = max(A);
lowValue = min(A);
fprintf("High: %f", highValue);
fprintf("Low: %f", lowValue);

% Counts how many days the stock gained, and then displays it
daysUp = sum(diff(A) > 0);
fprintf("Days of Gain: %f", daysUp);

% Creates a new figure
figure;

% Plot daily stock prices with a linewidth of 2
plot(A, '-o', 'LineWidth', 2);

% Keep the current plot active to overlay additional elements
hold on;

% Creates horizontal lines whose y coordinate is the average price, lowest
% price, and highest price.
yline(Avg, '--r', 'LineWidth', 2);
yline(highValue, '--g', 'LineWidth', 2);
yline(lowValue, '--b', 'LineWidth', 2);

% Labels x-axis as "days" and y-axis as "closing price";
% Titles graph "Daily Stock Prices with Average, High, and Low"
% Creates legend for the lines present on the graph with their corresponding names and colors.
xlabel('Days');
ylabel('Closing Price');
title('Daily Stock Prices with Average, High, and Low');
legend('Daily Prices', 'Average Price', 'High Price', 'Low Price');

% Saves figure as a png titled "stock_analysis.png"
saveas(gcf, 'stock_analysis.png');

% Creates and populates a .txt file called "stock_summary.txt" with the
% average, high and low value, and how many days the stock has risen.
fileID = fopen('stock_summary.txt', 'w');
fprintf(fileID, "Stock Data Analysis Summary\n");
fprintf(fileID, "----------------------------\n");
fprintf(fileID, "Average Price: %f\n", Avg);
fprintf(fileID, "Highest Price: %f\n", highValue);
fprintf(fileID, "Lowest Price: %f\n", lowValue);
fprintf(fileID, "Days of Gain: %d\n", daysUp);
fclose(fileID);