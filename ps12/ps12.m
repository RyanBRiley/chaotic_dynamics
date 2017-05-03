t0 = 0;
h = (2*pi)/2000;
n = 12000;
x0 = [0 0 0 0 0 0 1 0 0 0 1 0];
iC = x0;
x_prime = @eqs_of_motion;

output = iC;
hold on
plot(iC(7),iC(9),'k.');
plot(iC(1),iC(3),'b.');

for i=1:n
    %iC(1)   
    iC = [runge_kutta_step(h, iC, x_prime)];
    p2 = plot(iC(7),iC(8),'k.');
    p1 = plot(iC(1),iC(2),'b.');
    %iC(4)
end
ylabel('y units');
xlabel('x units');
title('Plot of Binary Stars');
legend([p1 p2],'Star 1 (initially stationary)', 'Star 2')
hold off



function test_step = runge_kutta_step(h, x, x_prime )
% A simple implementation of 4th order Runge-Kutta ODE solver

        k1 = h * x_prime(x);
        k2 = h * x_prime(x + (1/2) * k1);
        k3 = h * x_prime(x + (1/2) * k2);
        k4 = h * x_prime(x + k3);
        test_step = x + (1/6) * (k1 + 2*k2 + 2*k3 + k4);

end

function output = eqs_of_motion(x)
    m1 = 0.5;
    m2 = 0.5;
    G = 1;
    
    output(1) = x(4);
    output(2) = x(5);
    output(3) = x(6);
    output(4) = -G * m2 * ((x(1) - x(7))/((x(1) - x(7))^2 + (x(2) - x(8))^2 + (x(3) - x(9))^2)^(3/2));
    output(5) = -G * m2 * ((x(2) - x(8))/((x(1) - x(7))^2 + (x(2) - x(8))^2 + (x(3) - x(9))^2)^(3/2)); 
    output(6) = -G * m2 * ((x(3) - x(9))/((x(1) - x(7))^2 + (x(2) - x(8))^2 + (x(3) - x(9))^2)^(3/2)); 
    output(7) = x(10);
    output(8) = x(11);
    output(9) = x(12);
    output(10) = -G * m1 * ((x(7) - x(1))/((x(7) - x(1))^2 + (x(8) - x(2))^2 + (x(9) - x(3))^2)^(3/2));
    output(11) = -G * m1 * ((x(8) - x(2))/((x(7) - x(1))^2 + (x(8) - x(2))^2 + (x(9) - x(3))^2)^(3/2)); 
    output(12) = -G * m1 * ((x(9) - x(3))/((x(7) - x(1))^2 + (x(8) - x(2))^2 + (x(9) - x(3))^2)^(3/2));
    
end

