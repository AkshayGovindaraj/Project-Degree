% This file contains functions that were used earlier to approximately get
% the final answer.

function y = mew2(x2,ic,bc)
theta = bc;
psi = ic(1);
alpha = ic(2);
A = ic(3);
z= ic(4);
eta = z*(sin(theta)).^2;
y =  sqrt(z) - (theta(2)*sqrt(z)/(2*psi))*(psi*alpha*(x2-sqrt(z))*(exp(-A*x2*x2/2))/eta(2) + x2*(exp(-A*x2)))*sin(theta(2))/(1-x2) - x2
x2
end

function y = mew3(x)
y = sqrt(z) - (theta(2)*sqrt(z)/(2*psi))*(psi*alpha*(x(2)-x(1))*(exp(-A*x(2)*x(2)/2))/eta(2) + x(2)*(exp(-A*x(2))))*sin(theta(2))/(1-x(2)) - ...
    (sqrt(z)/(2*psi))*((psi*alpha*(x(3)-x(2))*(exp(-A*x(3)*x(3)/2))/(eta(3)-eta(2)) + x(3)*(exp(-A*x(3))))*sin(theta(3))/(1-x(3))+(psi*alpha*(x(2)-x(1))*(exp(-A*x(2)*x(2)/2))/eta(2) ... 
    + x(2)*(exp(-A*x(2))))*(sin(theta(2))/(1-x(2))))*(theta(3)-theta(2));
end

function y = mew4(x)
y = sqrt(z) - (theta(2)*sqrt(z)/(2*psi))*(psi*alpha*(x(2)-x(1))*(exp(-A*x(2)*x(2)/2))/eta(2) + x(2)*(exp(-A*x(2))))*sin(theta(2))/(1-x(2)) - ...
    +(sqrt(z)/(2*psi))*((psi*alpha*(x(3)-x(2))*(exp(-A*x(3)*x(3)/2)))/(eta(3)-eta(2) + x(3)*exp((-A*x(3))))*sin(theta(3))/(1-x(3))+(psi*alpha*(x(2)-x(1))*(exp(-A*x(2)*x(2)/2))/eta(2) ... 
    + x(2)*(exp(-A*x(2))))*(sin(theta(2))/(1-x(2))))*(theta(3)-theta(2)) - (sqrt(z)/(2*psi))*((psi*alpha*(x(4)-x(3))*(exp(-A*x(4)*x(4)/2))/(eta(4)-eta(3)) ...
    + x(4)*(exp(-A*x(4))))*sin(theta(4))+(psi*alpha*(x(3)-x(2))*(exp(-A*x(3)*x(3)/2))/(eta(3)-eta(2)) ...
    + x(3)*(exp(-A*x(3))))*(sin(theta(3))/(1-x(3))))*(theta(4)-theta(3));
end