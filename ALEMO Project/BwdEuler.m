function y = BwdEuler(t,ffun,Jfun,y1)
% SOLVE ydot = f(t,y)
% t   is the time stepping vector 
% ffun is the function handle @(t,y) for the rhs of the ODE f(t,y)
% Jfun is the function handle @(t,y) for the gradient of f with respect to
% y
% y1 is the initial condition
%% DO NOT MODIFY THIS PART--------------------------------
if size(y1,2)~=1
    error('The initial condition must be a COLUMN vector')
end
if min(size(t))~=1
    error('The time step vector must be either a COLUMN or a ROW')
end
%%--------------------------------------------------------
% Allocate space for solution
y = zeros(size(y1,1),numel(t));
% Set initial condition
y(:,1) = y1(:); %%<---------------------

% Start time stepping
for i = 2:numel(t)
% compute Delta t 
dt = t(i) - t(i-1); %%<---------------------
% set g fun 
gfun = @(z)(z - y(:,i-1) - dt*ffun(t(i-1), z(i))); %%<---------------------
% Set L
Lfun = @(z)(eye(2)- dt*Jfun(t(i-1), z)); %%<---------------------
% solve nonlinear problem using the solution at previous time step as
% initial guess
y(:,i) = solveNR(gfun,Lfun,y(:,i-1));
%Display message
fprintf('Solved time step %d of %d\n',i,numel(t))
end


end

