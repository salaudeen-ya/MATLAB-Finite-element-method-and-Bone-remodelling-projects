N = 1000000;

sums(n) = 0;
for n = 1:N
    sums(n) = sums(n) + 1/(n*(n+1));
end

disp(sums(n))