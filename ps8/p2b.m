data = importdata('ps8data/data3');
theta = data(:,1);
time = data(:,2);

m = 7;
tau = 0.01;
j = 0;
k = 5;

index = tau /(time(2) - time(1));
embed = zeros(m, round(numel(theta)/m,0));


for x=1:numel(theta)
    if (x + m * index) >= numel(theta)
        break
    end
    for i=0:m-1
        embed(i+1, x) = theta(x + i*index);
    end
end

plot(mod(embed(k+1,:), 2*pi), mod(embed(j+1,:), 2*pi),'k.','MarkerSize', 1)
xlim([0 2*pi]);
ylim([0 2*pi]);
title('Reconstructed State Space \tau=0.05, m=7');
ylabel('\theta(t)');
xlabel('\theta(t + 0.3)');
