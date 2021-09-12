%% 2D Truss Problem
% A truss problem with three members, sharing one node, and the three ends
% clamped
% This code calls formStiffness2Dtruss.m and stresses2Dtruss.m

clear all
E = 30e6; A = 2; EA = E*A;

% coordinates and connectivites
numberElements = 3;
numberNodes = 4;
elementNodes = [1 2;1 3; 1 4];
nodeCoordinates = [0 0; 0 120; 120 120; 120 0];
xx = nodeCoordinates(:,1);
yy = nodeCoordinates(:,2);

%
GDof = 2*numberNodes;
displacments = zeros(GDof,1);
force = zeros(GDof,1);

% applied load at node 1
force(1) = -10000.0;

% stiffness matrix
[stiffness] = formStiffness2Dtruss(GDof,numberElements,...
    elementNodes,numberNodes,nodeCoordinates,xx,yy,EA);

% boundary conditions
prescribedDof = [3:8]';

% solution
displacements = solution(GDof,prescribedDof,stiffness,force);

% drawing displacements
us = 1:2:2*numberNodes-1;
vs = 2:2:2*numberNodes;
figure
% L = node(2,1) - node(1,1);
L = xx(2) - xx(1);

XX = displacements(us);
YY = displacements(vs);
dispNorm = max(sqrt(XX.^2 + YY.^2));
scaleFact = 15000*dispNorm;
clf
hold on
drawingMesh(nodeCoordinates + scaleFact*[XX YY], elementNodes, 'L2', 'k.-');
drawingMesf(nodeCoordinates,elementNodes,'L2','k.--');

% stresses at the elements
stresses2Dtruss(numberElements, elementNodes,xx,yy,displacements,E)

% output displacements/reactions
output(displacements,stiffness,GDof,prescribedDof)
