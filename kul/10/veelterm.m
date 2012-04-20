function y=veelterm(xi,yi,x)

points=[xi;yi];
%
n=size(xi);
n=n(2)-1;

coef=polyfit(xi,yi,n);


y=polyval(coef,x);
