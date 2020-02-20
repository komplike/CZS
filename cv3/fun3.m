function [a]=fun3(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
a=[0];
x=[0 x];
d=length(x);
for n=2:d
    a=[a a(n-1)+x(n)];
end
a=a(2:d); 
figure(1)
set(1, 'name', 'system y[n]=y[n-1]+x[n]')