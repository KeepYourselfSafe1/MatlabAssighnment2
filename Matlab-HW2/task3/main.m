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