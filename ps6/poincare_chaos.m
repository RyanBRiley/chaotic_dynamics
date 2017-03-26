m = 0.1;
l = 0.1;
beta = 0.25;
alpha = 7.425;
A = 1.1;
g = 9.8;

t0 = 0.8463;
h = 0.005;
n = 100000;
x0 = [0.01; 0];

%x_prime = @(t, x) t + x + 1;
x_prime = @(t, x) [x(2); (A*cos(alpha*t) - beta*l*x(2) - m*g*sin(x(1)))/(m*l)];
output = runge_kutta4( t0, h, n, x0, x_prime);


function output = runge_kutta4( t0, h, n, x0, x_prime )
% A simple implementation of 4th order Runge-Kutta ODE solver
    temporal_matrix = zeros(1, n);
    output(:,1) = x0;
    t = t0; 
    %theta = zeros(n);
    %omega = zeros(n);
    for i = 1:n
        temporal_matrix(i) = t;
        k1 = h * x_prime(t, output(:,i));
        k2 = h * x_prime(t + (h/2), output(:,i) + (1/2) * k1);
        k3 = h * x_prime(t + (h/2), output(:,i) + (1/2) * k2);
        k4 = h * x_prime(t + h, output(:,i) + k3);
        output(:,i+1) = output(:,i) + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
        t = t + h;
    end
    pcare(temporal_matrix, output, t0);
    %plot(theta, omega)

end

function pcare( temporal_matrix, x, t0)
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
    title('Temporal Poincare A=1.1, alpha=7.425, beta=0.25, Tau=0.8463')
end

            
            