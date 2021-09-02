function [summa, index] = max_sum(v,n)
len = length(v);
temp_sum = zeros(1, len-n+1);
if n > len
    summa = 0;
    index = -1;
    return
else
    for i = 1:(len-n+1)
    temp_sum(i)=sum(v(i:(i+n-1)));
    end
summa = max(temp_sum);
ind = find(temp_sum == summa);
index = min(ind);
end
end