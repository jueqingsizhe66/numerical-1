function [x, xzero, iterations, difference] = subst(F, x0, tol, maxit)
  iteration = 0;
  diff = abs(tol)+1;
  xs = [x0];
  while (iteration < maxit) && (diff > tol);
    new = feval(F, x0);
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
