function spline=spmak(knots,coefs)

%       spline = spmak(knots,coefs)
%
%  puts together a spline from the knots and coefficients input or
%  requested.  coefs  is expected in the form  coefs(d,n)  with  d  the number
%  of components (usually 1,2 or 3) in each of the  n  spline coefficient 
%  supplied.  The  order of the spline is inferred as  k := length(knots) - n .

% Carl de Boor / latest change: December 9, 1989
   
if (nargin==0);
   knots=input('Give the vector of knots  >');  
   coefs=input('Give the array of B-spline coefficients  >');	
end
[d,n]=size(coefs);
if (d==0),
   error('The coefficient sequence is empty!')
end
if (d>n), 
   coefs=coefs';[d,n]=size(coefs);
   fprintf('spmak took the rows (rather than the columns) of the input \n')
   fprintf('coefficient array to be the coefficients.\n')
   end

k=length(knots)-n;
if (k<=0),
   error('There should be more knots than coefficients!')
end
if (~isempty(find(diff(knots)<0))),
   error('The knot sequence should be nondecreasing!')
end

spline=[11 d n coefs(:)' k knots(:)'];
