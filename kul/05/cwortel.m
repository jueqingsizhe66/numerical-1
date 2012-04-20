% cwortel
% berekent een vierkantswortel x+iy van een complex getal a+ib
% hint: a+ib = (x+iy)^2
%            = x^2-y^2 + 2xyi
%       x^2 - y^2 - a = 0
%       2xy - b = 0
%       x = b/2y
%       - y^2 + b^2/4y^2 - a = 0
%       -4 y^4 + b^2 - 4ay^2 = 0
%       t = y^2
%       -4t^2 - 4at + b^2 = 0

function [x1,y1,x2,y2] = cwortel(a,b)

[d,t] = vierkant( -4, -4*a, b^2 );

if( d(1) > 0 )
  y1 = sign(b) * sqrt(d(1));
else
  y1 = sign(b) * sqrt(d(2));
end
if( t(1) > 0 )
  y2 = sign(b) * sqrt(t(1));
else
  y2 = sign(b) * sqrt(t(2));
end

x1 = b/(2*y1);
x2 = b/(2*y2);
