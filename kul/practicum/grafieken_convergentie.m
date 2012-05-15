% generates a plot with the evolution of the relative error of the 
% substitution methods versus the number of iterations
%
% @author: Christophe VG

function grafieken_convergentie

  % function 2 is the only that can calculate the first non-zero root
  [xs, xzero] = subst(@(x,k) atan(x) + k * pi, 1, 10^-6, 10^5, 1 );
  expected = 4.493440945790906;

  % calculate relative error
  iterations = 1:length(xs);
  errors = [];
  for x = xs
    errors(end+1) = abs(expected - x) / expected;
  end
  
  figure;
  semilogy( iterations, errors, '-' );
  legend( 'F(x) = atan(x) + pi' );
  xlabel( '# iteraties' );
  ylabel( '% fout' );
  title( 'Relatieve fout in functie van het aantal iteraties' );
end
