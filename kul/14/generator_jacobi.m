% bepaal generatormatrix uit matrix voor Jacobi
function [G] = generator_jacobi(A)
  [L,U,D] = split_matrix(A);
  M=D;
  N=-(L+U);
  G=inverse(M)*N;
end
