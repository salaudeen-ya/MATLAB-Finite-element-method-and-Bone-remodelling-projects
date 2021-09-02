x = linspace(-4,4,100);
N = length(x);

for j = 1:N
    if x(j) >= 0 & x(j) <= 1
        f(j) = x(j);
    elseif x(j) >= 1 & x(j) <= 2
        f(j) = 2 - x(j);
    else 
        f(j) = 0;
    end
end

plot(x,f)