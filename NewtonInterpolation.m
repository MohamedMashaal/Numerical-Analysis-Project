function [poly, result] = NewtonInterpolation(order, points, x, y)
    if(length(x) ~= length(y))
       fprintf(1,'\nERROR!\n X and F(x) must have the same number of elements\n');
       poly = 0;
       result = NaN; 
    end
    n = length(x);
    b = zeros(n, n+1);
    
    for i = 1 : n
        b(i, 1) = x(i);
        b(i, 2) = y(i);
    end
    
    for j = 3 : n+1
        for i = j-1 : n
           b(i,j) = (b(i,j-1) - b(i-1,j-1)) / (b(i,1) - b(i-j+2,1))
        end
    end
    
    disp(b);

end