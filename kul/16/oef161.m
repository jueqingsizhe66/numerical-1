clear all;
format long;

% theorie: p291

A=[1002, -2001, 1000; 1, 0, 0; 0, 1, 0];
B=[1, -3, 5;-1, -7, 11;-1, -9, 13];

x01=[1, 0, 0]';
x02=[1, 1, 1]';

figure;
[x1a,mu1a,e1a] = machten(A,x01,10);
figure;
[x2a,mu2a,e2a] = machten(A,x02,10);

figure;
[x1b,mu1b,e1b] = machten(B,x01,10);
figure;
[x2b,mu2b,e2b] = machten(B,x02,10);

figure;
[x3a,mu3a,e3a] = machten2(A,x02,10);

eig(A)
eig(B)
