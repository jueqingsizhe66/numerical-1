radius=10;

function [X,Y] = cirkel(x,y,r)
  step=0.1;
  for a = 1:2*pi/step,
    X(a) = cos(a*step) * r + x;
    Y(a) = sin(a*step) * r + y;  
  end
end

figure
[X,Y] = cirkel(5,5,radius);
plot(X,Y)
