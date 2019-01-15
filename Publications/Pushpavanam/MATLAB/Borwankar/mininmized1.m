function Y = mininmized1(i,z,mew)

% This file is an alternative for minimized

% This function gives the value of mew according to the need. Working
% method.

j = i(1);
psi = i(2);
alpha = i(3);
A = i(4);
n = i(5);
k = round(z*25)+1;     % This is only true for [0.04:0.04:4] . Must change otherwise

phi   = [0:pi/(2*(n-1)):pi/2];    % phi is defined according to the total no. of trapezoids
theta = [0:pi/(2*(j-1)):pi/2];    % Theta is defined acording to the running index

eta = z*((sin(theta)*sin(phi(j))).^2);

%eta = [0 : z*sin(phi(j))/(j-1) : z*sin(phi(j)) ] ;

%theta = asin(sqrt(eta/sin(phi(j)))) ;

%keyboard

index = 0.01;
difference = 1;
mindifference = 10000;

for guess = [0:0.001:1]
    
    if (j==1)
        index = 0;    % Used to assign value zero at time t = 0 
        break;
    end
    
    mew(k,j) = guess;
    
         % The actual calculations are done in the following lines
    calculated = sqrt(z)*sin(phi(j)) - (theta(2)*sqrt(z)*sin(phi(j))/(2*psi))*(sin(theta(2))/(1-mew(k,2)))*(psi*alpha*(mew(k,2)/eta(2))*exp(-A*mew(k,2)*mew(k,2)/2) ...
        + mew(k,2)*exp(-A*mew(k,2)));
    for m = [2:(j-1)]
        calculated = calculated - (sqrt(z)*sin(phi(j))/(2*psi))*((psi*alpha*((mew(k,m+1)-mew(k,m))/(eta(m+1)-eta(m)))*exp(-A*mew(k,m+1)*mew(k,m+1)/2) ...
            + mew(k,m+1)*exp(-A*mew(k,m+1)))*(sin(theta(m+1))/(1-mew(k,m+1))) + (psi*alpha*((mew(k,m)-mew(k,m-1))/(eta(m)-eta(m-1)))*exp(-A*mew(k,m)*mew(k,m)/2) ...
            + mew(k,m)*exp(-A*mew(k,m)))*(sin(theta(m))/(1-mew(k,m))))*(theta(m+1)-theta(m));
    end
        
    difference = abs(mew(k,j) - calculated);
    if (difference < mindifference)
        index = calculated;
        mindifference = difference;
        finale = calculated;
    end
end

Y = index;
end
        