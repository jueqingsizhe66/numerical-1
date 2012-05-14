function show_iteration(F, k, steps, xmin, xmax, ymin, ymax)
  axes = gca;
  
  [X,Y] = generate_iteration_lines(steps);
  hold on;
  plot( axes, [xmin,xmax], [0,0], '-k' );  % x-axis
  plot( axes, [0,0], [ymin,ymax], '-k' );  % y-axis
  plot( axes, [min(xmin,ymin),max(xmax,ymax)], [[min(xmin,ymin),max(xmax,ymax)]], '-b' ); % bisect
  plotLines = plot( X, Y, '-c' );

  x = xmin:0.1:xmax;
  y = [];
  for every_x = x
    y(end+1) = feval(F, every_x, k);
  end
  plot( axes, x, y, '-b' );
  axis([xmin,xmax,ymin,ymax]);
  plotBegin = plot( axes, [steps(1)], [0], '+g');
  plotEnd = plot( axes, [steps(end)], [feval(F, steps(end),k)], '+r');

  legend( [plotLines, plotBegin, plotEnd], 'iteratieprocess', 'startpunt', 'eindpunt', 'location', 'southwest' );
end
