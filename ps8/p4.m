data = dlmread('first250outdata',' ',1, 0)
%data(1,2:end)
hold on;
plot(data(:,1), data(:,2),'k');
title('Tisean output of Mutual on data2');
xlabel('\tau');
plot(data(156,1), data(156,2),'b*','MarkerSize',10)
one = data(156,1)
two = data(156,2)
hold off