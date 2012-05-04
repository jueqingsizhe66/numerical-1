clear all;
format long;

function y = F(x)
  y1 = x(1)^2 + x(2)^2 - 1;
  y2 = sin(x(1) * (pi/2)) + x(2)^3;
  y = [y1,y2];
end

% f1 = x1^2 + x2^2 - 1 = 0
% f1 dx1 = 2*x1
% f2 dx2 = 2*x2
% f2 = sin(x1 * (pi/2)) + x2^3
% f2 dx1 = cos(x1 * (pi/2))
% f2 dx2 = 3*x2^2
function y = JF(x)
  J = [ 2*x(1), 2*x(2); cos(x(1) * (pi/2)), 3*x(2)^2 ];
  y = J \ x';
end

function [x, R, n] = newtonsys(F, JF, x0, tol, nmax)
  iteration=0;
  err=0;
  do
    % HERE
    % err = 
  until (iteration > nmax or err < tol)
end
