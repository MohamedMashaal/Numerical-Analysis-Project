function [roots] = generalAlgorithm(f,xl,xu,precision)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
start = xl ;
distance = .05;
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
   start = nextPoint +.01;
end
end