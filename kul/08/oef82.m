A = 100;
X = linspace(0, 10, A);
Y = linspace(0, 10, A);

function [fxy] = f(x,y)
  fxy = x * sin( x * y );
end

for x = 1:A,
  for y = 1:A,
    Z(x,y) = f(X(x),Y(y));
  end
end

figure
mesh( X, Y, Z )

figure
surf( X, Y, Z )
