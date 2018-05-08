function [result] = Bisection(f,Xu,Xl,es,Im);
%this function get roots of equation by bisection method 
%str = '@(x)x.^3 - (0.165 .* x.^2)  + 3.993 .* 10.^(-4)'; % it will be input from the gui 
%f = str2func(str);
format long
if((f(Xl))*(f(Xu))>0) 
   disp('no bracket');
return
end
xrold = 0;
result= [0 0 0 0 0 0];
for i=1:1:Im
Xr=(Xu+Xl)/2; % compute the midpoint xr
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
