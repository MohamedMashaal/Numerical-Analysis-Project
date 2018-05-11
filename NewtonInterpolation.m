function [poly, result, time] = NewtonInterpolation(order, points, xs, ys)
    time = cputime;
    if(length(xs) ~= length(ys))
       fprintf(1,'\nERROR!\n X and F(x) must have the same number of elements\n');
       poly = 0;
       result = NaN; 
    end
    result = [];
    n = length(xs);
    b = zeros(n, n+1);
    
    for i = 1 : n
        b(i, 1) = xs(i);
        b(i, 2) = ys(i);
    end
    
    for j = 3 : n+1
        for i = j-1 : n
           b(i,j) = (b(i,j-1) - b(i-1,j-1)) / (b(i,1) - b(i-j+2,1))
        end
    end
    
    % getting the polynomial function
    syms f(x);
    f(x) = b(1,2);
    
    for i = 2 : n
        syms w(x);
        w = b(i, i+1);
        for j = 1 : i-1
            w = w * (x - xs(j));
        end
        f = f + w;
    end
    
    for i = 1 : length(points)
       result(i) = f(points(i)); 
    end
    
    poly = f;
    time = cputime - time;

end