h = 0.001;
n = 100;
t0 = 0;
A = [0 1 2 1 0 0 0 1 0 0 0 1];
%B = [10 -5 2 1 0 0 0 1 0 0 0 1];
%C = [0 -1 2 1 0 0 0 1 0 0 0 1];
iC = A;
x_prime = @lorenz;

output = iC;
for i=1:n
    iC = runge_kutta_step(h, iC, x_prime);
end

iC
res = reshape(iC(4:12),[3,3])
sum(res(:,1))
sum(res(:,2))
sum(res(:,3))

function output = lorenz(x)
    a = 16;
    r = 45;
    b = 4;
    DxF = [-a, a, 0; (r-x(3)), -1, -x(1); x(2), x(1), -b];
    V = reshape(x(4:12), [3,3]);
    DxFV = DxF * V;
    output(1) = a*(x(2) - x(1));
    output(2) = r*x(1) - x(2) - x(1) * x(3);
    output(3) = (x(1) * x(2)) - b * x(3);
    output(4:12) = reshape(DxFV, [9, 1]);  
end



function test_step = runge_kutta_step(h, x, x_prime )
% A simple implementation of 4th order Runge-Kutta ODE solver

        k1 = h * x_prime(x);
        k2 = h * x_prime(x + (1/2) * k1);
        k3 = h * x_prime(x + (1/2) * k2);
        k4 = h * x_prime(x + k3);
        test_step = x + (1/6) * (k1 + 2*k2 + 2*k3 + k4);

end

