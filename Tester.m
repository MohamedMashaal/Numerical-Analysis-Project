function Tester()
import BergeViete;
    
    f = @(x) x^2 - 3*x + 2;
    
    BergeViete(f, 3, 1.0, 3);

end