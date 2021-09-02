%% Matrix Decomposition
% It compares the time taking by matrix full inversion 
% and decomposition, in principle, uisng LU
% main to test in using mtestmat.m

function [time1, time2] = testmat(n);
A = rand(n);
b = rand(n,1);
tnow = cputime;
x = A\b;
time1 = cputime-now;
tnow = cputime;
x = inv(A)*b;
time2 = cputime-tnow;