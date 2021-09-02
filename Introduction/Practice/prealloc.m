function prealloc
N = 5000;
A = ones(N,N);
for i = 1:N
    for j = 1:N
        A(i,j) = i*j;
    end
end