%% Code to evaluate characteristics polynomial p(lambda) at n+1 points and
% then fitting a polynomial to these points
% x = (i-1)*pi/n is used since these will no coincide with eigenvalues
% unless the elements of the matrix involve pi.
% The roots of the polynomial is then solved using roots.

function [co] = charpoly(A)
[m,n] = size(A);
if m ~= n
    disp('Matrix is not square')
    co = [];
    return
end
for i = 1:(n+1)
    x(i) = (i-1)*pi/n;
    y(i) = det(A-x(i)*eye(n));
end
co = polyfit(x,y,n);
