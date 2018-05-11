function [root, i, percision] = BergeViete(f, currentI, initialGuess, desiredPrecision, maxIterations, mode, table)
    a = getArrayA(f);
    b = [];
    c = [];
    iter = currentI;
    Xi = initialGuess;
    prec = 100.0;
    
    lenA = length(a);
    
    onlyOneIteration = 1;
    while iter < maxIterations && prec > desiredPrecision && onlyOneIteration
        startTime = cputime;
        
        if (strcmp(mode, 'Step') ~= 0)
            onlyOneIteration = 0;
        end
        
        b = calcArray(a, Xi, lenA);
        c = calcArray(b, Xi, lenA);
        disp(a);
        disp(b);
        disp('c');
        disp(c);
        
        Xi_old = Xi;
        Xi = Xi - b(1) / c(2);
        
        if iter > 0
            prec = abs(((Xi - Xi_old) / Xi) * 100);
        end

        iter = iter + 1;
        
        i = iter;
        root = Xi;
        percision = prec;
        oldData = get(table,'Data');
        newData = [oldData; {iter, Xi_old, Xi, Xi, prec, cputime - startTime}];
        set(table,'Data',newData)
        
    end
end

function a = getArrayA(f)

    a = [];
    a(1) = f(0);
    i = 2;
    
    syms diff_f(x);
    diff_f(x) = f;
        
    while true
        diff_f(x) = diff(diff_f(x) , x)
        if diff_f == 0
            break;
        end
        a(i) = diff_f(0) / factorial(i-1);
        i =  i + 1;
    end
end

function arr2 = calcArray(arr, r, arrLen)
    arr2 = [];
    for i = 1 : arrLen
        arr2(i) = 0;
    end
    
    arr2(arrLen) = arr(arrLen);
     i = arrLen-1;
    while i >= 1
        arr2(i) = arr(i) + r * arr2(i+1);
        i = i - 1;
    end
end

function fact = factorial(x)
    fact = 1;
    for n = 2 : x
        fact = fact * n;
    end
end