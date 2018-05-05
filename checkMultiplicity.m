function [m]= checkMultiplicity(f,root,precision)
    syms x;
    der = diff(f, x);
    m = [];
    while der ~= 0
        val = vpa(subs(der,root));
        disp(der);
        if abs(val) < precision
            m = [m; root];
            der = diff(der,x);
        else
            break;
        end
    end
end

