a = input('Start of interval ');
b = input('End of interval ');
x = linspace(a,b)
y = feval('userf1',x);
clf
plot(x,y)
grid on
zoom on