function points=fnplt(f,symbol,interv)
 
%     [points=] fnplt(f[,symbol[,interv]])
%
%  plots the given function  f  (between its extreme breaks by default,
%  else on the optionally specified interval  interv ),
%  using the  symbol  (optionally) specified . 
%  Also returns the plotted points in  points=[x;v]  or  v([1:2],:) .

% C. de Boor / latest change: Feb.25, 1989
% C. de Boor / latest change: December 1, 1990 (add interval specification)

if (f(1)==11), f=sp2pp(f);end
if (nargin>=3), f = ppcut(f,interv); end

[breaks,coefs,l,k,d]=ppbrk(f);
npoints=100;
x=breaks(1)+[0:npoints]*((breaks(l+1)-breaks(1))/npoints);
v=ppual(f,x);

if (nargin==1), symbol='-';end
if (d==1), plot(x,v,symbol);points=[x;v];
else,plot(v(1,:),v(2,:),symbol);points=v([1,2],:);
end

function pp=sp2pp(spline)
 
%     pp = sp2pp(spline)
%
%  converts the  spline  to its  pp  representation on the interval
%                 [t(1),t(n+k)]

% C. de Boor / latest change: Aug.10, 1989


%  Take apart the  spline

[t,a,n,k,d]=spbrk(spline);

%  and augment the knot sequence so that first and last knot each have
%  multiplicity  k .

