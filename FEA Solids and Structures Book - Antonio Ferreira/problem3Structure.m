%% Problem 3 analysis using Struct()

clear all

p3 = struct();

E = 70000; A = 200; k = 2000;

% node connections
p3.numberElements = 3;
p3.numberNodes = 4;
p3.elementNodes = [1 2;2 3;3 4];
p3.nodeCoordinates = [0 2000 4000 4000];
p3.xx = p3.nodeCoordinates;

% global degrees of freedom
p3.GDof = p3.numberNodes;

% structure
p3.displacements = zeros(p3.GDof, 1);
p3.force = zeros(p3.GDof, 1);
p3.stiffness = zeros(p3.GDof);

% applied load at node 2
p3.force(2) = 8000.0;

% stiffness matrix computation
for e = 1:p3.numberElements;
    elementDof = p3.elementNodes(e,:);
    L = p3.nodeCoordinates(elementDof(2)) ...
        - p3.nodeCoordinates(elementDof(1));
    if e < 3
        ea(e) = E*A/L;
    else
        ea(e) = k;
    end
    p3.stiffness(elementDof,elementDof) = ...
        p3.stiffness(elementDof,elementDof) + ea(e)*[1 -1;-1 1];
end

% prescribed dofs
p3.prescribedDof = [1;4];

% soultion
p3.displacements = solutionStructure(p3)

% output displacements/reactions
outputStructure(p3);