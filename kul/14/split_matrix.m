% splits matrix in L, U, D
function [L,U,D] = split_matrix(A)
  L=tril(A,-1);
  U=triu(A,1);
  D=A-L-U;
end
