% This file simulates the case of reactions and temperature along the
% height of a batch reactor.

% Convert all n to j

clc
clear all
%close all
tic
n = 20;

C = zeros(40*(n+1),1);
% 1 - 39 are components , 40 is temperature , 41 is reserved for other
% constants

for i = 0:(n-1)
C(40+i*40) = 300 ; % Initial temperature in Kelvin
C(1+i*40) = 0.4  ; % Initial value of cellulose
C(3+i*40) = 0.3  ; % Initial value of Hemi-Cellulose
C(6+i*40) = 0.1  ; % Initial value of LIG-C
C(7+i*40) = 0.1  ; % Initial value of LIG-H
C(8+i*40) = 0.1  ; % Initial value of LIG-O
end

%C(41,1) = n;    % Number of grids
%C(41,2) = 300;  % Initial wind temperature
C(40+n*40) = 700; % Leak out

[t,P] = ode23tb(@rxnode, [0 5], C);
toc

for j = 0:(n-1)
    h(j+1) = P(end,40*j+40);
end

plot([0:n-1]/(n-1),h,'r');
xlabel('Distance (Top to bottom)');
ylabel('Temperature (K)');
hold on