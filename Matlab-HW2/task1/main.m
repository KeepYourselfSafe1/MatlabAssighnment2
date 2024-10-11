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