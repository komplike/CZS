function [a]=fun2(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 a=[];
 x=[0 x];
 d=length(x);
for n=2:d
    a=[a x(n)-x(n-1)];
end
figure(1)
set(1, 'name', 'system y[n]=x[n]-x[n-1]')