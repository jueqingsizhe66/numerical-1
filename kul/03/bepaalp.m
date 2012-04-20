function p=bepaalp
% Bereken het aantal beduidende cijfers in de mantisse, 
% als b gekend is ( bv. uit bepaalb.m )
b = bepaalb;
p = 1;
z = b;
while ((z+1) - z) == 1,
   p = p+1;
   z = z*b;
end 

