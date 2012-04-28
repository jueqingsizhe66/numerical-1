clear all;
format long;

function [result, changes] = subst(current, steps, func)
  out  = [];
  diff = [];
  for x=1:steps,
    new = feval(func, current);
    out(end+1) = new;
    diff(end+1) = new - current;
    current = new;
  end
  result = out';
  changes = diff';
end

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
% f3' = 1/cos(x)^2 - 1
function [result] = f3(x)
  result = x - ( (tan(x) - x) / ((1/cos(x)^2) - 1) );
end

% f4  = atan(x) - x + k*pi (using NR)
% f4' = -x^2/(x^2+1)
function [result] = f4(x)
  k=0;
  result = x - ( (tan(x) - x + k*pi) / -(x^2/(x^2+1) ) );
end

function [X,Y] = iterate_lines(startx, xs)
  Xs = [startx];
  Ys = [0];
  for x = xs
    Xs(end+1) = Xs(end);
    Ys(end+1) = x;
    
    Xs(end+1) = x;
    Ys(end+1) = x;
  end
  X = Xs;
  Y = Ys;
end

steps=250;
start = 0.15;
[s, d] = subst(start, steps, 'f4');

result = [s,d];

[X,Y] = iterate_lines(start, s');

figure;
hold on;
plot( [0,0], [-100,100], "-0" );
plot( [-100,100], [0,0], "-0" );
plot( [-10,10], [-10,10], "-3" );
plot( X, Y, "-2" );
x = 0:0.1:60;
y = [];
for every_x = x
  y(end+1) = f4(every_x);
end
plot( x, y );
plot( x, x );
axis([-5,15,-5,15]);
refresh();
x = s(end);
y = f4(x);
plot( [x-.1,x+.1, x+.1, x-.1], [y-.1,y-.1,y+.1,y+.1], "+4");

x = 0.15;
y = 0;
plot( [x-.1,x+.1, x+.1, x-.1], [y-.1,y-.1,y+.1,y+.1], "+5");