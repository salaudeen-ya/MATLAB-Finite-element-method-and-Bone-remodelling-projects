nn = 100:50:800;
n = length(nn);

for i = 1:n
    nn(i)
    [t1(i), t2(i)] = testmat(nn(i));
end

plot(nn, [t1; t2])
xlabel('Matrix size', 'FontSize', 15)
ylabel('CPU time (secs)', 'FontSize', 15)
text(600,10,'Decomposition','FontSize',14)
text(500,20,'Full inversion','FontSize',14)
print -dps2 testmat.ps