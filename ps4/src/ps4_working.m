m = 0.1;
l = 0.1;
beta = 0;
alpha = 0;
A = 0;
g = 9.8;

t0 = 0;
h = 0.1;
n = 2000;
x0 = [0.01; 0.0];

%x_prime = @(t, x) t + x + 1;
x_prime = @(t, x) [x(2); (A*cos(alpha*t) - beta*l*x(2) - m*g*sin(x(1)))/(m*l)];
%plot(0)
%hold on
%h = .0009;
output = runge_kutta4(t0, h, n, x0, x_prime);
hold on
%i = 1;
%for th = 0:10:50
 %   output = runge_kutta4(t0, h, n, x0, x_prime);
  %  x(:,:,i) = output;
%end
%plot(x)

%i = 1;
for i = -10:20:10
    for j = -10:20:10
        x0 =[i, j];
        output = runge_kutta4(t0, h, n, x0, x_prime);
        plot(mod(output(1,:), 2*pi), output(2,:),'.','MarkerSize',0.1);
    end
end
for i = -10:20:10
    for j = -30:10:-10
        x0 =[i, j];
        output = runge_kutta4(t0, h, n, x0, x_prime);
        plot(mod(output(1,:), 2*pi), output(2,:),'.','MarkerSize',0.1);
    end
end
for i = -10:20:10
    for j = 10:10:30
        x0 =[i, j];
        output = runge_kutta4(t0, h, n, x0, x_prime);
        plot(mod(output(1,:), 2*pi), output(2,:),'.','MarkerSize',0.1);
    end
end
   %x(1,i) = output(1,i) * x0(1);
   %x(2,i) = output(2,i) * x0(2);
   %i = i + 1;
   
%end
%%plot(x(1,:), x(2,:))
%plot(output(1,:), output(2,:));
%plot(mod(output(1,:),2*pi) , mod(output(2,:),2*pi));

%plot(mod(output(1,:),2*pi))
%plot(mod(output(1,:),2*pi) , output(2,:));
%plot(output(1,:), output(2,:));
%plot(output(1,:), -sin(output(2,:)));
xlim([0,2*pi])
xlabel('theta')
ylabel('omega')
title('State-Space Portrait Prob 7a, A = 0 \alpha =0, \beta = 0, timestep = 0.6')
hold off
%savefig('4a.png')
%plot(output(1,:))
%hold on 
%plot (output(2,:))
%hold off





