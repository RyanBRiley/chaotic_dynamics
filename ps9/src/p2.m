data = importdata('chaotic_data');
time = data(:,1);
x = data(:,2:end);
lambda = wolf(x, time, 1, 0.03);
