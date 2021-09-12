% Shape function with respect to natural coordinates

function [shape, naturalDerivatives] = shapeFunctionL2(xi)
% shape function and derivatives for L2 elements
% derivatives wrt xi, which is the natural coordinates (-1 ... +1)

shape = ([1-xi, 1+xi]/2)';
naturalDerivatives = [-1;1]/2;
end