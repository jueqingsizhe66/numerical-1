A = reshape(linspace(1, 10000, 10000), 100, 100);
B = triu(A);

figure
imagesc(A)

figure
imagesc(B)
