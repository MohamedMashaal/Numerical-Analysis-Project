function [root] = NewtonRaphson(func,initialPoint,maxIteration,precision)
%Newton Summary of this function goes here
%   Detailed explanation goes here
    diffunc = diff(func);
    x0 = initialPoint;
    for counter =  1 : maxIteration 
       x1 =  x0 - (func(x0)/ vpa(subs(diffunc,x0)));
       if( precision > abs(x1 -x0))
            root = x1;
            return;
       end
       x0 = x1;
       root = x1;
    end
end

