function Result=lagrange(type,points,X,Y)
%
%LAGRANGE   approx a point-defined function using the Lagrange polynomial interpolation
% type mean  linear(1)-quadratic(2) and so on 
% points is ths points you want it's F(X)
% X  is the set of x  
% Y  the set of  y (F(x))
% result is array of the result 
L=ones(type+1,size(points,2));
n=size(points,2);
if (size(X,2)~=size(Y,2))
   fprintf(1,'\nERROR!\n X and F(x) must have the same number of elements\n');
   Result=NaN;
else
    for q=1:1:n
   for i=1:(type+1)
      for j=1:(type+1)
         if (i~=j)
            L(i,q)=L(i,q).*(points(q)-X(j))/(X(i)-X(j));
         end
      end
   end
    end
    Result=zeros(1,n);
   for q=1:1:n
   for i=1:(type+1)
      Result(1,q)=Result(1,q)+Y(i)*L(i,q);
   end
   end
end 
end
