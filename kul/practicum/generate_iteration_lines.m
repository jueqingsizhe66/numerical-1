% accepts a list of subsequent x-values
% generates a set of X and Y values, representing the subsequent steps in the
% iteration
%
% @author: Christophe VG

function [X,Y] = generate_iteration_lines(xs)
  X = [xs(1)];
  Y = [0];
  for i = 1:length(xs)-1
    X(end+1) = xs(i);
    Y(end+1) = xs(i+1);
    X(end+1) = xs(i+1);
    Y(end+1) = xs(i+1);
  end
end
