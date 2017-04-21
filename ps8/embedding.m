function output = embedding(m, tau,  time, theta)
    index = tau /(time(2) - time(1));
    output = zeros(m, round(numel(theta)/m,0));



    for x=1:numel(theta)
        if (x + m * index) >= numel(theta)
            break
        end
        for i=0:m-1
            output(i+1, x) = theta(x + i*index);
        end
    end
end