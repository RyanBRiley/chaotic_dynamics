function output = eqs_of_motion(x)
    x
    m1 = 0.5;
    m2 = 0.5;
    G = 1;
    
    output(1) = x(3);
    output(2) = x(4);
    output(3) = x(5);
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