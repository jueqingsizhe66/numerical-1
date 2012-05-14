clear all;
format long;

c1 = [1, -2, -3];
r1 = roots(c1);

dt = 10^-6;

c2 = [1, -2, -3+dt];
r2 = roots(c2);

% p(x)  = x^2 - 2x + t
% p'(x) = 2x - 2
% p'(c) = p'(3) = 4
% dp(x) = _p(x) - p(c) = dt = constante fout
% dc = - dp(c) / p'(c) = -dp(3) / p'(3) = -dt / p'(c)
dc = - 10^-6 / 4

c3 = [1, -2, 1];
r3 = roots(c3)

c4 = [1, -2, 1+dt];
r4 = roots(c4)

% dc = ( - (dp(c)*m!) / (pm() ) ^ (1/m)
% m = 2
dc2 = ( - dt * 2 ) ^ (1/2)

% niet eps!
sdc2 = ( (2*10^-6/1) * 2  ) ^ (1/2)

fout = abs(r3-r4)
