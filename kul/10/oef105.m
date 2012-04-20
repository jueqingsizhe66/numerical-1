clear all; % clears all previous cached variables

% the function
function [fx] = f(x),
  fx = x / (1+x^2);
end

% performs f on a list of values, returning a list of corresponding results
function [fsx] = fs(Xs),
  Y = [];
  for x=Xs
    Y(end+1) = f(x);
  end
  fsx = Y;
end

% interpollation sets for step = 2, 1 and 0.5
fs2 = fs(-5:2:5);
fs1 = fs(-5:1:5);
fs05= fs(-5:0.5:5);

step = 0.01;
start = -5;
stop  = 5;
x = start;
for i=1:(stop-start)/step
  X(i) = x;
  opl_f(i)   = f(x);
  diff_v2(i)  = abs(veelterm(-5:2:5,   fs2,  x) - opl_f(i));
  diff_v1(i)  = abs(veelterm(-5:1:5,   fs1,  x) - opl_f(i));
  diff_v05(i) = abs(veelterm(-5:0.5:5, fs05, x) - opl_f(i)); 
  x = x + step;
end

figure
hold on

semilogy(X, diff_v2,  "+1");
semilogy(X, diff_v1,  "+2");
semilogy(X, diff_v05, "+3");

hold off