index=find(diff(t)>0);addl=k-index(1);addr=index(length(index))-n;
if (addl>0|addr>0),
   t=[t(1)*ones(1,addl) t(:)' t(n+k)*ones(1,addr)];
   a=[zeros(d,addl) a zeros(d,addr)];
end

%  From this, generate the pp description. 

inter=find( diff(t)>0 );l=length(inter);
if (k>1)
   ones(d,1)*inter;dinter=ans(:);
   tx=ones(d*l,1)*[2-k:k-1]+dinter*ones(1,2*(k-1));tx(:)=t(tx);
   tx=tx-t(dinter)'*ones(1,2*(k-1));
   a=a(:);d*ones(d,1)*inter+[1-d:0]'*ones(1,l);dinter(:)=ans(:);
   b=d*ones(d*l,1)*[1-k:0]+dinter*ones(1,k);b(:)=a(b);
   c=sprpp(tx,b);
else,a(:,inter);c=ans(:);
end

%   put together the  pp

pp=ppmak([t(inter) t(inter(length(inter))+1)],c,d);


function [breaks,coefs,l,k,d]=ppbrk(pp,print)
 
%        [breaks,coefs,l,k,d] = ppbrk(pp[,print])
%
%  breaks apart the  pp  function into its pieces, and, optionally, prints them.

% C. de Boor / latest change: Feb.25, 1989


if (pp(1)==10),
   d=pp(2);
   l=pp(3);
   breaks=pp(3+[1:l+1]);
   k=pp(5+l);
   coefs=zeros(d*l,k);coefs(:)=pp(5+l+[1:d*l*k]);
   if (nargin>1),breaks,coefs,l,k,d,end
else,
   error('the input array does not seem to describe a pp function')
end


function pc=ppcut(pp,bounds)

%      pc = ppcut(pp,bounds)
%
%  returns the restriction of  pp  to the interval  [bounds(1),bounds(2)]

% C. de Boor / latest change: Feb.25, 1989


xl=bounds(1);xr=bounds(2);if xl>xr,xl=xr;xr=bounds(1);end

[breaks,coefs,l,k,d]=ppbrk(pp);

%  the first pol. piece is  jl , the one responsible for argument  xl 

jl=l;index=find(breaks(2:l)>xl);        % note that the resulting  index  is 
if (~isempty(index)), jl=index(1); end  % shifted down by one because of
                                        % break(2: ...

%  if xl ~= breaks(jl), recenter the pol.coeffs.
x=xl-breaks(jl);
if x ~= 0,
   a=coefs(d*jl+[1-d:0],:);
   for ii=k:-1:2;
      for i=2:ii;
         a(:,i)=x*a(:,i-1)+a(:,i);
      end
   end
   coefs(d*jl+[1-d:0],:)=a;
end

%  the last pol. piece is  jr , the one responsible for argument  xr .
jr=l;index=find(breaks(2:l+1)>=xr);      % note that the resulting  index  is 
if (~isempty(index)), jr=index(1); end  % shifted down by one because of
                                        % break(2: ...

%  put together the cut-down  pp
pc=ppmak([xl breaks(jl+1:jr) xr], coefs(d*(jl-1)+[1:d*(jr-jl+1)],:),d);


function v=ppual(pp,xx)
%
%      v = ppual(pp,xx)
%
%  returns the value of the pp function  pp  at  xx.

% C. de Boor / latest change: June 19, 1989
% C. de Boor / latest change: December 1, 1990 (correct misprint in last line)


%  if necessary, sort  xx 
xs=xx(:)';ix=length(xs);tosort=0;
if (length(find(diff(xs)<0))>0),
   tosort=1;[xs,indx]=sort(xs);
end

%  take apart  pp
[x,c,l,k,d]=ppbrk(pp);

% for each data point, compute its breakpoint interval
index=max([sorted(x(1:l),xs);ones(1,ix)]);

% now go to local coordinates
xs=xs-x(index);
% ... and apply nested multiplication:
if (d>1),
   ones(d,1)*xs; xs=ans(:)';
   1+d*ones(d,1)*index+[-d:-1]'*ones(1,ix); index=ans(:);
end
vv=c(index,1)';
for i=2:k,
   vv = xs.*vv + c(index,i)';
end

v=zeros(d,length(xx));v(:)=vv;
if tosort>0,[junk,indx]=sort(indx); v=v(:,indx);end

function [knots,coefs,n,k,d]=spbrk(spline,print)

%     [knots,coefs,n,k,d] = spbrk(spline[,print])
%
%  breaks apart a spline and, optionally, prints its parts.

% C. de Boor / latest change: Feb.25, 1989


if (spline(1)~=11),
   error('the input array does not seem to describe a spline')
else,
   d=spline(2);n=spline(3);
   coefs=zeros(d,n);coefs(:)=spline(3+[1:d*n]);
   k=spline(4+d*n);knots=spline(4+d*n+[1:k+n]);
   if (nargin>1), knots,coefs,n,k,d,end
end


function [v,b] = sprpp(tx,a)
%
%    [v,b] = sprpp(tx,a)
%
%  uses knot insertion to derive from the B-spline coefficients
%  a(.,:)  relevant for the interval  [tx(.,k-1), tx(.,k)]  (with respect
%  to the knot sequence  tx(.,1:2(k-1)) )  the polynomial coefficients
%   v(.,1:k)  relevant for the interval  [0,tx(.,k)] . Here, 
%
%   [ ,k] := size(a) . Also, it is assumed that  tx(.,k-1) <= 0 < tx(.,k) .
%
%  In the process, uses repeated insertion of  0  to derive, in  b(.,1:k) ,
%  the B-spline coefficients relevant for the interval  [0,tx(.,k)]  (with 
%  respect to the knot sequence  [0,...,0,tx(.,k:2*(k-1))]) .

% C. de Boor / latest change: Feb.25, 1989


[junk,k]=size(a); km1=k-1;b=a;
for r=1:km1;
   for i=1:k-r;
      b(:,i) =(tx(:,i+km1).*b(:,i)-tx(:,i+r-1).*b(:,i+1))./...
               (tx(:,i+km1)-tx(:,i+r-1));
   end
end

%  Use differentiation at  0  to generate the derivatives

v=b;
for r=2:k;
   factor = (k-r+1)/(r-1);
   for i=k:-1:r;
      v(:,i) = (v(:,i) - v(:,i-1))*factor./tx(:,i+k-r);
   end
end

v = v(:,k:-1:1);

function pp=ppmak(breaks,coefs,d)
%
%     pp = ppmak(breaks,coefs[,d])
%
%  puts together a pp function from the breaks and coefficients input or
%  requested. 
% 
%    If  d  is not explicitly given, program expects  coefs(d,(k,l)) ,
%  and infers  l := length(breaks)-1  and then  k := (# cols(coefs))/l .
% 
%    If  d  is explicitly given, program expects  coefs((d,l),k) , and
%  infers  k := # cols(coefs), and  l := (# rows(coefs))/d .

% C. de Boor / latest change: June 1, 1989


if (nargin==0);
   breaks=input('Give the (l+1)-vector of breaks  >');  
   coefs=input('Give the (d by (k*l)) matrix of local pol. coefficients  >');
end
if (nargin<3),
   [d,kl]=size(coefs);
   if (d==0),
      error('The coefficient sequence is empty!')
   end
   l=length(breaks)-1;k=fix(kl/l);
   if (k<=0)|(k*l~=kl);
      fprintf('The given number %.0f of polynomial pieces is incompatible',l)
      fprintf(' with the total number %.0f of coefficients supplied!\n',kl)
      error('')
   elseif (~isempty(find(diff(breaks)<0))),
      error('The breakpoint sequence should be nondecreasing!')
   else
      % the pp-format expects coefs in array  (d*l) by k, while the standard
      % input supplies them in an array d by (k*l) . This requires the
      % following shuffling, from  D+d(-1+K + k(-1+L))=D-d +(K-k)d + dkL
      % to  D+d(-1+L + l(-1+K)=D-d +(L-l)d + dlK .
      c=coefs(:);([1-k:0]'*ones(1,l)+k*ones(k,1)*[1:l])';
      coefs=[1-d:0]'*ones(1,kl)+d*ones(d,1)*(ans(:)');
      coefs(:)=c(coefs);
   end
else
   [dl,k]=size(coefs); l = dl/d;
   if (l+1~=length(breaks)|dl~=l*d), 
      error('input arguments have incompatible sizes.'),return,end
end
pp=[10 d l breaks(:)' k coefs(:)'];


function pointer=sorted(knots, points)
 
%        pointer=sorted(knots, points)
%
% given  o r d e r e d  sequences  knots  and  points,  returns the index 
% sequence  pointer  (a  r o w  vector)  for which  
%
%   pointer(j) = #{ i : knots(i)  <=  points(j) },  all  j .
%
% If the input is  n o t  o r d e r e d , the output will not mean much.

% C. de Boor / latest change: May 27, 1989

diff(sort([points(:)' knots(:)'])); tol=min(ans(find(ans>0)))/3;
ll=length(points)+length(knots);
[junk,index]=sort([knots(:)' points(:)']+[1:ll]*tol/ll);
pointer=find(index>length(knots))-[1:length(points)];
