sums(p) = 0;
for p = 1:4
    for j = 1:(p+1)
        sums(p) = sums(p) + j^p;
    end
end
    
disp(sums(p))