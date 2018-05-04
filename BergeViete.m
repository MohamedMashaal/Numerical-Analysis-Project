function BergeViete(f, initialGuess, desiredPrecision, maxIterations)
    a = getArrayA(f)
    b = [];
    c = [];
    iter = 0;
    Xi = initialGuess;
    prec = 100.0;
    
    lenA = length(a);
    
    while iter < maxIterations && prec > desiredPrecision
        s = sprintf('iter %d', iter+1);
        disp(s);
        b = calcArray(a, Xi, lenA);
        c = calcArray(b, Xi, lenA);
        disp(a);
        disp(b);
        disp('c');
        disp(c);
        
        Xi_old = Xi;
        Xi = Xi - b(1) / c(2);
        s = sprintf('X%d = %f', iter+1, Xi);
        disp(s);
        
        if iter > 0
            prec = abs(((Xi - Xi_old) / Xi) * 100);
            s = sprintf('precsion: %f', prec);
            disp(s);
        end

        iter = iter + 1;
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