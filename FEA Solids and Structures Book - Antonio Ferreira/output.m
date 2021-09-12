function output(displacements, stiffness, GDof, prescribedDof)

% output of displacements and reactions in tabular form

% GDof: total number of degress of freedom of the problem
% GDof = numberNodes

% displacements
disp('Displacements')
% displacements = displacements1;
jj = 1:GDof; format
[jj' displacements]

% reactions
F = stiffness*displacements;
reactions = F(prescribedDof);
disp('reactions')
[prescribedDof reactions]