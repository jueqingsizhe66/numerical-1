clear all; % clears all previous cached variables

% configuration
global start = -5;
global stop  = 5;
global step  = 0.01;

% the function, accepts single values or vectors of values
function [fx] = f(x),
  if( isscalar( x ) )
    fx = x / (1+x^2);
  else
    Y = [];
    for i=x
      Y(end+1) = f(i);
    end
    fx = Y;
  endif
end

% interpolation sets for step = 2, 1 and 0.5
global xs2  = start:2:stop;    global fs2  = f(xs2);
global xs1  = start:1:stop;    global fs1  = f(xs1);
global xs05 = start:0.5:stop;  global fs05 = f(xs05);

% generate and plot data consisting of the approximation error for given func
function generate_and_plot(func)
  global start stop step xs2 xs1 xs05 fs2 fs1 fs05

  x = start;
  for i=1:(stop-start)/step
    X(i) = x;
    opl_f(i)    = f(x);
    diff_v2(i)  = abs(opl_f(i) - feval(func, xs2,  fs2,  x));
    diff_v1(i)  = abs(opl_f(i) - feval(func, xs1,  fs1,  x));
    diff_v05(i) = abs(opl_f(i) - feval(func, xs05, fs05, x));
    x = x + step;
  end

  % plot on log scale
  figure
  hold on

  semilogy(X, diff_v2,  '-1');
  semilogy(X, diff_v1,  '-2');
  semilogy(X, diff_v05, '-3');

  legend ([func, '/2'], [func,'/1'], [func,'/0.5']);

  hold off
end

generate_and_plot('veelterm');
generate_and_plot('spline');
