% This file solves the problem using the method of lines

clc
clear all
%close all

n = 100;
gmax = 10^-10;
k = 10^6;
spacing = 10/((10^6)*n);


C = ones(n+1,1)*(10^-5);     % Initial concentration
C(n+1) = 0;          % Initial surface excess

[T,Y] = ode23s(@myfun,[0 10^(-3)],C);

% plot(T,Y(:,n+1)/gmax,'g');
% hold on

for i = 1:n
    Y1(i) = Y(end,i);
end

plot(log([0:spacing:spacing*(n-1)])/log(10),(Y1*(10^5)),'r');
hold on