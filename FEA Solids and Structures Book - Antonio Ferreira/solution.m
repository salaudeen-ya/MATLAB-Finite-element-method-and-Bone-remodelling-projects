%% General solution to compute the global displacments of any FE problems 
% using the approach adopted here

function displacements = solution(GDof, prescribedDof, stiffness, force)
activeDof = setdiff([1:GDof]', [prescribedDof]);
U = stiffness(activeDof, activeDof)\force(activeDof);
displacements = zeros(GDof, 1);
displacements(activeDof) = U;
end