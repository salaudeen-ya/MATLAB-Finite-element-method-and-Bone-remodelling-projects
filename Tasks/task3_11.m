x = 1;
if tan(73*pi*x/4) >= 0
x = 2;
else
x = pi;
end
if floor(x) == x
x = 10;
else
x = 7;
end
if isprime(x)
x = 'True';
else
x = 'False';
end

disp(floor(x))