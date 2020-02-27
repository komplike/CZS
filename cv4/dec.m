%% cv4_skript
% 27.2.2020

% cistenie
clc;
clear all;

%% vytvorenie signalov
td=0:2*pi/100:2*pi;
ud=sin(td);
UD=[];
for n=1:3000
    UD=[UD ud];
end;

%% decimace 2
ud2=ud(1:2:101);
UD2=UD(1:2:303000);
%soundsc(UD,100000);
%soundsc(UD2,100000);

%% interpolace                      --TODO--

%% podvzorkovanie decimate()
UD22=decimate(UD,2);
%soundsc(UD,100000);
%soundsc(UD22,50000);

%% nadvzorkovanie interp()
UD222=interp(UD,2);
%soundsc(UD,100000);
%soundsc(UD222,200000);

%% zmena f_vz resample(x,L,M);x-signal,L-nadvzorkovanie,M-podvzorkovanie
y=resample(ud,2,5);
%soundsc(UD,100000);
%soundsc(y,40000); 

%% samostatny ukol 1 resample()
clc;
clear all;

[x,fvz]=wavread('zv_cz');
fvz2=44100;
K=gcd(fvz,fvz2);
y=resample(x,fvz2/K,fvz/K);
%soundsc(x,fvz);
%soundsc(y,fvz2);

%% ukol 2 vypocet impulzni odezvy y(n)=x(n)+0.9*y(n-1);
clc;
clear all;

x=[1 0 0 0 0 0 0 0 0 0];
h=[];
for (i=1:10)
    if (i==1)
        h(i)=x(i);
    else
        h(i)=x(i)+0.9*h(i-1);
    end;
end;
y=h;
%display(y);

%% ukol 3 impz()

clc;
clear all;

a=[1 -0.9];
b=[1];
%impz(b,a,20);

%% ukol 4 impz() y(i)=0.25*(x(i)+x(i-1)+x(i-2)+x(i-3));

clc;
clear all;

x=[1 0 0 0 0 0 0 0 0 0];
h=[];
for (i=1:10)
    switch i
        case 1
            h(i)=0.25*x(i);
        case 2
            h(i)=0.25*(x(i)+x(i-1));
        case 3
            h(i)=0.25*(x(i)+x(i-1)+x(i-2));
        otherwise
            h(i)=0.25*(x(i)+x(i-1)+x(i-2)+x(i-3));
    end;
end;
%display(h);

a=h;
b=[1];
%impz(a,b,10);

%% ukol 5 conv() y(i)=(x(i)-2*x(i-1)+x(i-2)+0.8*y(i-1)-0.05*y(i-2));

clc;


%x=[1 0 0 0 0 0 0 0 0 0];

%display(h);
%a=[];                   --TODO--
%b=[];
%[h,n]=impz(a,b,10);
%y=conv(x,h);
%display(y);
%stem(y,'.');

%% ukol 6 conv()

clc;

[x,fs]=wavread('zv_cz');
y=impz(a,b,10);
%soundsc(x,fs);
%soundsc(y,fs);


%% ukol 6 spojenie LTI systemov

clc;
clear all;

% 1. impz
a1=[1 -0.9];
b1=[1];
h1=impz(b1,a1,20);

% 2. impz
a2=[1];
b2=[0.25 0.25 0.25 0.25];
h2=impz(b2,a2,20);

%hs a hp
hs=conv(h1,h2);
subplot(2,1,1);
stem(hs,'.');
hp=h1+h2;
subplot(2,1,2);
stem(hp,'.');
close all; %zavre okna