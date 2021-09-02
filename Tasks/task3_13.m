i = 1:50;

for n = i
    sums(n) = 0;
    sums(n) = n^3 - n^2 + 40;
    if sums(n) > 1000 && mod(n,3) ~= 0;
        disp(n);
    end
end

isperfect(i)
%disp(sums)
    