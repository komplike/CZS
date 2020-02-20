function out = korelace(a, b);
% funkce pro vypocet korelace
Na = length(a);
Nb = length(b);
if(Na~=Nb)
    error('argumets must have the same length');
end
for i=1:Na
    acc = 0;
    for j=1:Nb-i
        acc = acc + a(j)*b(j+i);
    end
    out(i) = acc;
end