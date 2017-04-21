data = importdata('ps8data/data3');
theta = data(:,1);
time = data(:,2);

m = 7;

j = 0;
k = 5;


%title('Reconstructed State Space \tau=0.05, m=7');
subplot(2,3,1);
tau = 0.01;
index = tau/(time(2)-time(1));
embed1 = zeros(m, numel(theta)-m*index);
embed1 = embedding(m, tau, time, theta);
plot(mod(embed1(k+1,:), 2*pi), mod(embed1(j+1,:), 2*pi),'k.','MarkerSize', 1)
xlim([0 2*pi]);
ylim([0 2*pi]);
tstr = sprintf('\\tau=%0.2f',tau);
title(tstr);
ylabel('\theta(t)');
xstr = sprintf('\\theta(t + %0.2f)', tau*k);
xlabel(xstr);


subplot(2,3,2);
tau = 0.15;
index = tau/(time(2)-time(1));
embed2 = zeros(m, numel(theta)-m*index);
embed2 = embedding(m, tau, time, theta);
plot(mod(embed2(k+1,:), 2*pi), mod(embed2(j+1,:), 2*pi),'k.','MarkerSize', 1)
xlim([0 2*pi]);
ylim([0 2*pi]);
tstr = sprintf('\\tau=%0.2f',tau);
title(tstr);
ylabel('\theta(t)');
xstr = sprintf('\\theta(t + %0.2f)', tau*k);
xlabel(xstr);

subplot(2,3,3);
tau = 0.5;
index = tau/(time(2)-time(1));
embed3 = zeros(m, numel(theta)-m*index);
embed3 = embedding(m, tau, time, theta);
plot(mod(embed3(k+1,:), 2*pi), mod(embed3(j+1,:), 2*pi),'k.','MarkerSize', 1)
xlim([0 2*pi]);
ylim([0 2*pi]);
tstr = sprintf('\\tau=%0.2f',tau);
title(tstr);
ylabel('\theta(t)');
xstr = sprintf('\\theta(t + %0.2f)', tau*k);
xlabel(xstr);

subplot(2,3,4);
tau = 1.0;
index = tau/(time(2)-time(1));
embed4 = zeros(m, numel(theta)-m*index);
embed4 = embedding(m, tau, time, theta);
plot(mod(embed4(k+1,:), 2*pi), mod(embed4(j+1,:), 2*pi),'k.','MarkerSize', 1)
xlim([0 2*pi]);
ylim([0 2*pi]);
tstr = sprintf('\\tau=%0.2f',tau);
title(tstr);
ylabel('\theta(t)');
xstr = sprintf('\\theta(t + %0.2f)', tau*k);
xlabel(xstr);

subplot(2,3,5);
tau = 1.25;
index = tau/(time(2)-time(1));
embed5 = zeros(m, numel(theta)-m*index);
embed5 = embedding(m, tau, time, theta);
plot(mod(embed5(k+1,:), 2*pi), mod(embed5(j+1,:), 2*pi),'k.','MarkerSize', 1)
xlim([0 2*pi]);
ylim([0 2*pi]);
tstr = sprintf('\\tau=%0.2f',tau);
title(tstr);
ylabel('\theta(t)');
xstr = sprintf('\\theta(t + %0.2f)', tau*k);
xlabel(xstr);


subplot(2,3,6);
tau = 1.5;
index = tau/(time(2)-time(1));
embed6 = zeros(m, numel(theta)-m*index);
embed6 = embedding(m, tau, time, theta);
plot(mod(embed6(k+1,:), 2*pi), mod(embed6(j+1,:), 2*pi),'k.','MarkerSize', 1)
xlim([0 2*pi]);
ylim([0 2*pi]);
tstr = sprintf('\\tau=%0.2f',tau);
title(tstr);
ylabel('\theta(t)');
xstr = sprintf('\\theta(t + %0.2f)', tau*k);
xlabel(xstr);

