clear opl

for i=1:20,
  x = 10^i;
  opl(i)=x * atan(x) * ( 1/sqrt(1+x^2));
end

figure
plot(opl)

% clear opl
% 
% for i=1:4,
%   x=10^1;
%   fx=x*(pi/2 - atan(x));
%   opl(x)=fx;
% end
% 
% plot(opl);
% 
% clear opl;
% 
% for i=1:4,
%   x=10^1;
%   fx=x * atan(x) * ( 1/sqrt(1+x^2));
%   opl(x)=fx;
% end
% 
% figure
% plot(opl);
% 
% for i=1:4,
%   x=10^1;
%   fx=x * atan(x) * ( 1/sqrt(1+x^2));
%   opl(x)=fx;
% end
% 
% figure
% plot(opl);
