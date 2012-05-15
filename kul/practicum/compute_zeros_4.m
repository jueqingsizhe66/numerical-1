% applies Newton-Raphson on atan(x) - x + k * pi
% == substitutionmethod on x - ((atan(x) - x + k*pi) / ((1/x^2+1) - 1))
% using atan(x) - x + k * pi only the first root can be found: 0
%
% @author: Christophe VG

function [x] = compute_zeros_4(n)
  if n > 1
    disp('warning: NR on tan(x) - x + k * pi can only find the first root');
  end
  [xs, xzero] = subst(@(x,k) x - ((atan(x) - x + k*pi) / ((1/x^2+1) - 1)), 0.5, 10^-6, 10^5, 0.5 );
  x = [xzero];
end
