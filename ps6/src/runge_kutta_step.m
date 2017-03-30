function test_step = runge_kutta_step( t, h, x, x_prime )
% A simple implementation of 4th order Runge-Kutta ODE solver

        k1 = h * x_prime(t, x);
        k2 = h * x_prime(t + (h/2), x + (1/2) * k1);
        k3 = h * x_prime(t + (h/2), x + (1/2) * k2);
        k4 = h * x_prime(t + h, x + k3);
        test_step = x + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
  

    
   

end

