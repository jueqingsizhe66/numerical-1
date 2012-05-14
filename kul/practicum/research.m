clear all;
format long;

% f1 = tan(x)
function [result] = f1(x)
  result = tan(x);
end

% f2 = atan(x) + k*pi
function [result] = f2(x)
  k=0;
  result = atan(x) + k*pi;
end

% f3  = tan(x) - x (using NR)
% f3' = tan^2(x)
function [result] = f3(x)
  result = x - ((tan(x) - x) / (tan(x)^2));
end

% f4  = atan(x) - x + k*pi (using NR)
% f4' = 1/(x^2+1) - 1
function [result] = f4(x)
  k=0;
  result = x - ((atan(x) - x + k*pi) / ((1/x^2+1) - 1));
end

f1 = @(x) tan(x);
[xs, xzero] = subst(f1, -1, 10^-6, 100000 );
figure
show_iteration(f1, xs, -2, 2, -2, 2);

% f2 = @(x) atan(x) + 3 * x;
% [xs, xzero, iterations] = subst(f2, 1, 0.000001, 100000 )
% figure
% show_iteration(f2, xs);

% f3 = @(x) atan(x) + 3 * x;
% [xs, xzero, iterations] = subst(f2, 1, 0.000001, 100000 )
% figure
% show_iteration(f2, xs);
