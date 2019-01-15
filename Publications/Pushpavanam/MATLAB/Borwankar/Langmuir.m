% This file was used earlier to verify results of Langmuir case using
% Newton Raphson method.


clc
clear all
close all

psi = 20;
alpha =2;
theta = [0:pi/6:pi/2];
a = 0.5;

ze = [0.04:0.04:4];

x1 = zeros(100,1);
x2 = zeros(100,1);
x3 = zeros(100,1);
x4 = zeros(100,1);

i = 1;

f2=1;
f3=1;
f4=1;

for z = [0.04:0.04:4]
    
    f2=1;
    f3=1;
    f4=1;

    eta = z*(sin(theta).^2);
    
    x1(i) = sqrt(z);
    
    while (f2 > 10^-3)
        f2 = x2(i) - sqrt(z) + (theta(2)*sqrt(z)/(2*psi))*((sin(theta(2)))/(1-eta(2)))*(psi*alpha*(x2(i) - x1(i))/(eta(2)-eta(1)) + x2(i));
        f2prime = 1 + (theta(2)*sqrt(z)/(2*psi))*((psi*alpha/(eta(2) - eta(1))) +1)*sin(theta(2))/(1 - eta(2)) + (theta(2)*sqrt(z)/(2*psi))*(x2(i) + ...
            psi*alpha*(x2(i)-x1(i))/(eta(2) - eta(1)))*(sin(theta(2)))/((1-x2(i))^2);
        x2(i) = x2(i) - f2/f2prime;
    end
    
    while (f3 > 10^-3)
        f3 = x3(i) - sqrt(z) + (theta(3)*sqrt(z)/(2*psi))*((sin(theta(3)))/(1-eta(3)))*(psi*alpha*(x3(i) - x2(i))/(eta(3)-eta(2)) + x3(i))
        f3prime = 1 + (theta(3)*sqrt(z)/(2*psi))*((psi*alpha/(eta(3) - eta(2))) +1)*sin(theta(3))/(1 - eta(3)) + (theta(3)*sqrt(z)/(2*psi))*(x3(i) + ...
            psi*alpha*(x3(i)-x2(i))/(eta(3) - eta(2)))*(sin(theta(3)))/((1-x3(i))^2);
        x3(i) = x3(i) - f3/f3prime
    end
    
    while (f4 > 10^-3)
        f4 = x4(i) - sqrt(z) + (theta(4)*sqrt(z)/(2*psi))*((sin(theta(4)))/(1-eta(4)))*(psi*alpha*(x4(i) - x3(i))/(eta(4)-eta(3)) + x4(i));
        f4prime = 1 + (theta(4)*sqrt(z)/(2*psi))*((psi*alpha/(eta(4) - eta(3))) +1)*sin(theta(4))/(1 - eta(4)) + (theta(4)*sqrt(z)/(2*psi))*(x4(i) + ...
            psi*alpha*(x4(i)-x3(i))/(eta(4) - eta(3)))*(sin(theta(4)))/((1-x4(i))^2);
        x4(i) = x4(i) - f4/f4prime;
    end
    
    i = i+1;
end

plot(sqrt(ze),x4);