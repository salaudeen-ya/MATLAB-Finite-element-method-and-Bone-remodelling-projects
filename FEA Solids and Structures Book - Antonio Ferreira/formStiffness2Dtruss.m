function [stiffness] = formStiffness2Dtruss(GDof,numberElements,elementNodes,...
    numberNodes,nodeCoordinates,xx,yy,EA);

stiffness = zeros(GDof);

% stiffness matrix computation
for e = 1:numberElements
    indice = elementNodes(e,:);
    elementDof = [indice(1)*2-1 indice(1)*2 indice(2)*2-1 indice(2)*2];
    xa = xx(indice(2)) - xx(indice(1));
    ya = yy(indice(2)) - yy(indice(1));
    length_element = sqrt(xa*xa + ya*ya);
    C = xa/length_element;
    S = ya/length_element;
    k1 = EA/length_element * ...
        [C*C C*S -C*C -C*S; C*S S*S -C*S -S*S;
         -C*C -C*S C*C C*S; -C*S -S*S C*S S*S];
     stiffness(elementDof,elementDof) = stiffness(elementDof, elementDof) + k1;
end