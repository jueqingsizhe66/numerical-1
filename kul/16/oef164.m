clear all;
format long;

function [l]=deelruimte(A,x0,n)
  l = [];
  for j=1:size(x0)(2)
    x = x0(:,j);

    % methode vd machten voor 1 vector
    x=x/norm(x);
    mu = [];
    for i=1:n
      x1=A*x;
      mu(i)=norm(x1);
      if x'*x1<0,
        mu(i) = -mu(i);
      end 
      x=x1/mu(i);
    end

    % keep copy
    l(:,end+1) = mu';
  end
end

W = rand(3,3);
D = diag([1,2,3],0);
T = W*D*inv(W);

deelruimte(T,[1,1;0,1;0,1],10)


% ipv aparte kolommnen -> hele matrix
% norm -> QR Fact
% Q = nieuwe iteratie
% R = benadering van eigenwaarden (diagonaal)
% diagonaal van R -> in matrix
