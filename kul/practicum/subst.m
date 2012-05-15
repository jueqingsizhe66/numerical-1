% applies the substitutionmethod to given function F, starting at x0, until
% two subsequent iterations differ less than tol or when the number of
% iterations exceeds maxit.
% additional parameter k add to provide a second argument for F
%
% @author: Christophe VG

function [x, xzero, iterations, difference] = subst(F, x0, tol, maxit, k)
  iteration = 0;
  diff = abs(tol)+1;
  xs = [x0];
  while (iteration < maxit) && (diff > tol);
    new = feval(F, x0, k);
    diff = abs(new - x0);
    x0 = new;
    xs(end+1) = x0;
    iteration = iteration + 1;
  end
  x = xs;
  xzero = x0;
  iterations = iteration;
  difference = diff;
end
