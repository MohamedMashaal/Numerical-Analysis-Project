function [root, i, percision, time]  = FPI(f, initialGuess, desiredPrecision, maxIterations, mode)
    %mode 1 for quick, 0 for step
    syms g(x)
    g(x) = f + x;
    disp(g);
    xold = initialGuess;
    onlyOneIteration = 1;
    itrNum = 0;
    while (1) && (onlyOneIteration)
        if (strcmp(mode, 'Step') ~= 0)
            onlyOneIteration = 0;
        end
            
        itrNum = itrNum + 1;
        xnew = subs(g,xold);
        error = abs((xnew - xold)/xnew) * 100;
        
        s = sprintf ('i=%d   x=%f   e=%f',i,xold,error);
        disp(s);
        
        if (error > desiredPrecision) && (itrNum < maxIterations)
            xold = xnew;
        else 
           root = xnew;
           break;        
        end
        i = itrNum;
        percision = error;
    end
end