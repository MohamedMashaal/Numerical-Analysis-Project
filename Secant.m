function [root] = Secant(func,initial_0,initial_1,maxIteration,precision)
%Newton Summary of this function goes here
%   Detailed explanation goes here
    x0 = initial_0;
    x1 = initial_1;
    for counter =  1 : maxIteration 
       x2 =  x1 - (func(x1) * (x0 - x1))/( func(x0) - func(x1));
       if( precision > abs(x2 -x1))
            root = x2;
            return;
       end
       x0 = x1;
       x1 = x2;
       root = x2;
    end
end


