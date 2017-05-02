function ps12()
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