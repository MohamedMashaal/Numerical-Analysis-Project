function [root, i, diffunc] = NewtonRaphson(func,currentI, initialPoint,maxIteration,precision,mode, table)
%Newton Summary of this function goes here
%   Detailed explanation goes here
    syms x;
    diffunc = diff(func,x);
    x0 = initialPoint;
    
    %for strp mode
    if (strcmp(mode, 'Step') ~= 0)
        maxIteration = currentI;
    end
    
    for counter =  currentI : maxIteration 
       startTime = cputime;
       denom = vpa(subs(diffunc,x0));
       if(denom == 0)
           table.Data = {'', '', '', 'Division By Zero', '', ''};
           i = 0;
           root = x0;
           return
       end
       x1 =  x0 - (func(x0)/ vpa(subs(diffunc,x0)));
       i = counter + 1;
       
       %adding new row to table
       oldData = get(table,'Data');
       newData = [oldData; {counter, double(x0), '', double(x1),double(abs(x1 - x0)) , cputime - startTime}];
       set(table,'Data',newData)
       
       if( precision > abs(x1 -x0))
            root = double(x1);
            return;
       end
       x0 = x1;
       root = double(x1);          
    end
end

