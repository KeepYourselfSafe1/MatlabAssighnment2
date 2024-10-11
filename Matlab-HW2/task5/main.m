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