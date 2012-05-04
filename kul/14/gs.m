function [nx,nr]=gs(a,b,x0,xe,n,style)
[ra,ca]=size(a);
x=x0;
r=a*x-b;
nx(1)=norm(x-xe);
nr(1)=norm(r);
for k=2:n+1;
  for i=1:ra;
    x(i)=x(i)-(a(i,:)*x-b(i))/a(i,i);
  end;
  nx(k)=norm(x-xe);
  r=a*x-b;
  nr(k)=norm(r);
end;
semilogy(nr, style);
nx = nx';
nr = nr';