function [nx,nr]=jacobi(a,b,x0,xe,n,style)
[ra,ca]=size(a);
x=x0;
r=a*x-b;
nx(1)=norm(x-xe);
nr(1)=norm(r);
for k=2:n+1;
  for i=1:ra;
    x(i)=x(i)-r(i)/a(i,i);
  end;   
  nx(k)=norm(x-xe);   % <- norm van de fout
  r=a*x-b;
  nr(k)=norm(r);      % <- norm van resultaat
end;
semilogy(nx, style);
nx = nx';
nr = nr';
