function [root, i, x_0] = Secant(func, currentI,initial_0,initial_1,maxIteration,precision, mode, table)
%Newton Summary of this function goes here
%   Detailed explanation goes here
    x0 = initial_0;
    x1 = initial_1;
    
    %for strp mode
    if (strcmp(mode, 'Step') ~= 0)
        maxIteration = currentI;
    end
    
    for counter =  currentI : maxIteration 
       startTime = cputime;
        
       x2 =  x1 - (func(x1) * (x0 - x1))/( func(x0) - func(x1));
       i = counter + 1;
       
       x_0 = x1;
       %adding new row to table
       oldData = get(table,'Data');
       newData = [oldData; {counter, double(x0), double(x1), double(x2),double(abs(x2 - x1)) , cputime - startTime}];
       set(table,'Data',newData)
       
       if( precision > abs(x2 -x1))
            root = x2;
            return;
       end
       x0 = x1;
       x1 = x2;
       root = x2;
    end
end


