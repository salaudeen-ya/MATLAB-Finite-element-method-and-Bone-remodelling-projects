%% Problem 3 of using Direct Stiffness Method
% This problem involves bars and spring
% It has four nodes, with end notes clamped
% The third element has a spring with a spring constant k = 2000 kN/m
% There is an appolied 8kN load at node 2

clear all

E = 70000; A = 200; k = 2000;  

% coordinates and connectivites
numberElements = 3;
numberNodes = 4;
elementNodes = [1 2;2 3;4 4];
nodeCoordinates = [0 2000 3000 4000];

xx = nodeCoordinates;

% structure properties and parameters
displacements = zeros(numberNodes,1);
force = zeros(numberNodes,1);
stiffness = zeros(numberNodes,numberNodes);

% applied load at node 2
force(2) = 8000;

% stiffness matrix computation
for e = 1:numberElements
    elementDof = elementNodes(e,:);
    L = nodeCoordinates(elementDof(2)) - nodeCoordinates(elementDof(1));
    if e < 3
        ea(e) = E*A/L;
    else 
        ea(e) = k;
    end
    stiffness(elementDof, elementDof) = ...
        stiffness(elementDof,elementDof) + ea(e)*[1 -1;-1 1];
end

% boundary conditions
prescribedDof = [1;4];
activeDof = setdiff([1:numberNodes]',[prescribedDof]);

% solution
GDof = 4;
displacements = solution(GDof,prescribedDof,stiffness,force);

% output displacements/reactions
output(displacements,stiffness,numberNodes,prescribedDof)
