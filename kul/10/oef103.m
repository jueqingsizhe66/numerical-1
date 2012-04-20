% graad = # knooppunten - # coef - 1

% t0 = t1 < t2 < t3
% graad = 2 = 4 - 1 - 1
sp = spmak([0,0,2,3], [1])
fnplt(sp)

% t0 = t1 = t2 < t3
% graad = 2 = 4 - 1 - 1
sp = spmak([0,0,0,3], [1])
fnplt(sp)

% t0 < t1 = t2 < t3
% graad = 2 = 4 - 1 - 1
sp = spmak([0,1,1,3], [1])
fnplt(sp)
