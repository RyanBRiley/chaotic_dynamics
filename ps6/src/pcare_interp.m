function pcare_interp( temporal_matrix, x, t0, plot_title)
    figure
    hold on;
    mult = 1;
    for i = 1:numel(temporal_matrix)
        if temporal_matrix(i) >= mult*t0 && i > 1 
            t_ref = [temporal_matrix(i-1), temporal_matrix(i)];
            theta_ref = [x(1, i-1), x(1,i)];
            omega_ref = [x(2, i-1), x(2, i)];
            iomega = interp1(t_ref, omega_ref, mult*t0);
            itheta = interp1(t_ref, theta_ref, mult*t0);
            plot(mod(itheta, 2*pi), iomega, '.');
            mult = mult + 1;
        end
    end
    xlabel('theta')
    ylabel('omega')
    title(plot_title)
end
