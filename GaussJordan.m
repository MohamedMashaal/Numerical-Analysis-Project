function xs = GaussJordan(n,mat)
    xs = [];
    for i = 1 : n                 % pivot row
        for k = 1 : n            % rows (except for the pivot row)
            if k == i
                continue;
            end
            m = mat(k, i) / mat(i, i);
            for j = 1 : n+1     % columns
                mat(k, j) = mat(k, j) - m * mat(i, j);
            end
        end
        % rescalling
        fac = mat(i,i);
        for b = 1 : n+1
            mat(i,b) = mat(i,b) / fac;
        end
        % disp(mat);
        % disp('---------------------------');
    end
    
    % getting xs values
    for i = 1 : n
        xs(i) = mat(i, n+1);
    end
end