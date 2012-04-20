clear all; % clears all previous cached variables / allows for local functions

function [fx] = f(x)
  fx = 20 * tanh(1/ (20 * (x-1)^2));
end

% transformed function
function [tx] = t(x)
  tx = 1 / f(x);
end

function [fsx] = fs(Xs)
  Y = [];
  for x=Xs
    Y(end+1) = f(x);
  end
  fsx = Y;
end

function [tsx] = ts(Xs)
  Y = [];
  for x=Xs
    Y(end+1) = t(x);
  end
  tsx = Y;
end

start = 0;
stop  = 2;

% interpolatiepunten
XI = start:0.2:stop;
YI = fs(XI);
TYI = ts(XI);

% calc points
step  = 0.01;
x = start;
for i=1:(stop-start)/step
  X(i) = x;
  opl_f(i) = f(x);
  opl_v(i) = veelterm(XI, YI,  x);
  opl_s(i) = spline  (XI, YI,  x);
  opl_t(i) = 1 / veelterm(XI, TYI, x);
  x = x + step;
end

figure
hold on

plot(X, opl_f, "+");    % blue
plot(X, opl_v, "-1");   % red
plot(X, opl_s, "o2");   % green
plot(X, opl_t, "x4");   % purple
legend ("f", "veelterm","spline","transformatie");

hold off
