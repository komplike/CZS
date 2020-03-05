close all;
clear all;
clc;

%% definice promennych
syms z;

H1 = 2 + 3*z^(-1) + 4*z^(-2);
H2 = 3 + 4*z^(-1) + 5*z^(-2) + 6*z^(-3);

disp('Prenosova funkce');
H = expand(H1 * H2)

disp('Implulzni charakteristika');
h = iztrans(H)