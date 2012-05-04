% bepaal generatormatrix uit matrix voor Gauss Seidel
function [G] = generator_gs(A)
  [L,U,D] = split_matrix(A);
  M=L+D;
  N=-U;
  G=inverse(M)*N;
end
