t0 = 0;
h = (2*pi)/2000;
n = 12000;
x0 = [0 0 0 0 0 0 1 0 0 0 1 0 0 20 0 0 -0.15 0];
iC = x0;
x_prime = @eqs_of_motion;
output = iC;
hold on
plot(iC(7),iC(9),'k.', 'MarkerSize', 0.5);
plot(iC(1),iC(3),'b.', 'MarkerSize', 0.5);
plot(iC(13),iC(14),'r.', 'MarkerSize', 0.5);

for i=1:n
    %iC(1)   
    iC = [runge_kutta_step(h, iC, x_prime)];
    p2 = plot(iC(7),iC(8),'k.', 'MarkerSize', 0.5);
    p1 = plot(iC(1),iC(2),'b.', 'MarkerSize', 0.5);
    p3 = plot(iC(13),iC(14),'r.', 'MarkerSize', 0.5);
    %iC(4)
end
ylabel('y units');
xlabel('x units');
title('Three Body Plot');
legend([p1 p2 p3],'Star 1 (initially stationary)', 'Star 2', 'Star 3')
hold off



function test_step = runge_kutta_step(h, x, x_prime )
% A simple implementation of 4th order Runge-Kutta ODE solver
     
        k1 = h * x_prime(x);
        k2 = h * x_prime(x + (1/2) * k1);
        k3 = h * x_prime(x + (1/2) * k2);
        k4 = h * x_prime(x + k3);
        test_step = x + (1/6) * (k1 + 2*k2 + 2*k3 + k4);

end

% function output = adapt_runge_kutta4(t0, h, n, x0, x_prime, err_thresh)
%     output(:,1) = x0;
%     t = t0;
%     delta = h;
%     err_flag = 1;
%     for i = 1:n
%         x = output(:,i);
%         while err_flag
%             full_step = runge_kutta_step(2*delta, x, x_prime);
%             first_half_step = runge_kutta_step(delta, x, x_prime);
%             second_half_step = runge_kutta_step(delta, first_half_step, x_prime);
%             %err = abs(second_small_step - big_step);
%             second_half_step - full_step;
%             %if(norm(second_half_step - full_step, inf) <= err_thresh)
%             if(norm(second_half_step - full_step, inf) <= err_thresh)
%                 delta = delta * 2;
%                 break;
%             else
%                 delta = delta/2;
%             end
%         end
%         output(:,i+1) = second_half_step;
%         t = t + delta;
%     end
% end
%             
            

function output = eqs_of_motion(x)
    m1 = 0.5;
    m2 = 0.5;
    m3 = 0.5;
    G = 1;
    
    
  
    output(1) = x(4);
    output(2) = x(5);
    output(3) = x(6);
    output(4) = -G * ((m2 * ((x(1) - x(7))/((x(1) - x(7))^2 + (x(2) - x(8))^2 + (x(3) - x(9))^2)^(3/2))) ...
        + (m3 * ((x(1) - x(13))/((x(1) - x(13))^2 + (x(2) - x(14))^2 + (x(3) - x(15))^2)^(3/2)))); 
    
    output(5) = -G * ((m2 * ((x(2) - x(8))/((x(1) - x(7))^2 + (x(2) - x(8))^2 + (x(3) - x(9))^2)^(3/2))) ...
        + (m3 * ((x(2) - x(14))/((x(1) - x(13))^2 + (x(2) - x(14))^2 + (x(3) - x(15))^2)^(3/2)))); 
    
    output(6) = -G * ((m2 * ((x(3) - x(9))/((x(1) - x(7))^2 + (x(2) - x(8))^2 + (x(3) - x(9))^2)^(3/2))) ...
        + (m3 * ((x(3) - x(15))/((x(1) - x(13))^2 + (x(2) - x(14))^2 + (x(3) - x(15))^2)^(3/2))));  
    
    output(7) = x(10);
    output(8) = x(11);
    output(9) = x(12);
    output(10) = -G * ((m1 * ((x(7) - x(1))/((x(7) - x(1))^2 + (x(8) - x(2))^2 + (x(9) - x(3))^2)^(3/2))) ...
        + (m3 * ((x(7) - x(13))/((x(7) - x(13))^2 + (x(8) - x(14))^2 + (x(9) - x(15))^2)^(3/2)))); 
    
    output(11) = -G * ((m1 * ((x(8) - x(2))/((x(7) - x(1))^2 + (x(8) - x(2))^2 + (x(9) - x(3))^2)^(3/2))) ...
        + (m3 * ((x(8) - x(14))/((x(7) - x(13))^2 + (x(8) - x(14))^2 + (x(9) - x(15))^2)^(3/2)))); 
    
    output(12) = -G * ((m1 * ((x(9) - x(3))/((x(7) - x(1))^2 + (x(8) - x(2))^2 + (x(9) - x(3))^2)^(3/2))) ...
        + (m3 * ((x(9) - x(15))/((x(7) - x(13))^2 + (x(8) - x(14))^2 + (x(9) - x(15))^2)^(3/2))));  
    
    output(13) = x(16);
    output(14) = x(17);
    output(15) = x(18);
    output(16) = -G * ((m1 * ((x(13) - x(1))/((x(13) - x(1))^2 + (x(14) - x(2))^2 + (x(15) - x(3))^2)^(3/2))) ...
        + (m2 * ((x(13) - x(7))/((x(13) - x(7))^2 + (x(14) - x(8))^2 + (x(15) - x(9))^2)^(3/2)))); 
    
    output(17) = -G * ((m1 * ((x(14) - x(2))/((x(13) - x(1))^2 + (x(14) - x(2))^2 + (x(15) - x(3))^2)^(3/2))) ...
        + (m2 * ((x(14) - x(8))/((x(13) - x(7))^2 + (x(14) - x(8))^2 + (x(15) - x(9))^2)^(3/2)))); 
    
    output(18) = -G * ((m1 * ((x(15) - x(3))/((x(13) - x(1))^2 + (x(14) - x(2))^2 + (x(15) - x(3))^2)^(3/2))) ...
        + (m2 * ((x(15) - x(9))/((x(13) - x(7))^2 + (x(14) - x(8))^2 + (x(15) - x(9))^2)^(3/2))));  
    
end

