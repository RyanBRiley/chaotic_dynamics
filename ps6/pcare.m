function pcare( temporal_matrix, x, t0, plot_title)
    figure
    hold on;
    mult = 1;
    for i = 1:numel(temporal_matrix)
        if temporal_matrix(i) >= mult*t0
            mult = mult + 1;
            plot(mod(x(1,i),2*pi), x(2,i),'.');
        end
    end
    xlabel('theta')
    ylabel('omega')
    title(plot_title)
end