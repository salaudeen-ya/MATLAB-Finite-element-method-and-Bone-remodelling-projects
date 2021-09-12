%% Problem 2: FEA of an isoparametric bar with E = 30e6, and A = 1
% It bar is discretized into three elements with four nodes
% The end nodes are clamped
% It uses the solution.m and output.m as main function

clear all

% parameters
E = 30e6; A = 1; EA = E*A; L = 90;

% coordinates and connectivities
numberElements = 3;
% equally spaced coordinates with segement length = 30
nodeCoordinates = linspace(0,L,numberElements+1); % returns 1x4 vector

% number nodes = 4; 
numberNodes = size(nodeCoordinates, 2); 
        % captures the second dimension of the coordinates

% element nodes: connection at elements
% fills the nodes matrix as [1 2;2 3;3 4]
ii = 1:numberElements;
elementNodes(:,1) = ii;
elementNodes(:,2) = ii+1;

% structure properties and parameters
displacements = zeros(numberNodes,1);
force = zeros(numberNodes,1);
stiffness = zeros(numberNodes, numberNodes);

% applied node at node 2
force(2) = 3000.0;

% global stiffness matrix 
for e = 1:numberElements
    elementDof = elementNodes(e,:);
    nn = length(elementDof);
    length_element = nodeCoordinates(elementDof(2))...
        - nodeCoordinates(elementDof(1));
    detJacobian = length_element/2;
    invJacobian = 1/detJacobian;
    
    %using Gauss quadrature with once central point (xi = 0) and weight (W = 2)
    [shape,naturalDerivatives] = shapeFunctionL2(0.0);
        Xderivatives = naturalDerivatives*invJacobian;
 
    % derivatives of the shape functions : B-matrix
    B = zeros(1,nn);
    B(1:nn) = Xderivatives(:);
    stiffness(elementDof, elementDof) = ...
        stiffness(elementDof, elementDof) + B'*B*2*detJacobian*EA;
end

% boundary conditions and solution
% prescribed dofs

xx = (nodeCoordinates(:));
fixedDof = find(xx == min(nodeCoordinates(:))| xx == max(nodeCoordinates(:)))';

prescribedDof = [fixedDof]'
activeDof = setdiff([1:numberNodes]', [prescribedDof]);

% solution
GDof = numberNodes;
displacements = solution(GDof, prescribedDof, stiffness, force);

%output displacements/reactions
output(displacements, stiffness, numberNodes, prescribedDof)
