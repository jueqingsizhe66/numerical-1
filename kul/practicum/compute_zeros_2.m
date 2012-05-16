% applies substitutionmethod atan(x) + k * pi
% all roots can be found by their corresponding index used as value for k
%
% @author: Christophe VG

function [x] = compute_zeros_2(n)
  x = [];
  for k = 0:n
    [xs, xzero] = subst(@(x,k) atan(x) + k * pi, 1, 10^-6, 10^5, k );
    x(end+1) = xzero;
  end
end
