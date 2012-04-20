function [y,z] = vierkant(a,b,c)

D = sqrt(b^2-4*a*c);

% versie 1
y(1) = (-b + D)/(2*a);
y(2) = (-b - D)/(2*a);

% versie 2
if ( b >= 0 )
   z(1) = (-b-D)/(2*a);
else
   z(1) = (-b+D)/(2*a);
end
z(2) = c/(a*z(1));

% original : transpose
% y = y';
% z = z';
