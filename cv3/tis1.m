function [A]=tis1(x,i)
%casova invariantnost systemu y[n]=n.x[n]
%tis1(x,i) x vektor vstupniho signalu, i posun o i-vzorku 
%vyzaduje funkci fun1.m
y=fun1(x);
d=length(x);
A=[];
for k=d+1:d+i
    y(k)=0;
end
%figure
subplot(311);
stem(y,'fill');
set(gca,'XTick',[1:d+i]);
ylim([0 max(y)]);
title('vystupni signal y[n]; x[n]');
A1=[y];
for k=1:i
    y=[0 y];
end
subplot(313);
stem(y(1:d+i),'fill');
set(gca,'XTick',[1:d+i]);
ylim([0 max(y)]);
title('vystupni signal y[n-i]; x[n]');
A3=[y(1:d+i)];
for k=1:i
    x=[0 x];
end
y=fun1(x(1:d+i));
subplot(312);
stem(y(1:d+i),'fill');
set(gca,'XTick',[1:d+i]);
ylim([0 max(y)]);
title('vystupni signal y[n,i]; x[n-i]');
A=[A1;y(1:d+i);A3];