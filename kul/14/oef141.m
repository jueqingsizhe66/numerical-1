clear all;
format long;

A = [ 4, -1, 0; -1, 4, -1; 0, -1, 3];
b = [ 1, 0, 1 ]';
x0 = [ 1, 1, 1]';
xe = A \ b;
n = 40;

% render
figure;
hold on;
jacobi(A, b, x0, xe, n, '-1');
gs(A, b, x0, xe, n, '-2');
legend( 'jacobi', 'gs' );

spectraal_jacobi = spectraal_radius(A, 'generator_jacobi' )
spectraal_gs     = spectraal_radius(A, 'generator_gs'     )
