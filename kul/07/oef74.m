n = 3;
p = 2;
M = triu(rand(n,n+p));
M(n,1:n-1) = rand(1,n-1)
% M =
% 
%  Columns 1 through 4:
% 
%    0.593723949297064   0.480494101527891   0.007202938907275   0.941402589038520
%    0.000000000000000   0.860828621558504   0.793015220336173   0.651742722349230
%    0.447289036490060   0.990235942028156   0.433791093466120   0.474133472759982
% 
%  Column 5:
% 
%    0.926367218520164
%    0.410285405255351
%    0.730631782712763

% voorbeeld: 1e en 3e rij
x = M(1,1);
y = M(3,1);
% c = x / sqrt(x^2 + y^2);
% s = y / sqrt(x^2 + y^2);
% G = [ c, s; s, -c ];
G = givens(x, y);
M([1 3],:) = G*M([1 3],:)
% M =
% 
%    7.4335e-01   9.7962e-01   2.6677e-01   1.0372e+00   1.1795e+00
%    0.0000e+00   8.6083e-01   7.9302e-01   6.5174e-01   4.1029e-01
%    0.0000e+00  -5.0179e-01  -3.4214e-01   1.8776e-01  -2.6151e-02

n = 5;
p = 1;
R = triu(rand(n,n+p));
R(n,1:n-1) = rand(1,n-1);
O = M;
Q = eye(n);
for i=1:n-1,
  x = M(i,i);
  y = M(n,i);
  G = givens(x, y);
  R([i n],:) = G*R([i n],:)
  Q([i n],:) = G*Q([i n],:)
end

% R =
% 
%    7.5422e-02   5.4450e-02   2.0806e-01   3.5558e-01   8.4149e-01   1.7654e-01
%    0.0000e+00   2.9599e-01   7.7493e-01   8.8934e-01   1.3006e-01   6.3270e-01
%    0.0000e+00   0.0000e+00   8.4060e-01   7.4333e-01   6.8358e-02   3.2315e-01
%    8.1892e-17   7.6320e-17   7.9889e-17   7.7729e-02   6.3978e-01   7.6268e-01
%    8.2437e-01   7.6828e-01   8.0421e-01   3.2459e-01   4.0073e-02   2.8897e-02
% 
% Q =
% 
%    1.0000e+00   0.0000e+00   0.0000e+00   0.0000e+00   1.0919e-19
%    0.0000e+00   1.0000e+00   0.0000e+00   0.0000e+00   0.0000e+00
%    0.0000e+00   0.0000e+00   1.0000e+00   0.0000e+00   0.0000e+00
%   -1.0847e-35   0.0000e+00   0.0000e+00   1.0000e+00   9.9339e-17
%   -1.0919e-19   0.0000e+00   0.0000e+00  -9.9339e-17   1.0000e+00

[Q,R] = qr(O)
% Q =
% 
%    1.0000e+00   2.3851e-17  -6.1591e-18   1.3124e-19  -1.0919e-19
%   -2.3851e-17   1.0000e+00   1.1102e-16   0.0000e+00  -1.7347e-18
%    6.1591e-18  -1.1102e-16   1.0000e+00   4.3368e-19   4.3368e-19
%   -1.3124e-19   1.7347e-18  -4.3368e-19   1.0000e+00  -4.4410e-16
%    1.0919e-19  -1.7347e-18   0.0000e+00   5.5511e-16   1.0000e+00
% 
% R =
% 
%    5.6337e-01   5.0977e-01   9.8887e-02   4.1675e-01   3.0495e-01   8.5236e-01
%    0.0000e+00   6.3404e-01   2.8892e-01   8.5625e-01   5.6494e-01   6.3198e-01
%    0.0000e+00   0.0000e+00   8.9722e-01   6.4350e-01   8.9456e-01   4.1935e-01
%    0.0000e+00   0.0000e+00   0.0000e+00   1.1176e+00   5.1891e-01   1.2535e-01
%    0.0000e+00   0.0000e+00   0.0000e+00   0.0000e+00   4.0533e-02  -4.0923e-02

