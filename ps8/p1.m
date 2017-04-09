data = importdata('ps8data/data1');
theta = data(:,1);
t = data(:,2);
srate = 100;
omega = zeros(1, numel(theta));

for i=1:srate:numel(theta)-srate
    omega(i) = (theta(i+srate)-theta(i))/(t(i+srate)-t(i));
end

plot(mod(theta(1:srate:numel(theta)-srate), 2*pi), omega(1:srate:numel(omega)-srate) )
xlabel('theta');
ylabel('omega');
title('Plot of Omega vs Theta, sampling rate of 1/100');