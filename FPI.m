function [root, i, percision, time]  = FPI(f, itrNum, initialGuess, desiredPrecision, maxIterations, mode, table)
    %mode 1 for quick, 0 for step
    
    syms g(x)
    g(x) = f + x;
    disp(g);
    
    xold = initialGuess;
    onlyOneIteration = 1;
    
    while (1) && (onlyOneIteration)
        if (strcmp(mode, 'Step') ~= 0)
            onlyOneIteration = 0;
        end
            
        itrNum = itrNum + 1;
        xnew = double(subs(g,xold));
        error = abs((xnew - xold)/xnew) * 100;
        
        s = sprintf ('i=%d   x=%f   e=%f',itrNum,xold,error);
        disp(s);
        
        oldData = get(table,'Data');
        newData = [oldData; {itrNum, xold, xnew, error}];
        set(table,'Data',newData)
        
        if (error > desiredPrecision) && (itrNum < maxIterations)
            xold = xnew;
        else 
           root = xnew;
           break;        
        end
        i = itrNum;
        root = xnew;
        time = 0;
        percision = error;
    end
end