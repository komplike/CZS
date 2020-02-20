%x=[0 1 1 1 1 1 1 1 1 0] - vstupni signal;
%yp(1)=1;
%yv(1)=0;
%yc(1)=1;
%yp(n)=0-yp(n-1)/2;
%yv(n)=x(n)-yv(n-1)/2;
%yc(n)=x(n)-yc(n-1)/2;

clc;
close all;
clear all;

%d=20;
%x=2*rand(1,d)-1;
x=[0 1 1 1 1 1 1 1 1 0];
yp(1)=1;
yv(1)=0;
yc(1)=1;

for n=2:10;
    yp(n)=0-yp(n-1)/2;
    yv(n)=x(n)-yv(n-1)/2;
    yc(n)=x(n)-yc(n-1)/2;
end

y=[yp;yv;yc;(yp+yv)];
yc_porovnani=[yc',(yp'+yv')];
figure(1);
subplot(3,1,1);
stem(yp,'.');
title('Prirozena odezva systemu');
subplot(3,1,2);
stem(yv,'.');
title('Vynucena odezva systemu');
subplot(3,1,3);
stem(yc_porovnani,'.');
title('Celkova odezva systemu');

figure(2);
subplot(2,1,1);

stem(x,'b','.');
title('Vstupni signal.');

subplot(2,1,2);

stem(yc,'r','.');
title('Vystupni signal = odezva systemu.');

