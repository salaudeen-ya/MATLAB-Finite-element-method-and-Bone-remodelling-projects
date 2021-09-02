x = (-3:3);
g = cos(pi*x);
izero = find(g==eps);
ii = find(g~=0);
f(izero) = NaN;
f(ii) = 1./g(ii);