function [itr, x_l, x_u,xrold] = falsePosition(f,currentI,Xu,Xl,es,Im, mode, table,Xr)

    format long
    if((f(Xl))*(f(Xu))>0) 
        disp('no bracket');
        return
    end
    xrold = Xr;
    
    %for strp mode
    if (strcmp(mode, 'Step') ~= 0)
        Im = currentI;
    end
    
    for i = currentI : Im
        startTime = cputime;
        
        Xr= (Xl*f(Xu) - Xu*f(Xl)) / (f(Xu)-f(Xl)); % compute the midpoint xr
        ea = abs((Xr-xrold)/Xr); % approx. relative error
        test= f(Xl) * f(Xr); % compute f(xl)*f(xr)
        xrold = Xr ;
        
        itr = i + 1;
        %adding new row to table
        oldData = get(table,'Data');
        newData = [oldData; {i, Xl, Xu, Xr, ea, cputime - startTime}];
        set(table,'Data',newData)
        
        if(test < 0) 
            Xu=Xr;
        else
            Xl=Xr;
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


