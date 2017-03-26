m = 0.1;
l = 0.1;
beta = 0;
alpha = 0;
A = 0;
g = 9.8;

t0 = 0;
h = 0.005;
n = 10000;
x0 = [0.01; 0];


%x_prime = @(t, x) t + x + 1;
x_prime = @(t, x) [x(2); (A*cos(alpha*t) - beta*l*x(2) - m*g*sin(x(1)))/(m*l)];
%plot(0)
%hold on
%h = .0009;
%output = runge_kutta4(t0, h, n, x0, x_prime);
i = 1;
for th = 1:1:50
    output(:, :, th) = runge_kutta4(t0, h, n, x0, x_prime);
    x(:,th) = output(:,:,th) * x0;
    %x(1, th) = 
    %x(th, :) = output(1,:) * x0(1);
    %y(th, :) = output(2,:) * x0(2);
    %size(output(1,:))
end
output(1,:);
%plot(x, y)

%i = 1;
%for h = .001:.001:.1
    %output = runge_kutta4(t0, h, n, x0, x_prime);
    %x(1,i) = output(1,i) * x0(1);
    %x(2,i) = output(2,i) * x0(2);
    %i = i + 1;
   
%end
plot(x(1,:), x(2,:))
%plot(output(1,:), output(2,:));
%plot(mod(output(1,:),2*pi) , mod(output(2,:),2*pi));

%plot(mod(output(1,:),2*pi))
%plot(mod(output(1,:),2*pi) , output(2,:));
%plot(output(1,:), output(2,:));
%plot(output(1,:), -sin(output(2,:)));
xlabel('theta')
ylabel('omega')
title('State-space trajectory emanating from [0.01,0]')
hold off
%savefig('4a.png')
%plot(output(1,:))
%hold on 
%plot (output(2,:))
%hold off





