% oefening 5.3:
% y = 5e^x

function [] = oef53()
  function [fx] = f(x)
    fx = 5 * exp(x);
  end
  
  function [gx] = g(h)
    gx = (f(h) - f(0)) / h;
  end
  
  for i=1:25,
    h = 10^(-1*i);
    opl(i) = g(h);
  end

  semilogy(abs(opl-5)./5);
end
