clear all;
format long;

A=[1, 0.5, 2; 2, 0, 3; -1, 2, 4];
x0=[1, 1, 1]';

function [l,d] = raleigh(a,x0,n)
  q = x0;
  prev = 0;
  for i=1:n,
    lambda = (q'*a*q)/(q'*q);
    q1 = inv(lambda*eye(size(a,1))-a)*q;
    l(i) = norm(q)/norm(q1);
    if ((q(1)<0)&(q1(1)<0))|((q(1)>0)&(q1(1)>0))
      l(i) = -l(i);
    end
    d(i) = l(i) - prev;
    prev = l(i);
    q = q1/q1(1);
  end
  l = (l+lambda)';
  d = d';
end

[l,d] = raleigh(A,x0,10)
