data = importdata('chaotic_data_long');
time = data(:,1);
x = data(:,2:end);
    
%epsilon = .1;
%traj_size = round(max(max(x))) - round(min(min(x))) + 1;
if min(min(x)) < 0
    offset = abs(min(min(x))) + 1;
else
    offset = 1;
end

N = [];
inv_eps = [];
for epsilon=[100, 10, 1, 0.1]

    linear_quantity_x = round((max(x(:,1)) - min(x(:,1)) + 1)/epsilon);
    linear_quantity_y = round((max(x(:,2)) - min(x(:,2)) + 1)/epsilon);
    linear_quantity_z = round((max(x(:,3)) - min(x(:,3)) + 1)/epsilon);
    count_matrix = zeros(linear_quantity_x, linear_quantity_y, linear_quantity_z);


    for i =1:length(x)
        %round((x(i,1)+offset)/epsilon)+1
        %round((x(i,2)+offset)/epsilon)+1
        %round((x(i,3)+offset)/epsilon)+1
        count_matrix(round((x(i,1)+offset)/epsilon)+1,round((x(i,2)+offset)/epsilon)+1,round((x(i,3)+offset)/epsilon)+1) = 1;
    end

    N_cur= nnz(count_matrix);
    N = [N log2(N_cur)];
    inv_eps = [inv_eps log2(1/epsilon)];
end
plot(inv_eps, N)
title('Extended trajectory fractal dimension using matrix box method');
xlabel('log2(1/\epsilon)');
ylabel('log2(N(\epsilon))');

