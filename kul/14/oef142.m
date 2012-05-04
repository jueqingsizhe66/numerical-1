clear all;
format long;

A = [ 3, -2, 2; -2, 3, -2; 2, -2, 3];
b = [ 3, -1, 3 ]';
x0a = [ 3, 2, 0]';
x0b = [ 3.0001, 2, 0]';
xe = A \ b;
n = 40;

% render
figure;
hold on;
[nxa,nra] = jacobi( A, b, x0a, xe, n, '-1' );
[nxb,nrb] = jacobi( A, b, x0b, xe, n, '-2' );
% r = [nxa, nra, nxb, nrb]
legend( 'jacobi 1', 'jacobi 2' );

spectraal_radius = spectraal_radius( A, 'generator_jacobi' )

% fout = c1*eig1 + c2*eig2 + c3*eig3
% spectraal_radius =  1.33333333333333
% eig1 > 0 -> divergeert fout
