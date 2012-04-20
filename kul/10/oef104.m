clear all; % clears all previous cached variables
DUMMY=100; % dummy to allow local function

function [fx] = f(x),
  fx = x / (1+x^2);
end

IX = -5:1:5;
for x=-5:5,
  IY(x+6) = f(x);
end

step = 0.01;
start = -5;
stop  = 5;
x = start;
for i=1:(stop-start)/step
  X(i) = x;
  opl_f(i) = f(x);
  opl_v(i) = veelterm(IX, IY, x); 
  opl_s(i) = spline(IX, IY, x);
  x = x + step;
end

figure
hold on

plot(X, opl_f, "+")
plot(X, opl_v, "+2")
plot(X, opl_s, "+1")

hold off
