x = linspace(-3,5,100);

for j = 1:length(x)
if x >= -1 & x <= 1
f(j) = x^2;
elseif x > 1 & x < 4
f(j) = 1;
else
f(j) = 0;
end
end

a = find(f);
plot(x,f)