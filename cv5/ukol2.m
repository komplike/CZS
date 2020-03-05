close all;
clear all;
clc;

%% definice promennych
syms z;

X = 1 - 1/3*z^(-1);
H = 1/(1 - 5/6*z^(-1) + 1/6*z^(-2));

disp('Implulzni charakteristika');
y = iztrans(X * H)

disp('Prvni vzorek');
y0=limit(y)