x = -2.0:0.01:2.0
y = feval('userfn',x,2,2);
plot(x,y)
grid on
[xvalues, yvalues] = ginput
[yy, ii] = min(abs(yvalues));
disp(xvalues(ii))
