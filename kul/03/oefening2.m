format long e
load exacte_x


x=100;
for i=1:40,
x=sqrt(x);
opl(i)=x;
end

fout1=abs(opl-exacte_x');
plot(fout1);

x=exacte_x(40);

for i=1:40,
opl2(i)=x;
x=x.^2;
end

fout2=abs(opl2-fliplr(exacte_x'));

figure
plot(fout2);



