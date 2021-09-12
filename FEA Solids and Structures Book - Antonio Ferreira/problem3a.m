%% Isoparametric version of problem 3

clear all

E = 70000; A = 200; EA = E*A; k = 2000;

% coordinates and connectivites
numberElements = 3;
numberNodes = 4;
elementNodes = [1 2;2 3;3 4];
nodeCoordinates = [0 2000 4000 4000];
xx = nodeCoordinates;

displacements = zeros(numberNodes,1);
force = zeros(numberNodes,1);
stiffness = zeros(numberNodes,numberNodes);

% applied load at node 2
force(2) = 8000.0;

% stiffness matrix
for e = 1:numberElements;
    elementDof = elementNodes(e,:);
    if e < 3 % bar elements
        nn = length(elementDof);
        length_element = nodeCoordinates(elementDof(2))...
            - nodeCoordinates(elementDof(1));
        detJacobian = length_element/2;
        invJacobian = 1/detJacobian;
        % central gauss point (xi = 0, weight W = 2)
        [shape,naturalDerivatives] = shapeFunctionL2(0.0);
        Xderivatives = naturalDerivatives*invJacobian;
        
        % B matrix
        B = zeros(1,nn); B(1:nn) = Xderivatives(:);
        ea(e) = E*A;
        stiffness(elementDof,elementDof) = ...
            stiffness(elementDof, elementDof) + B'*B*2*detJacobian*ea(e);
    else % spring element
        stiffness(elementDof,elementDof) =...
            stiffness(elementDof,elementDof)+k*[1 -1;-1 1];
    end
end

% boundary conditions
prescribedDof = [1;4];
GDof = 4;

% solution
displacements = solution(GDof, prescribedDof,stiffness,force);

% output displacements/reactions
output(displacements,stiffness,numberNodes,prescribedDof)