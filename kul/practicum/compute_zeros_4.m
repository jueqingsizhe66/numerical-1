% applies Newton-Raphson on atan(x) - x + k * pi
% == substitutionmethod on x - (atan(x) - x + k*pi) / (1/(x^2+1) - 1)
% all roots can be found by their corresponding index used as value for k
%
% @author: Christophe VG

function [x] = compute_zeros_4(n)
  x = [];
  for k = 0:n
  [xs, xzero] = subst(@(x,k) x - (atan(x) - x + k*pi) / (1/(x^2+1) - 1), 1, 10^-6, 10^5, k );
    x(end+1) = xzero;
  end
end
