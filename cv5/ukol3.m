close all;
clear all;
clc;

%% cast 1
x = [0 1 0 0 0 0 0]; % index 0: je -1
y = [0 0 0 0 0 0 0];

for n = 0:5
    y(n+2) = 0.5*y(n+1) + 2*x(n+2);
end

%disp('Implulzni charakteristika');
h = y(2:end);

%% cast 2
x = [0 1 1 2 2 3 3];
y = [0 0 0 0 0 0 0];

for n = 0:5
    y(n+2) = 0.5*y(n+1) + 2*x(n+2);
end

%disp('Implulzni charakteristika');
y(2:end);

%% cast 3
%disp('Vystup pomoci konvoluce');
y = conv(x(2:end),h);

%% cast 5
syms z

H = 2/(1 - 0.5*z^(-1));

%X = 1 + 1*z^(-1) + 2*z^(-2) + 2*z^(-3) + 3*z^(-4) + 3*z^(-5);

%disp('Vzorek h[0]');
h0 = limit(H,inf);

%% cast 6

X = poly2sym([1 1 2 2 3 3],z)/z^5;

%disp('Y(z)');
Y = simplify(X*H);

%% cast 7

%disp('y(n)');
y = iztrans(Y);

%% cast 8

n = 0:5;
subs(y);

%% cast 9

h = iztrans(H);
subs(h);