data = importdata('embeddim')
%data(1,2:end)
hold on
plot(data(:,1), data(:,2),'k.');
for i=1:11
    if data(i,2) < 0.1
        break
    end
end

title('Percentage of False Neighbors vs Embedding Dimension \tau = 0.15');
xlabel('dimension');
ylabel('percent false neighbors');
plot(data(i,1), data(i,2), 'k*', 'MarkerSize', 10); 