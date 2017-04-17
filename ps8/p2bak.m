data = importdata('ps8data/data2');
theta = data(:,1);
time = data(:,2);

m = 7;
tau = 0.15;
j = 0;
k = 2;

embed = zeros(m, round(numel(theta)/1000*m, 0));
index = tau /(time(2) - time(1));

for x=1:round(numel(time)/1000*m,0)
    for i=0:m-1
        %round(time(x) + i*tau, 3)
        round(time(x) + i*tau, 3)
        find(round(time,3)==round(time(x) + i*tau, 3))
        
        %embed(i+1, x) = theta(find(round(time,3)==round(time(x) + i*tau, 3)));
    end
end

plot(mod(embed(k+1,:), 2*pi), mod(embed(j+1,:), 2*pi))

