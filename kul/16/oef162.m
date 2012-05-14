clear all;
format long;

A=[1002, -2001, 1000; 1, 0, 0; 0, 1, 0];
B=[1, -3, 5;-1, -7, 11;-1, -9, 13];

x0=[1, 0, 0]';

l = invmachten(B, x0, 1.9 ,10)
l = invmachten(B, x0, 2 ,10)
l = invmachten(B, x0, 10 ,10)
