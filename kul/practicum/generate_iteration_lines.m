function [X,Y] = generate_iteration_lines(xs)
  Xs = xs(1);
  Ys = [0];
  for x = xs
    Xs(end+1) = Xs(end);
    Ys(end+1) = x;
    
    Xs(end+1) = x;
    Ys(end+1) = x;
  end
  X = Xs;
  Y = Ys;
end
