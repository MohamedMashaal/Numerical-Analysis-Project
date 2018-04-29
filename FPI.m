function root = FPI(f, initialGuess, desiredPrecision, maxIterations)
    syms g(x)
    g(x) = f + x;
    xold = initialGuess;
    i = 0;
    while (1)
        i = i + 1;
        xnew = double(subs(g,xold));
        error = abs((xnew - xold)/xnew) * 100;
        
        s = sprintf ('i=%d   x=%f   e=%f',i,xold,error);
        disp(s);
        
        if (error > desiredPrecision) && (i < maxIterations)
            xold = xnew;
        else 
           root = xnew;
           break;        
        end
    end
end