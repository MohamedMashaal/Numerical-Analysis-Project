function [itr, x_l, x_u] = Bisection(f, currentI, Xu,Xl,es,Im, mode, table)

    format long
    if((f(Xl))*(f(Xu))>0) 
       disp('no bracket');
       return
    end

    xrold = 0;

    %for strp mode
    if (strcmp(mode, 'Step') ~= 0)
        Im = currentI;
    end
    
    for i = currentI : Im
        Xr=(Xu+Xl)/2; % compute the midpoint xr
        ea = abs((Xr-xrold)/Xr); % approx. relative error
        test= f(Xl) * f(Xr); % compute f(xl)*f(xr)
        xrold = Xr ;

        itr = i + 1;
        %adding new row to table
        oldData = get(table,'Data');
        newData = [oldData; {i, Xl, Xu, Xr, ea}];
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
