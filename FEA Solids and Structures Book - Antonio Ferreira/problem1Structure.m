%% Problem 1 code using Struct

clear all

p1 = struct();  

p1.elementNodes = [1 2;2 3;2 4];
p1.GDof = 4;
p1.numberElements = size(p1.elementNodes,1);
p1.numberNodes = 4;

% for structures
p1.displacements = zeros(p1.GDof,1); % displacement vector
p1.force = zeros(p1.GDof,1);
p1.stiffness = zeros(p1.GDof);

% applied load at node 2;
p1.force(2) = 10.0;

% stiffness matrix computation
for e = 1:p1.numberElements
    elementDof = p1.elementNodes(e,:);
    p1.stiffness(elementDof,elementDof) = ...
        p1.stiffness(elementDof,elementDof) + [1 -1;-1 1];
end

% boundary condition
p1.prescribedDof = [1;3;4]

% solution
p1.displacements = solutionStructure(p1)

% output displacements/reactions
outputStructure(p1)
