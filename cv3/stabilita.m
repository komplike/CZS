% èasovì omezený signál x[n] délky d = 50 vzorkù.
% Z diferenèních rovnic vypoètìte výstupní odezvu tøí digitálních
% systémù :
% 1. y1[n + 2] = 2 ^ x[n].
% 2. y2[n + 2] = 1 * y2[n + 1] + 2 * y2[n] + x[n].
% 3. y3[n + 2] = 0.4 * y3[n + 1] - 0.29 * y3[n] + x[n].
% Rozhodnete, zda se jedná o stabilní èi nestabilní systém

clc;
close all;
clear all;

d = 150;

x = [1 zeros(1, d - 1)];
x=[ones(1,150)];
t = -2:(d - 1);
y2 = [0 0];
y3 = [0 0];
for n = 1:d
    y1(n + 2) = 2 ^ x(n);
    y2(n + 2) = 1 * y2(n + 1) + 2 * y2(n) + x(n);
    y3(n + 2) = 0.4 * y3(n + 1) - 0.29 * y3(n) + x(n);
end;

figure(1);
subplot(4, 1, 1);
stem(t, [0 x 0],'.');
title('vstupni omezeny signal x[n]')
subplot(4, 1, 2);
stem(t, y1,'.');
title('vystupni signal y1[n + 2] = 2*exp(x[n])')
subplot(4, 1, 3);
stem(t, y2,'.');
title('vystupni signal y2[n + 2] = 1 * y2[n + 1] + 2 * y2[n] + x[n]')
subplot(4, 1, 4);
stem(t, y3,'.');
title('vystupni signal  y3[n + 2] = 0.4 * y3[n + 1] - 0.29 * y3[n] + x[n]')
