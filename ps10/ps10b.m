data = importdata('chaotic_data');
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
for epsilon=logspace(3, -3, 100)
    N_cur = length(uniquetol(data, epsilon, 'ByRows',true,'DataScale',1))
    N = [N log(N_cur)];
    inv_eps = [inv_eps log(1/epsilon)];
end
plt = plot(inv_eps, N)
xticks([-8:1:8]);
title('log(N(\epsilon)) vs log(1/\epsilon) using matrix box method');
%set(plt, 'XTick', [-8:1:8]);
%axis([-8 8 1 10])
xlabel('log(1/\epsilon)');
ylabel('log(N(\epsilon))');