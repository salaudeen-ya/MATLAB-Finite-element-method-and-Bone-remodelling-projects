%% The main function for the Bisection Method of root finding
% It uses the func.m and bisect.m scripts in its execution


function [answer, iflag] = bisect(fun,a,b)
global tolerance maxits
iflag = 0;
iterations = 0;
f_a = feval(fun,a);
f_b = feval(fun,b);
while ((f_a*f_b < 0) & iterations < maxits) & (b-a) > tolerance
    iterations = iterations + 1;
    c = (b+a)/2;
    f_c = feval(fun, c);
    if f_c*f_a < 0
        b = c; 
        f_b = f_c;
    elseif f_b*f_c < 0;
        a = c;
        f_a = f_c;
    else 
        iflag = 1;
        answer = c;
    end
end
switch iterations
    case maxits
        iflag = 01; answer = NaN;
    case 0
        iflag = -2; answer = NaN;
    otherwise
        iflag = iterations; answer = c;
end

        