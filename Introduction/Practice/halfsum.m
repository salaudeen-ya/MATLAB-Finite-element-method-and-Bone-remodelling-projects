function summa = halfsum(A)
[row, col] = size(A)
summa = 0;
for i = 1:row
    for j = i:col
        summa = summa + A(i,j)
    end
end
