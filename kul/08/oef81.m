X = [ 2, 3, 5, 6, 8 ];
Y = [ 75, 86, 82, 70, 40 ];

Xs = load( "-ascii", "x_coord.txt"     );
Y1 = load( "-ascii", "y_line.txt"      );
Y2 = load( "-ascii", "y_quadratic.txt" );
Y3 = load( "-ascii", "y_cubic.txt"     );

figure

subplot(131)
plot   (Xs, Y1,'', X, Y, '.r')
legend ("y = ax + b")

subplot(132)
plot   (Xs, Y2, '', X, Y, '.r')
legend ("y = ax^2 + bx + c")

subplot(133)
plot   (Xs, Y3, '', X, Y, '.r')
legend ("y = ax^3 + bx^2 + cx + d")
