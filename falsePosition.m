function [result] = falsePosition(Xu,Xl,es,Im);
%this function get roots of equation by bisection method 
str = '@(x)x^4+3*x-4'; % it will be input from the gui 
f = str2func(str);
format long
result= [0 0 0 0 0 0];
if((f(Xl))*(f(Xu))>0) 
   disp('no bracket');
return
end
xrold = 0;
for i=1:1:Im
Xr= (Xl*f(Xu) - Xu*f(Xl)) / (f(Xu)-f(Xl)); % compute the midpoint xr
ea = abs((Xr-xrold)/Xr); % approx. relative error
test= f(Xl) * f(Xr); % compute f(xl)*f(xr)
xrold = Xr ;
s=sprintf('\n  xl = %f  xu = %f Root= %f #Iterations = %d ea = %f  f(Xr)= %f  \n', Xl,Xu,Xr,i,ea,f(Xr)); disp(s);
current= [i Xl Xu  Xr f(Xr) ea];
result = [result;current];
if(test < 0) Xu=Xr;
else Xl=Xr;
end

if(test == 0) ea=0; end
if(ea < es) break; end
end
result([1],:) = [];
end   % end of quadratic


