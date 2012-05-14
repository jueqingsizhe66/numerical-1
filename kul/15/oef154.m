clear all;
format long;

p = poly([2,2,2,2,2,2])
r = roots(p)

% plot(real(r), imag(r), '*')

dc = ((eps/2) * (2^6+2^5+2^4+2^3+2^2+2^1+1))^(1/6)
