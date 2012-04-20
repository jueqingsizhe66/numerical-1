% graad = # knooppunten - # coef - 1
sp = spmak(0:10, [1,1,1,1,1,1])
fnplt(sp)
% 11 - 6 - 1 = 4

% tussen 4 en 6 is de som 1 omdat alle splines verschillende zijn van nul
%
% overzicht verschillende graden versus het constant stuk 1
%
% begin   afstand   einde  graad   #coef
%                            9       1
%                            8       2
%                            7       3
%   5        0       5       6       4
%   4.5      1       5.5     5       5
%   4        2       6       4       6
%   2.5      4       6.5     3       7
%   2        6       8       2       8
%   1        8       9       1       9
%   0       11      10       0      10
