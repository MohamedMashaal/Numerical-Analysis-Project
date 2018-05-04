function Tester()
import BergeViete;
import FPI;
import GaussJordan;

    f = @(x) x ^3 -  3 * x^2  +4;
    BergeViete(f , 1, 0.001 , 50);
    
    % f = @(x) x^2 - 3*x + 2;
    
    % FPI(f, 3, 1.0, 3, 'gd');
    
    %mat = [
      %          1 1 2 8;
         %      -1 -2 3 1;
           %     3 7 4 10
             %  ];
           
     %GaussJordan(mat)

end