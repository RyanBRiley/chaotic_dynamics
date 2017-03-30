




prob2a()




function prob2a()
	t0 = 0;
	h = 0.005;
	n = 2000;
	x0 = [-13; -12; 52];

	a = 16;
	r = 45;
	b = 4;

	err_thresh = 0.01;
	
	lorenz =  @(t, x) [a*(x(2) - x(1)); r*x(1) - x(2) - x(1) * x(3); (x(1) * x(2)) - b * x(3)]
	output = adapt_runge_kutta4(t0, h, n, x0, lorenz, err_thresh);

	%plot3(output(1,:), output(3,:) , 'k', 'LineWidth',.001)
	plot3(output(1,:), output(2,:), output(3,:))
    title('Lorenz Attractor x-z plane')
	xlabel('x')
	ylabel('z')

end

function prob2b()
	t0 = 0;
	h = 0.001;
	n = 10000;
	x0 = [-13; -12; 52];

	a = 16;
	r = 45;
	b = 4;

	err_thresh = 0.001;
	
	lorenz =  @(t, x) [a*(x(2) - x(1)); r*x(1) - x(2) - x(1) * x(3); (x(1) * x(2)) - b * x(3)]
	output = adapt_runge_kutta4(t0, h, n, x0, lorenz, err_thresh);
	output2 = runge_kutta4(t0, h, n, x0, lorenz);

	hold on
	p1 = plot(output(1,:), output(3,:) , 'k', 'LineWidth',.001);
	p2 = plot(output2(1,:), output2(3,:) , 'r', 'LineWidth',.001);
    %plot(output2(1,:), output2(3,:), 'r.','MarkerSize',0.1)
	title('Lorenz Attractor x-z plane')
	xlabel('x')
	ylabel('z')
    legend([p1 p2],'adaptive RK4', 'simple RK4')
	hold off

end

function prob2c()
	t0 = 0;
	h = 0.005;
	n = 2000;
	%x0 = [-13; -12; 52];
    x0 = [150; -.9; 1600];
    

	a = 16;
	r = 13.6;
	b = 4;

	err_thresh = 0.01;
	
	lorenz =  @(t, x) [a*(x(2) - x(1)); r*x(1) - x(2) - x(1) * x(3); (x(1) * x(2)) - b * x(3)]
	output = adapt_runge_kutta4(t0, h, n, x0, lorenz, err_thresh);

	plot(output(1,:), output(3,:) , 'k', 'LineWidth',.001)
	title('Lorenz Attractor x-z plane')
	xlabel('x')
	ylabel('z')

end

function prob3()
	t0 = 0;
	h = 0.005;
	n = 5000;
	x0 = [-13; -12; 52];

	a = 0.398;
	b = 2;
	c = 4;

	err_thresh = 0.01;
	
	rossler = @(t, x) [-(x(2) + x(3)); x(1) + a*x(2); b + x(3)*(x(1) - c)]
	output = adapt_runge_kutta4(t0, h, n, x0, rossler, err_thresh);

	plot(output(1,:), output(3,:) , 'k', 'LineWidth',.001)
	title('Rossler Attractor x-z plane')
	xlabel('x')
	ylabel('z')

end

function prob4()
	t0 = 0;
	h = 0.005;
	n = 2000;
	x0 = [-13; -12; 52];

	a = 16;
	r = 45;
	b = 4;

	err_thresh = .1;
	
	lorenz =  @(t, x) [a*(x(2) - x(1)); r*x(1) - x(2) - x(1) * x(3); (x(1) * x(2)) - b * x(3)]
	output = adapt_runge_kutta4(t0, h, n, x0, lorenz, err_thresh);

	plot(output(1,:), output(3,:) , 'k', 'LineWidth',.001)
    str = sprintf('Lorenz Attractor x-z plane, error threshold = %.3f', err_thresh)
	title(str)
	xlabel('x')
	ylabel('z')

end


