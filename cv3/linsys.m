% Vytvoøi dva nezávislé náhodné signály x1 a x2
% koneèné délky d=20 vzorkù.
% Z diferenèních rovnic vypoète výstupní odezvu ètyø diskretnich
% systémù pro oba náhodné vstupní signály a jejich souèet :
% 1. y[n]=3/4*x[n]-1/4*y[n-1]   a poèáteèní podmínka y[0]=0.
% 2. y[n]=3*x[n]-4.
% 3. y[n]=x[n]^2.
% 4. y[n]=2*x[n]-1/y[n-1].
% Posudte, ktery system je linearni/nelinearni

function linsys

val = input('Zvol system 1-4:')

x1=2*rand(1,20)-1;
x2=2*rand(1,20)-1;
x=x1+x2;

y1(1)=0;
y2(1)=0;
y(1)=0;

%val = 3;

for n=2:20;
    
 switch val
    case 1
      y1(n)=3/4*x1(n)-1/4*y1(n-1);
      y2(n)=3/4*x2(n)-1/4*y2(n-1);
      y(n)=3/4*x(n)-1/4*y(n-1);
      text1='y1[n]=3/4*x1[n]-1/4*y1[n-1]';
      text2='y2[n]=3/4*x2[n]-1/4*y2[n-1]';
      text3='y[n]=3/4*x[n]-1/4*y[n-1]';
    case 2
      y1(n)=3*x1(n)-4;
      y2(n)=3*x2(n)-4;
      y(n)=3*x(n)-4;
      text1='y1[n]=3*x1[n]-4';
      text2='y2[n]=3*x2[n]-4';
      text3='y[n]=3*x[n]-4';
    case 3 
      y1(n)=x1(n)^2;
      y2(n)=x2(n)^2;
      y(n)=x(n)^2;
      text1='y1[n]=x1^2[n]';
      text2='y2[n]=x2^2[n]';
      text3='y[n]=x^2[n]';
    case 4   
      y1(n)=2*x1(n)-1/y1(n-1);
      y2(n)=2*x2(n)-1/y2(n-1);
      y(n)=2*x(n)-1/y(n-1);
      text1='y1[n]=2*x1[n]-1/y1[n-1]';
      text2='y2[n]=2*x2[n]-1/y2[n-1]';
      text3='y[n]=2*x[n]-1/y[n-1]';
    
 end 
end

figure;
subplot(3,1,1);
stem(y1,'.');
title(text1);
subplot(3,1,2);
stem(y2,'.');
title(text2);
subplot(3,1,3);
hold on;
stem(y,'b','.');
stem((y1+y2),'r','.');
title([text3, ';  cervena y[n]=y1[n]+y2[n]; modra y[n]=T(x1[n]+x2[n]']);

