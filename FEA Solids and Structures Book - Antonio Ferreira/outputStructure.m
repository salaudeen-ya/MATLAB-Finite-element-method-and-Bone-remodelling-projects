function outputStructure(p)

% output of displacments and reactions in tabular form

% displacements
disp('Displacements')
jj = 1:p.GDof; format
[jj' p.displacements]

% reactions
F = p.stiffness*p.displacements;
reactions = F(p.prescribedDof);
disp('reactions')
[p.prescribedDof reactions]