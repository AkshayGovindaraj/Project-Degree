clc
clear all
close all

% This file is just used for testing branches of code which might contain
% bugs

psi = 2;
alpha = 0;
theta = [0:pi/4:pi/2];
f = 1;
x=zeros(3,1);

for z = [0.01:0.01:1]
    x(1) = sqrt(z);
    eta = z*((sin(theta)).^2);
    while (f>10^-3)
        f = x(1)*(1-x(2)) - (theta(2)*x(1)/(2*psi))*(psi*alpha*(x(2)-x(1))/(eta(2)-eta(1)) + x(2))*sin(theta(2)) - x(2)*(1-x(2));
        df = -x(1) - (theta(2)*x(1)/(2*psi))*(psi*alpha/(eta(2)-eta(1)) + 1)*sin(theta(2)) +(2*x(2)-1);
        x(2) = x(2) - (0.1)*f/df;
    end
    f =1;
    
    while (f>10^-3)
        f = (x(2)-x(3))*(1-x(2))*(1-x(3)) - (x(1)*(theta(3)-theta(2))/(2*psi))*(psi*alpha*(x(3)-x(2))/(eta(3)-eta(2)) + x(3))*sin(theta(3))*(1-x(2)) ...
             - (x(1)*(theta(3)-theta(2))/(2*psi))*(psi*alpha*(x(2)-x(1))/(eta(2)-eta(1)) + x(2))*sin(theta(2))*(1 - x(3));
        df = - (1+x(2) - 2*x(3))*(1-x(2)) - (x(1)*(theta(3)-theta(2))/(2*psi))*(psi*alpha/(eta(3)-eta(2)) +1)*sin(theta(3))*(1-x(2)) ...
             + (x(1)*(theta(3)-theta(2))/(2*psi))*(psi*alpha*(x(2)-x(1))/(eta(2)-eta(1)) + x(2))*sin(theta(2));
        x(3) = x(3) - (0.1)*f/df;
    end
    f=1;
    %transpose(x)
    plot(sqrt(z),x(3),'o')
    hold on
        
end
