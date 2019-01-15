
% This file contains an earlier used method to solve the BW equation using
% fzero.

clc
clear all
close all

%psi = 20;
%alpha = 2;
%theta = [0:pi/6:pi/2];
%A = 2;

i = 1;
x = zeros(4,1);
gamma = zeros(4,100);

ic(1) = 20 % psi
ic(2) = 2  % alpha
ic(3) = 2  %A 

bc = [0:pi/6:pi/2];

for z = [4.04:0.04:8]
    %eta = z*(sin(theta).^2);
    
    ic(4) = z;
        
    x(1) = sqrt(z);
    x(2) = fzero(@(x) mew2(x,ic,bc),0);
    gamma (2,i) = x(2);
    i = i+1;
end

ze = [4.04:0.04:8]

plot(sqrt(ze),gamma(2,:));