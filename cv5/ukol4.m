close all;
clear all;
clc;

%% cast 1
syms z

H1 = 1/(1 - 5/6*z^(-1) + 1/6*z^(-2));

H2 = poly2sym([2 1 0.5 0.25 0.125 0.0625],z)/z^5;

disp('H(z)');
H = simplify(H1 + H2)

%% cast 2
disp('H(n)');
h = iztrans(H)

%% cast 3 4
X = 1 + 1*z^(-1);

Y = H*X;

disp('y(n)');
y = iztrans(Y)

%% cast 5

n = 0:5;
subs(y)