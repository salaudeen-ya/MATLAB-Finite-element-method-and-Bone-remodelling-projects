% shape function and derivatives for L2 elements

function shapeL2 = shapeFunctionL2Structure(xi)

% shape : shape functions
% naturalDerivatives : derivatives wrt i
% xi : natural coordinates (-1 ... +1)

shapeL2 = struct()
shapeL2.shape = ([1-xi, 1+xi]/2)';
shapeL2.naturalDerivatives = [-1;1]/2;

end