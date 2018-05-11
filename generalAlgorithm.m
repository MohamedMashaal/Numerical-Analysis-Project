function [roots] = generalAlgorithm(f,xl,xu,precision, interval)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    start = xl ;
    distance = interval;
    endPoint = xu;
    roots = [];
    while (start < endPoint)
       nextPoint = start + distance;
       root = Brent(f,start , nextPoint);
       froot = f(root);
       if (abs(froot) < precision)
          m = checkMultiplicity(f,root,precision);
          roots = [roots, root];
          roots = [roots, m];
       end
       if(precision > 10^-3)
          start = nextPoint + 10^-3;
       else
          start = nextPoint + precision;
       end
    end
end