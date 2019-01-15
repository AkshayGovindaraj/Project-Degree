% THis file contains an earlier attempt to get the answer using newton
% raphson method without calling any external function.


clc
clear all
close all

psi = 20;
alpha =2;
A =-2;
theta = [0:pi/6:pi/2];
a = 0.05;

ze = [0.04:0.04:4];

x1 = zeros(100,1);
x2 = zeros(100,1);
x3 = zeros(100,1);
x4 = zeros(100,1);
xn = zeros(100,95);

i = 1;

f2=1;
f3=1;
f4=1;

for z = [0.04:0.04:4]
    eta = z*(sin(theta).^2);
    
    f2=1;
    f3=1;
    f4=1;
    
    x1(i) = sqrt(z);
    
    while (abs(f2) > 10^-4)
        f2 = -sqrt(z) + (theta(2)*sqrt(z)/(2*psi))*(psi*alpha*(x2(i)-sqrt(z))*(exp(-A*x2(i)*x2(i)/2))/eta(2) + x2(i)*(exp(-A*x2(i))))*sin(theta(2))/(1-x2(i)) +x2(i);
        f2prime = -1 - (theta(2)*sqrt(z)/(2*psi))*(psi*alpha*(x2(i) - x1(i))*exp(-A*x2(i)*x2(i)/2)/eta(2) +x2(i)*exp(-A*x2(i)))*sin(theta(2))/((1-x2(i))^2) - ...
            - (theta(2)*sqrt(z)/(2*psi))*(sin(theta(2))/(1-x2(i))*((psi*alpha*exp(-A*x2(i)*x2(i)/2)/eta(2)) - psi*alpha*(x2(i)-x1(i))*A*x2(i)*exp(-A*x2(i)*x2(i)/2)/eta(2) ...
            + exp(-A*x2(i)) - A*x2(i)*exp(-A*x2(i))));
        x2(i) = x2(i) - a*f2/f2prime;
        f2
    end
    
    while (f3> 10^-3)
        f3 = x2(i) - x3(i) - (sqrt(z)/(2*psi))*((psi*alpha*((x3(i)-x2(i))/(eta(3)-eta(2)))*exp(-A*x2(i)*x2(i)/2) + x3(i)*exp(-A*x3(i)))*sin(theta(3))/(1-x3(i)) + ...
            (psi*alpha*(x2(i)-x1(i))*exp(-A*x2(i)*x2(i)/2)/eta(2) + x2(i)*exp(-A*x2(i)))*sin(theta(2))/(1-x2(i)))*(theta(3) - theta(2));
        f3prime = -1 - ((theta(3) - theta(2))*sqrt(z)/(2*psi))*(sin(theta(3))/((1-x3(i))^2))*(psi*alpha*(x3(i)-x2(i))*exp(-A*x3(i)*x3(i)/2)/(eta(3) - eta(2)) ...
            + x3(i)*exp(-A*x3(i))) - ((theta(3) - theta(2))*sqrt(z)/(2*psi))*(sin(theta(3))/(1-x3(i)))*(psi*alpha*exp(-A*x3(i)*x3(i)/2)/(eta(3)-eta(2)) - ...
            psi*alpha*(x3(i) - x2(i))/(eta(3) - eta(2))*(A*x3(i)*exp(-A*x3(i)*x3(i)/2) + exp(-A*x3(i)) - A*x3(i)*exp(-A*x3(i))));
        x3(i) = x3(i) - a*f3/f3prime;
    end
    
    while (f4> 10^-3)
        f4 = x3(i) - x4(i) - (sqrt(z)/(2*psi))*((psi*alpha*((x4(i)-x3(i))/(eta(4)-eta(3)))*exp(-A*x3(i)*x3(i)/2) + x4(i)*exp(-A*x4(i)))*sin(theta(4))/(1-x4(i)) + ...
            (psi*alpha*(x3(i)-x2(i))*exp(-A*x3(i)*x3(i)/2)/(eta(3)-eta(2)) + x3(i)*exp(-A*x3(i)))*sin(theta(3))/(1-x3(i)))*(theta(4) - theta(3));
        f4prime = -1 - ((theta(4) - theta(3))*sqrt(z)/(2*psi))*(sin(theta(4))/((1-x4(i))^2))*(psi*alpha*(x4(i)-x3(i))*exp(-A*x4(i)*x4(i)/2)/(eta(4) - eta(3)) ...
            + x4(i)*exp(-A*x4(i))) - ((theta(4) - theta(3))*sqrt(z)/(2*psi))*(sin(theta(4))/(1-x4(i)))*(psi*alpha*exp(-A*x4(i)*x4(i)/2)/(eta(4)-eta(3)) - ...
            psi*alpha*(x4(i) - x3(i))/(eta(4) - eta(3))*(A*x4(i)*exp(-A*x4(i)*x4(i)/2) + exp(-A*x4(i)) - A*x4(i)*exp(-A*x4(i))));
        x4(i) = x4(i) - a*f4/f4prime;
    end
    
    %while (f5> 10^-3)
    %    f5 = x4(i) - x5(i) - (sqrt(z)/(2*psi))*((psi*alpha*((x5(i)-x4(i))/(eta(5)-eta(4)))*exp(-A*x4(i)*x4(i)/2) + x5(i)*exp(-A*x5(i)))*sin(theta(5))/(1-x5(i)) + ...
    %        (psi*alpha*(x4(i)-x3(i))*exp(-A*x4(i)*x4(i)/2)/(eta(4)-eta(3)) + x4(i)*exp(-A*x4(i)))*sin(theta(4))/(1-x4(i)))*(theta(5) - theta(4));
    %    f5prime = -1 - ((theta(5) - theta(4))*sqrt(z)/(2*psi))*(sin(theta(5))/((1-x5(i))^2))*(psi*alpha*(x5(i)-x4(i))*exp(-A*x5(i)*x5(i)/2)/(eta(5) - eta(4)) ...
    %        + x5(i)*exp(-A*x5(i))) - ((theta(5) - theta(4))*sqrt(z)/(2*psi))*(sin(theta(5))/(1-x5(i)))*(psi*alpha*exp(-A*x5(i)*x5(i)/2)/(eta(5)-eta(4)) - ...
    %        psi*alpha*(x5(i) - x4(i))/(eta(5) - eta(4))*(A*x5(i)*exp(-A*x5(i)*x5(i)/2) + exp(-A*x5(i)) - A*x5(i)*exp(-A*x5(i))));
    %    x5(i) = x5(i) - a*f5/f5prime;
    %end
    
   % fn = ones(95,1);
   % fnprime = zeros(95,1);
    
   % for j = [1:1:95]
   %     while (fn(j)> 10^-3)
   %     fn(j) = x4(i) - x5(i) - (sqrt(z)/(2*psi))*((psi*alpha*((x5(i)-x4(i))/(eta(5)-eta(4)))*exp(-A*x4(i)*x4(i)/2) + x5(i)*exp(-A*x5(i)))*sin(theta(5))/(1-x5(i)) + ...
   %         (psi*alpha*(x4(i)-x3(i))*exp(-A*x4(i)*x4(i)/2)/(eta(4)-eta(3)) + x4(i)*exp(-A*x4(i)))*sin(theta(4))/(1-x4(i)))*(theta(5) - theta(4));
   %     f5prime = -1 - ((theta(5) - theta(4))*sqrt(z)/(2*psi))*(sin(theta(5))/((1-x5(i))^2))*(psi*alpha*(x5(i)-x4(i))*exp(-A*x5(i)*x5(i)/2)/(eta(5) - eta(4)) ...
   %         + x5(i)*exp(-A*x5(i))) - ((theta(5) - theta(4))*sqrt(z)/(2*psi))*(sin(theta(5))/(1-x5(i)))*(psi*alpha*exp(-A*x5(i)*x5(i)/2)/(eta(5)-eta(4)) - ...
   %         psi*alpha*(x5(i) - x4(i))/(eta(5) - eta(4))*(A*x5(i)*exp(-A*x5(i)*x5(i)/2) + exp(-A*x5(i)) - A*x5(i)*exp(-A*x5(i))));
   %     x5(i) = x5(i) - a*f5/f5prime;
   % end
        
    i = i+1;
end

plot(sqrt(ze),x4);