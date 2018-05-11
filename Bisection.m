function [itr, x_l, x_u,xrold] = Bisection(f, currentI, Xu,Xl,es,Im, mode,table,xr)

    format long
    if((f(Xl))*(f(Xu))>0) 
       disp('no bracket');
       return
    end

    xrold = xr;
    itr = 0; 
    %for strp mode
    if (strcmp(mode, 'Step') ~= 0)
        Im = currentI;
    end
    
    for i = currentI : Im
        startTime = cputime;
        
        xr=(Xu+Xl)/2; % compute the midpoint xr
        ea = abs((xr-xrold)/xr); % approx. relative error
        test= f(Xl) * f(xr); % compute f(xl)*f(xr)
        xrold = xr ;

        itr = i + 1;
        %adding new row to table
        oldData = get(table,'Data');
        newData = [oldData; {i, Xl, Xu, xr, ea, cputime - startTime}];
        set(table,'Data',newData)

        if(test < 0) 
            Xu=xr;        
        else
            Xl=xr;
        end
        
        x_l = Xl;
        x_u = Xu;

        if(test == 0)
            ea=0;
        end

        if(ea < es) 
            break; 
        end

    end

end   % end of quadratic
