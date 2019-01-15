% This file is used to solve problem using Eulerian method

clc
clear all
%close all

tic

kinverse = 1;

a = 2;       % Constant for potential 
b = (10^-9)*kinverse*kinverse;    % Constant ; adsorption kinetics
d = (10^-8)*kinverse;       % Constant in boundary condition
m = 1;       % Exponent in adsorption rate equation
B = 10^20;    % Equilubrium constant

n = 50;     % Number of grids

theta = 0;
C = ones(n,1)*(10^-5);

spacing = 10/n;

inc = 10^6;
max = 10^11;            % Maximum time

A = zeros(n,n);
D = zeros(n,1);

counter = zeros(1,max/inc);
j=1;

xi = [spacing:spacing:spacing*n] ;

for t = 0 : inc : max
    theta = theta + inc*(b*(C(1)*(1-theta)^m -theta/B));
    
    A(1,1) = (theta-1)*d - (1/inc) -2/spacing;
    A(1,2) = -4*a*theta*exp(-xi(1)) + 0.5/spacing ;
    A(1,3) = 2/spacing + a*theta*exp(-xi(1)) ;
    A(1,4) = -0.5/spacing ;
    
    D(1) = - C(1)/inc - 3*theta*d/B ;
    
    for i = 2:(n-1)
        
        A(i,i) = (-1/inc -2/(spacing^2) + a*theta*exp(-xi(i)));
        A(i,i+1) = 1/(spacing^2) - a*theta*exp(-xi(i))/(2*spacing);
        A(i,i-1) = 1/(spacing^2) + a*theta*exp(-xi(i))/(2*spacing);
        
        D(i) = -C(i)/inc ;
        
    end
    
    A(n,n) = 1;
    D(n) = 1;
    
    C = A\D;
    
    counter(j) = theta;
    j=j+1;

end

 plot([0:inc:max]*(10^-7)*(kinverse*kinverse),counter,'b');
 hold on

toc

% figure
% plot(xi,C)
