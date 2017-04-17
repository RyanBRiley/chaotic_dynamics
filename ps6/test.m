x = 0:10;
y = sin(x);
xi = 2*pi;
yi = interp1(x,y,xi)
plot(2*pi,yi)
%plot(x, y)