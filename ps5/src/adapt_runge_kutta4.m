function output = adapt_runge_kutta4(t0, h, n, x0, x_prime, err_thresh)
    output(:,1) = x0;
    t = t0;
    delta = h;
    err_flag = 1;
    for i = 1:n
        x = output(:,i);
        while err_flag
            full_step = runge_kutta_step(t, 2*delta, x, x_prime);
            first_half_step = runge_kutta_step(t, delta, x, x_prime);
            second_half_step = runge_kutta_step(t, delta, first_half_step, x_prime);
            %err = abs(second_small_step - big_step);
            second_half_step - full_step;
            %if(norm(second_half_step - full_step, inf) <= err_thresh)
            if(norm(second_half_step - full_step, inf) <= err_thresh)
                delta = delta * 2;
                break;
            else
                delta = delta/2;
            end
        end
        output(:,i+1) = second_half_step;
        t = t + delta;
    end
end
            