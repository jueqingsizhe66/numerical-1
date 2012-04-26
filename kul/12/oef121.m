clear all;
format long;

function [result, changes] = subst(current, steps, func)
  out  = [];
  diff = [];
  for x=1:steps,
    new = feval(func, current);
    out(end+1) = new;
    diff(end+1) = new - current;
    current = new;
  end
  result = out';
  changes = diff';
end

function [result] = f1(x)
  result = 1 - (x)^2;
end

function [result] = f2(x)
  result = (3*x^2 - x + 1) / (4*x);
end

function [result] = f3(x)
  result = ( 4 - x ) / ( 4*x + 3 );
end

function [result] = f4(x)
  result = x - (( x^2 + x - 1 ) / ( 2*x + 1 ));
end

steps = 100;
start = 0.7;
[s1, d1] = subst(start, steps, 'f1');      % diverges
[s2, d2] = subst(start, steps, 'f2');      % converges in 15 steps / monotone
[s3, d3] = subst(start, steps, 'f3');      % converges in 72 steps 
[s4, d4] = subst(start, steps, 'f4');      % converges in  4 steps / monotone 

result = [ [1:steps]', s1, d1, s2, d2, s3, d3, s4, d4 ];

figure;
hold on;

plot(s2, '-2' );
plot(s3, '-3' );
plot(s4, '-4' );

legend('f2','f3','f4');
hold off;

