% This is the function for method of lines solution

function dC = myfun(t,C)

n = 100;
beta = 10^-6;
gmax = 10^-10;
D = 10^-5;
k = 10^6;
a = 10;
spacing = 10/(k*n);
alpha = 0;

dC = zeros(n+1,1);

Cnot = (  C(2) - C(1)*a*(C(n+1)/gmax)*k*(2*spacing)  ) - ...
    (beta*C(1)*(1-(C(n+1)/gmax)) - alpha*C(n+1))*(2*spacing/D) ;  % The ghost node

dC(1) = D*( (C(2) + Cnot - 2*C(1))/(spacing*spacing) + C(1)*a*(C(n+1)/gmax)*k*k  ... 
    - a*(C(n+1)/gmax)*k*(C(2) - Cnot)/(2*spacing) ) ; 

dC(n+1) = beta*C(1)*(1-(C(n+1)/gmax)) - alpha*C(n+1) ;

for i = 2:(n-1)
    dC(i) = D*( (C(i+1) + C(i-1) - 2*C(i))/(spacing*spacing) + C(i)*a*(C(n+1)/gmax)*k*k*exp(-k*spacing*(i-1))  ... 
    - a*(C(n+1)/gmax)*k*(C(i+1) - C(i-1))*exp(-k*spacing*(i-1))/(2*spacing) ) ; 
end
