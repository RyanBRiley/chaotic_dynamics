function output = runge_kutta4( t0, h, n, x0, x_prime )
% A simple implementation of 4th order Runge-Kutta ODE solver
    
    output(:,1) = x0;
    t = t0; 
    output
    %theta = zeros(n);
    %omega = zeros(n);
    for i = 1:n
        %k1 = h * x_prime(output(:,i));
        %k2 = h * x_prime(output(:,i) + (1/2) * k1);
        %k3 = h * x_prime(output(:,i) + (1/2) * k2);
        %k4 = h * x_prime(output(:,i) + k3);
        %output(:,i+1) = output(:,i) + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
       % t = t + h;

    end
    %plot(theta, omega)

end

