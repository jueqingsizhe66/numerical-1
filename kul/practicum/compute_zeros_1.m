% applies substitutionmethod tan(x)
% using tan(x) only the first root can be found: 0
%
% @author: Christophe VG

function [x] = compute_zeros_1(n)
  if n > 1
    disp('warning: tan(x) can only find the first root');
  end
  [xs, xzero] = subst(@(x, k) tan(x), 1, 10^-6, 10^5, 0 );
  x = [xzero];
end
