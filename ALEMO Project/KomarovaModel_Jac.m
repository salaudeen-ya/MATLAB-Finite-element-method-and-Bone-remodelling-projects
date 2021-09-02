function J = KomarovaModel_Jac(y,a1,a2,b1,b2,g11,g12,g21,g22)
%% DO NOT MODIFY THIS PART--------------------------------
%check size of the input vector 
if numel(y) ~= 2
    error('The input vector Y must have two elements')
end
%%--------------------------------------------------------
y1 = yss(1,1)+10; %%<---------------------
y2 = yss(2,1); %%<---------------------

% Jij is the derivative of ydot_i w.r.t. y_j

J11 = a1*(g11*y1^(g11-1))*y2^g21 - b1; %%<---------------------
J12 = a1*y1^g11*(g21*y2^(g21-1));  %%<---------------------
J21 = a2*(g12*y1^(g12-1))*y2^g22;  %%<---------------------
J22 = a2*y1^g12*(g22*(y2^g22-1) - b2; %%<---------------------

% J is a 2x2 matrix containing the J_(ij)'s
J = [J11 J12; J21 J22]; %%<---------------------

end