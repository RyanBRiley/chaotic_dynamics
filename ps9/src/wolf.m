function lambda = wolf(x, time, t0, epsilon)
    x = x(
    z = [];
    L =[];
    L_prime = [];
    ni = n_neighbor(x, 1);
    L0 = norm(x(ni) - x(t0));
    %L = [L L0];
    for i=1:length(x)
        for j=i:length(x)
            if norm(x(ni+j)-x(j)) > epsilon 
                L = [L L0];
                L0 = norm(x(ni+j)-x(j));
                L_prime = [L_prime L0];
                ni = n_neighbor(x, j);
                break
            end
            if j >= length(x)
                break
            end
        end
    end
    time(j)
    time(t0)
    lambda = sum(log2(L_prime./L))/(time(j)-time(t0));
end