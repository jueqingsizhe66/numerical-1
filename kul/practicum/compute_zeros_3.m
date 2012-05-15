% applies Newton-Raphson on tan(x) - x
% == substitutionmethod on x - ( (tan(x) - x) / (tan(x)^2) )
% using tan(x) - x only the first root can be found: 0
%
% @author: Christophe VG

function [x] = compute_zeros_3(n)
  if n > 1
    disp('warning: NR on tan(x) -x can only find the first root');
  end
  [xs, xzero] = subst(@(x,k) x - ( (tan(x) - x) / (tan(x)^2) ), 1, 10^-6, 10^5, 0 );
  x = [xzero];
end
