N = 299;
sums(n) = 0;
for n = 1:N   
    sums(n) = sums(n) + ((-1).^n)./n;
end

disp(sums(n))
-log(2)