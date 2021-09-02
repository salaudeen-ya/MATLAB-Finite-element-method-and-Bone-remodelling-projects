function [table summa] = multable(n, m)

%MULTABLE multiplication table.
% T = MULTABLE(N) returns an N-by-N matrix% containing the multiplication
% table for the intergers 1 through N.
% MULTABLE(N,M) returns N-by-M matrix.
% Both input arguments must be positive integers.
% [T SM] = MULTABLE(...) returns the matrix containing the multiplication
% table in T
% and the sum of all its elements in SM.

if nargin < 1
    error('must have at least one imput argument');
end
if nargin < 2
    m = n;
elseif ~isscalar(m) || m < 1 || m ~= fix(m)
    error('m need to be a positive integer');
end
if ~isscalar(n) || n < 1 || n~= fix(n)
    error('n needs to be a positive integer');
end

table = (1:n)' * (1:m);

if nargout == 2
    summa = sum(table(:));
end