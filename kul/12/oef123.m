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

% f1  = x^2 - 2 = 0
% f1' = 2x
function [result] = f1(x)
  result = x - ( ( x^2 - 2 ) / (2*x) );
end

% f2  = 1 - ( 2 / x^2 )
% f2' = 4/x^3
function [result] = f2(x)
  result = x - ( (1 - (2 / x^2)) / (4/x^3) );
end

% f3  = x - 2/x
% f3' = 1 + 2 = 3
function [result] = f3(x)
  result = x - ((x-2/x)/3);
end

% f4  = x^4 - 4*x^2 + 4
% f4' = 4*x^3 - 8*x
function [result] = f4(x)
  result = x - ( (x^4 - 4*x^2 + 4) / (4*x^3 - 8*x) );
end

% f5  = x^4 - 4*x^2 + 4
% f5' = 4*x^3 - 8*x
function [result] = f5(x)
  result = x - 2 * ( (x^4 - 4*x^2 + 4) / (4*x^3 - 8*x) );
end

steps = 30;
startA = 2;
startB = 0.6;
[s1a, d1a] = subst(startA, steps, 'f1');
[s1b, d1b] = subst(startB, steps, 'f1');
[s2a, d2a] = subst(startA, steps, 'f2');
[s2b, d2b] = subst(startB, steps, 'f2');
[s3a, d3a] = subst(startA, steps, 'f3');
[s3b, d3b] = subst(startB, steps, 'f3');
[s4a, d4a] = subst(startA, steps, 'f4');
[s4b, d4b] = subst(startB, steps, 'f4');
[s5a, d5a] = subst(startA, steps, 'f5');
[s5b, d5b] = subst(startB, steps, 'f5');

result = [s1a, s1b, s2a, s2b, s3a, s3b, s4a, s4b, s5a, s5b]
