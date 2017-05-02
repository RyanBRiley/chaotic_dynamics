prob1a()


function prob1a()
	t0 = 0;
	h = 0.001;
	n = 100000;
	x0 = [-13; -12; 52];

	a = 16;
	r = 45;
	b = 4;
	
	lorenz =  @(t, x) [a*(x(2) - x(1)); r*x(1) - x(2) - x(1) * x(3); (x(1) * x(2)) - b * x(3)];
	[time, output] = runge_kutta4(t0, h, n, x0, lorenz);
    output = [time; output];
    dlmwrite('../../ps10/chaotic_data_long', output', 'delimiter', '\t');
	%plot3(output(1,:), output(3,:) , 'k', 'LineWidth',.001)
	plot(output(2,:), output(4,:))
    title('Lorenz Attractor x-z plane')
	xlabel('x')
	ylabel('z')

end

function prob1b()
	t0 = 0;
	h = 0.001;
	n = 15000;
	x0 = [-13; -12; 52];

	a = 16;
	r = 15;
	b = 4;
	
	lorenz =  @(t, x) [a*(x(2) - x(1)); r*x(1) - x(2) - x(1) * x(3); (x(1) * x(2)) - b * x(3)];
	[time, output] = runge_kutta4(t0, h, n, x0, lorenz);
    output = [time; output];
    dlmwrite('non_chaotic_data', output', 'delimiter', '\t');

	%plot3(output(1,:), output(3,:) , 'k', 'LineWidth',.001)
	plot(output(2,:), output(4,:))
    title('Lorenz Attractor x-z plane')
	xlabel('x')
	ylabel('z')

end


function prob4a()
	t0 = 0;
	h = 0.001;
	n = 10000;
	x0 = [-13; -12; 52];

	a = 16;
	r = 45;
	b = 4;
	
	lorenz =  @(t, x) [a*(x(2) - x(1)); r*x(1) - x(2) - x(1) * x(3); (x(1) * x(2)) - b * x(3)];
	output = runge_kutta4(t0, h, n, x0, lorenz);
    eig(output)
    
	%plot3(output(1,:), output(3,:) , 'k', 'LineWidth',.001)


end

