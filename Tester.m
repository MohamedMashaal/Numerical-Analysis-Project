function Tester()
import BergeViete;
import FPI;
import GaussJordan;
import NewtonInterpolation;

    f = @(x) x^2-x;
    BergeViete(f ,0, 0, 0.001 , 0.0001, 'fddgd', 0);
    
    % f = @(x) x^2 - 3*x + 2;
    
    % FPI(f, 3, 1.0, 3, 'gd');
    
    %mat = [
      %          1 1 2 8;
         %      -1 -2 3 1;
           %     3 7 4 10
             %  ];
           
     %GaussJordan(mat)
     
     order = 4;
     points = [2 3];
     x = [0 2 3 4 5];
     y = [2 14 74 242 602];
     NewtonInterpolation(order, points, x, y);

end