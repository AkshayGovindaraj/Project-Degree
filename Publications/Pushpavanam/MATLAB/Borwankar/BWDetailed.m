
% This file is an earlier attempt to solve the equation using fsolve. 
% It is used to call BWsolver function


clc
clear all
close all

z = [0.01:0.01:4];
psi = zeros(400,1);
i=1;

for ze = [0.01:0.01:4]
    ic = ones(8,1).*0.25;
    y = ze;
    
    ic(1) = sqrt(ze);
    [x,fval] = fsolve(@(x) BWsolver2(x,y),ic);
    psi(i)=x(6);
    i=i+1;
end

plot(sqrt(z),psi);
grid on;