function [xk,muk,error]=machten2(A,x0,n)
% methode van de machten toegepast op matrix A met startwaarde x0
% n iteratiestappen
% output: alle xk en muk en de fouten tov de laatste muk
% ook de muk en de fouten worden geplot

% x0=x0/norm(x0);
for i=1:n
  x1=A*x0;
  % mu(i)=norm(x1);
  mu(i)=x1'/x0';    % mu(i) = benadering van eigenwaarde in die stap
  if x0'*x1<0,
      mu(i) = -mu(i);
  end 
  x0=x1;%/mu(i);
end
xk=x0;
muk=mu(n);
error=abs(mu-muk);
error=error';
plot(1:n,mu,'+',1:n,error,'*')
