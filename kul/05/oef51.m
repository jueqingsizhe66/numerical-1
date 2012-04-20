% oefening 1:
% [a,b] = vierkant( 1, 10^9, 2)

[a,b] = vierkant( 1, 10^7, 2)
% a =   -2.0023e-07  -1.0000e+07
% 
% b =   -1.0000e+07  -2.0000e-07
% 
[a,b] = vierkant( 1, 10^8, 2)
% a =   -2.2352e-08  -1.0000e+08
% 
% b =   -1.0000e+08  -2.0000e-08
% 
[a,b] = vierkant( 1, 10^9, 2)
% a =    0.0000e+00  -1.0000e+09
% 
% b =   -1.0000e+09  -2.0000e-09

% verklaring: tweede versie voorkomt aftrekking
