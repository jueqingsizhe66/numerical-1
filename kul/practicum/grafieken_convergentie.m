% generates a plot with the evolution of the relative error of the 
% substitution methods versus the number of iterations
%
% @author: Christophe VG

function grafieken_convergentie

  % function 2 & 4 are the only that can calculate the first non-zero root
  [xs2, xzero2] = subst(@(x,k) atan(x) + k * pi, 1, 10^-16, 10^5, 1 );
  [xs4, xzero4] = subst(@(x,k) x - (atan(x) - x + k*pi) / (1/(x^2+1) - 1), 1, 10^-16, 10^5, 1 );

  expected = 4.493440945790906;

  % calculate relative errors
  
  % determine max iterations
  iterations2 = length(xs2);
  iterations4 = length(xs4);
  iterations = 1:max(iterations2, iterations4);
  
  % generate relative errors
  errors2 = [];
  for x = xs2
    errors2(end+1) = abs(expected - x) / expected;
  end

  % pad if needed
  if iterations2 < iterations4 
    for i = iterations2:(iterations4-1)
      errors2(end+1) = errors2(end);
    end
  end

  % generate relative errors
  errors4 = [];
  for x = xs4
    errors4(end+1) = abs(expected - x) / expected;
  end

  % pad if needed
  if iterations4 < iterations2
    for i = iterations4:(iterations2-1)
      errors4(end+1) = errors4(end);
    end
  end
  
  figure;
  semilogy( iterations, errors2, '-r' );
  hold on;
  semilogy( iterations, errors4, '-g' );
  legend( 'substitutiemethode : F(x,k) = atan(x) + k * pi (k=1)', 'Newton-Raphson: f(x,k) = atan(x) - x + k * pi (k=1)');
  xlabel( '# iteraties', 'fontsize', 13  );
  ylabel( '% fout', 'fontsize', 13 );
  title( 'Relatieve fout in functie van het aantal iteraties', 'fontsize', 14 );
end
