time_step_multiple = 1;

m = 0.1;
l = 0.1;
beta = 0;
alpha = 0;
A = 0;
g = 9.8;

%t0 = 0.7;
t0 = (2*pi)/(sqrt(g/l));
h = 0.005 * time_step_multiple;
%n = 100000;
n = round((100000 / time_step_multiple), 0);
x0 = [0.01; 0];

x_prime = @(t, x) [x(2); (A*cos(alpha*t) - beta*l*x(2) - m*g*sin(x(1)))/(m*l)];
output = runge_kutta4( t0, h, n, x0, x_prime);


function output = runge_kutta4( t0, h, n, x0, x_prime )
% A simple implementation of 4th order Runge-Kutta ODE solver
    temporal_matrix = zeros(1, n);
    output(:,1) = x0;
    t = t0; 
    for i = 1:n
        temporal_matrix(i) = t;
        k1 = h * x_prime(t, output(:,i));
        k2 = h * x_prime(t + (h/2), output(:,i) + (1/2) * k1);
        k3 = h * x_prime(t + (h/2), output(:,i) + (1/2) * k2);
        k4 = h * x_prime(t + h, output(:,i) + k3);
        output(:,i+1) = output(:,i) + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
        t = t + h;
    end
    plot_title = sprintf('Temporal Poincare T=%.3f',t0);
    pcare(temporal_matrix, output, t0, plot_title);
end



            
            