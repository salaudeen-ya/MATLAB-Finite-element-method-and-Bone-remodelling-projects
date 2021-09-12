%% Probelem 1: MATLAB Code for FEA of a discrete system of a bar
% The bar contains four nodes, with a rigid node two common to all elements
% The other nodes are clamped.
% The main function is output.m

clear all

elementNodes = [1 2; 2 3; 2 4];
numberElements = size(elementNodes,1);
numberNodes = 4;

% for strucctures
displacements = zeros(numberNodes,1);
force = zeros(numberNodes,1);
stiffness = zeros(numberNodes);  % pre-allocation for speed in the loop

force(2) = 10.0;  % applied load at node 2

% stiffness matrix computation
for e = 1:numberElements;
    elementDof = elementNodes(e,:);
    stiffness(elementDof, elementDof) = ...
        stiffness(elementDof, elementDof)+[1 -1; -1 1];
end

% boundary conditions and solution

% prescribed dofs
prescribedDof = [1;3;4];
% free Dof : activeDof
activeDof = setdiff([1:numberNodes]', [prescribedDof]);
        % setdiff is a MATLAB function that help us set up the difference
        % between all degreees of freedom and the prescribed ones

% solution
displacements = stiffness(activeDof, activeDof)\force(activeDof);

% positioning all displacements
displacements1 = zeros(numberNodes, 1);
displacements1(activeDof) = displacements;

% output displacements/reactions
output(displacements1, stiffness, numberNodes, prescribedDof)