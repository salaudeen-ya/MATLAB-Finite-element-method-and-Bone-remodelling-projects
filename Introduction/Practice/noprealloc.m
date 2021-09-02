function noprealloc
N = 5000;
for i = 1:N
    for j = 1:N
        A(i,j) = i*j;
    end
end