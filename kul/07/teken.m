function c=teken(a,b,c)
echo off
b=b';
% a is een 2x2-matrix
% b is een 2x1-vector
% teken plot de rechten  a11*x+a12*y=b1
%                        a21*x+a22*y=b2
% in volle lijnen
if det(a)==0
   if a(1,2)==0
     y=[-5:5];
     x=b(1)/a(1,1);
     z=b(2)/a(2,1);
     x1=[x x x x x x x x x x x];
     x2=[z z z z z z z z z z z];
     plot(x1,y,x2,y);
     pause
   else
     x=[-5,5];
     y1=b(1)/a(1,2)-x*a(1,1)/a(1,2);
     y2=b(2)/a(2,2)-x*a(2,1)/a(2,2);
     plot(x,y1,x,y2);
     pause
   end;
else
   x1=(b(1)*a(2,2)-b(2)*a(1,2))/det(a);
   x=[round(x1)-5:round(x1)+5];
   xx=[x1 x1 x1 x1 x1 x1 x1 x1 x1 x1 x1];
   if a(1,2)==0
     xa=xx;
     ya=[-5:5]
     bv1=1/a(1,1);
     x1a=x;
     x1b=x;
     y1a=b(1)-(a(1,1)+1)*x;
     y1b=-b(1)+(a(1,1)-1)*x;
   else
     xa=x;
     ya=b(1)/a(1,2)-x*a(1,1)/a(1,2)
     bv1=1/a(1,2);
     if a(1,2)==1
        y1a=(b(1)-(a(1,1)+1)*x)/2;
        y1b=[-5:5];
        f=b(1)/(a(1,1)-1);
        x1a=x;
        x1b=[f f f f f f f f f f f];
        x3a=x;
        y3a=((b(1)+1)-(a(1,1)+1)*x)/2;
        g=(b(1)-1)/(a(1,1)-1);
        x3b=[g g g g g g g g g g g];
        y3b=[-5:5];
     elseif a(1,2)==-1
        f=b(1)/(a(1,1)-1);
        x1a=[f f f f f f f f f f f];
        x1b=x;
        y1a=[-5:5];
        y1b=(b(1)-(a(1,1)-1)*x)/(-2);
        g=(b(1)+1)/(a(1,1)+1);
        x3a=[g g g g g g g g g g g];
        y3a=[-5:5];
        x3b=x;
        y3b=((b(1)-1)-(a(1,1)-1)*x)/(-2);
     else
        x1a=x;
        x1b=x;
        y1a=(b(1)-(a(1,1)+1)*x)/(a(1,2)+1);
        y1b=(b(1)-(a(1,1)-1)*x)/(a(1,2)-1);
        x3a=x;
        x3b=x;
        y3a=((b(1)+1)-(a(1,1)+1)*x)/(a(1,2)+1);
        y3b=((b(1)-1)-(a(1,1)-1)*x)/(a(1,2)-1);
     end;
   end;
   if a(2,2)==0
     xb=xx;
     yb=[-5:5]
     bv2=1/a(2,1);
     x2a=x;
     x2b=x;
     y2a=b(2)-(a(2,1)+1)*x;
     y2b=b(2)-(a(2,1)-1)*x;
   else
     xb=x;
     yb=b(2)/a(2,2)-x*a(2,1)/a(2,2)
     bv2=1/a(2,2);
     if a(2,2)==1
        x2a=x;
        f=b(2)/(a(2,1)-1);
        x2b=[f f f f f f f f f f f];
        y2a=(b(2)-(a(2,1)+1)*x)/2;
        y2b=[-5:5];
        x4a=x;
        y4a=((b(2)+1)-(a(2,1)+1)*x)/2;
        g=(b(2)-1)/(a(2,1)-1);
        x4b=[g g g g g g g g g g g];
        y4b=[-5:5];
     elseif a(2,2)==-1
        f=b(2)/(a(2,1)+1);
        x2a=[f f f f f f f f f f f];
        x2b=x;
        y2a=[-5:5];
        y2b=(b(2)-(a(2,1)-1)*x)/(-2);
        g=(b(2)+1)/(a(2,1)+1);
        x4a=[g g g g g g g g g g g];
        y4a=[-5:5];
        x4b=x;
        y4b=((b(2)-1)-(a(2,1)-1)*x)/(-2);
     else
        x2a=x;
        x2b=x;
        y2a=(b(2)-(a(2,1)+1)*x)/(a(2,2)+1);
        y2b=(b(2)-(a(2,1)-1)*x)/(a(2,2)-1);
        x4a=x;
        x4b=x;
        y4a=((b(2)+1)-(a(2,1)+1)*x)/(a(2,2)+1);
        y4b=((b(2)-1)-(a(2,1)-1)*x)/(a(2,2)-1);
     end;
   end;
   bve=[bv1 bv1 bv1 bv1 bv1 bv1 bv1 bv1 bv1 bv1 bv1];
   bvt=[bv2 bv2 bv2 bv2 bv2 bv2 bv2 bv2 bv2 bv2 bv2];
   plot(xa,ya,xb,yb);
     pause
   if c==2
      plot(xa,ya,'r',xb,yb,'g',x1a,y1a,':r',x1b,y1b,':r',x2a,y2a,':g',x2b,y2b,':g');
     pause
   end;
   if c==1
      if a(1,2)==0
          x1a=xa+bve;
          x1b=xa-bve;
          y1a=ya;
          y1b=ya;
      else
          x1a=xa;
          x1b=xa;
          y1a=ya+bve;
          y1b=ya-bve;
      end;
      if a(2,2)==0;
          x2a=xb+bvt;
          x2b=xb-bvt;
          y2a=yb;
          y2b=yb;
      else
          x2a=xb;
          x2b=xb;
          y2a=yb+bvt;
          y2b=yb-bvt;
      end;
      plot(xa,ya,'r',xb,yb,'g',x1a,y1a,':r',x1b,y1b,':r',x2a,y2a,':g',x2b,y2b,':g');
     pause
   end;
    if c==3
     plot(xa,ya,'r',xb,yb,'g',x3a,y3a,':r',x3b,y3b,':r',x4a,y4a,':g',x4b,y4b,':g');
     pause
   end;
   end;
end;
