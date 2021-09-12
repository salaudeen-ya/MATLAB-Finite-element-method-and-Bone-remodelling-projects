% Problem 2 analysis using Struct()

clear all

p2 = struct();
E = 30e6; A = 1; EA = E*A; L = 90;

% coordinates and connnectivities
p2.numberElements = 3;
p2.nodeCoordinates = linspace(0,L,p2.numberElements+1);
p2.xx = p2.nodeCoordinates;
p2.numberNodes = size(p2.nodeCoordinates,2);

% element nodes
ii = 1:p2.numberElements;
p2.elementNodes(:,1) = ii;
p2.elementNodes(:,2) = ii+1;

% global degrees of freedom
p2.GDof = p2.numberNodes;

% % number of Elements
% p2.numberElements = size(p2.elementNodes,1);
%
% % number of nodes
% p2.numberNodes = 4;

% structure properties and parameters
p2.displacements = zeros(p2.GDof,1);
p2.force = zeros(p2.GDof,1);
p2.stiffness = zeros(p2.GDof);

% applied load at node 2
p2.force(2) = 3000.0;

% global stiffness matrix
for e = 1:p2.numberElements
    elementDof = p2.elementNodes(e,:);
    nn = length(elementDof);
    length_element = p2.nodeCoordinates(elementDof(2))...
        - p2.nodeCoordinates(elementDof(1));
    detJacobian = length_element/2; 
    invJacobian = 1/detJacobian;
    
    % central Gauss point (xi = 0, weight W = 2)
    shapeL2 = shapeFunctionL2Structure(0.0);
    Xderivatives = shapeL2.naturalDerivatives*invJacobian;
    
    % B matrix
    B = zeros(1,nn);
    B(1:nn) = Xderivatives(:);
    p2.stiffness(elementDof,elementDof) = ...
        p2.stiffness(elementDof, elementDof) + B'*B*2*detJacobian*EA;
end

% prescribed dofs
p2.prescribedDof = find(p2.xx == min(p2.nodeCoordinates(:))...
    | p2.xx == max(p2.nodeCoordinates(:)))';

% solution
p2.displacements = solutionStructure(p2)

% output displacements/reactions
outputStructure(p2);


