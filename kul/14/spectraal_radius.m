% bereken spectraalradius voor een gegeven generatiematrix
function [sr] = spectraal_radius(A, method)
  G = feval( method, A);
  [evector,eval]=eig(G);
  sr = max(max(abs(eval)));
end
