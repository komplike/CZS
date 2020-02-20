function radar(D)
% priklad na aplikaci korelace - radar
%vstupni parametr odstup signal-sum, zasumeni odrazeneho signalu v dB
%radar(D), D je SNR v dB


Fs = 1e6;  %vzorkovaci frekvence = 1MHz, vzorkovaci perioda T = 1mikro sekunda = 1e-6
impuls = [1 1 1 1 -1 -1 -1 -1 1 1 1 -1 -1 -1 1 1 -1 -0.5]; 
signal = [impuls, zeros(1, 500)];  % protazeni signalu na delku (18 +1000)T tj. cca 1ms

odraz = [zeros(1, 300), impuls, zeros(1, 500-300)];  % zpozdeni signalu o 300T tj. o 300mikro sekund (prekazka ve vzdalenosti (3e8*300e-6)/2 = 45km)

c1 = korelace(signal, odraz);

% vykresleni signalu v diskretnim tvaru
H = figure;
subplot(311)
stem(signal, '.');
axis([0 100 -1.5 1.5]);
title('vysilany signal');
xlabel('---> nT');

subplot(312)
stem(odraz, '.');
axis([250 350 -1.5 1.5]);
title('odrazeny signal');
xlabel('---> nT');

subplot(313)
stem(c1, '.')
axis([250 350 -10 20]);
title('korelace mezi vysilanym a odrazenym signalem (poloha spicky urcuje dobu za kterou je prijmut odrazeny signal)');
xlabel('---> nT');

set(H, 'Position', [1 54 1280 903]);



% to same se sumem
H = figure;
subplot(311)
stem(odraz, '.');
axis([250 350 -1.5 1.5]);
title('odrazeny signal bez sumu');
xlabel('---> nT');

odraz = awgn(odraz, D);  % vytvori aditivni smes odrazeneho signalu se sumem
c2 = korelace(signal, odraz);

% vykresleni signalu

subplot(312)
stem(odraz, '.');
axis([250 350 -2 2]);
title(['realny zasumeny odrazeny signal, SNR ',num2str(D), 'dB']);
xlabel('---> nT');

subplot(313)
stem(c2, '.')
axis([250 350 -10 20]);
title('korelace mezi vysilanym a realnym zasumenym odrazenym signalem (poloha spicky urcuje dobu za kterou je prijmut odrazeny signal)');
xlabel('---> nT');

set(H, 'Position', [1 54 1280 903]);
end

