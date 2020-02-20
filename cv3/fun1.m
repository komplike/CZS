function [a]=fun1(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
d=length(x);
 a=[];
for n=1:d
    a=[a n*x(n)];
end
figure(1)
set(1, 'name', 'system y[n]=n*x[n]')