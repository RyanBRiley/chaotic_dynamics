function [time, output] = runge_kutta4( t0, h, n, x0, x_prime )
% A simple implementation of 4th order Runge-Kutta ODE solver

    output(:,1) = x0;
    t = t0;
    time = t0;
    %theta = zeros(n);
    %omega = zeros(n);
    for i = 1:n
        k1 = h * x_prime(t, output(:,i));
        k2 = h * x_prime(t + (h/2), output(:,i) + (1/2) * k1);
        k3 = h * x_prime(t + (h/2), output(:,i) + (1/2) * k2);
        k4 = h * x_prime(t + h, output(:,i) + k3);
        output(:,i+1) = output(:,i) + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
        t = t + h;
        time = [time t];

    end
    %plot(theta, omega)

end

