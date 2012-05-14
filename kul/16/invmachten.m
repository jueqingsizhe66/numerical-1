function [l] = invmachten(a,x0,lambda,n)
% methode van de machten toegepast op matrix A met startwaarde x0
% en schatting van de eigenwaarde lambda
% n iteratiestappen
% output: de opeenvolgende waarden voor de berekende eigenwaarde

q = x0;
for i=1:n,
   q1 = inv(lambda*eye(size(a,1))-a)*q;
   l(i) = norm(q)/norm(q1);
   if ((q(1)<0)&(q1(1)<0))|((q(1)>0)&(q1(1)>0))
      l(i) = -l(i);
   end 
   q = q1/q1(1);
end
l = (l+lambda)';
