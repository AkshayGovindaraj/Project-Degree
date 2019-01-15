% This function  is an earlier attempt to solve the problem using newton
% raphson`s method. 


function Y = funcBWfinal(psi,alpha,A,n)

theta = [0:pi/(2*(n-1)):pi/2]

%ze = [0.04:0.04:4];
a = 0.03;
xn = ones(100,n);  % the first variable represents the real time, 
                    % second denotes the running time.
i=1; % running variable;

for z = [0.04:0.04:4]
    eta = z*((sin(theta)).^2);
    
    fn = ones(100);              % Function
    fnprime = zeros(100);        % Derivative
    
    xn(i,1) = sqrt(z);
    
    k=0;
    while(abs(fn(2))>10^-3)
        fn(2) = xn(i,2)*(1-xn(i,2)) - (1-xn(i,2))*sqrt(z) + (theta(2)*sqrt(z)/(2*psi))*(psi*alpha*(xn(i,2)-sqrt(z))*(exp(-A*xn(i,2)*xn(i,2)/2))/eta(2) + ...
            xn(i,2)*(exp(-A*xn(i,2))))*sin(theta(2)) ;
        fnprime(2) = (1 - 2*xn(i,2)) + sqrt(z) + (theta(2)*sqrt(z)/(2*psi))*(psi*alpha*(exp(-A*xn(i,2)*xn(i,2)/2))/(eta(2)-eta(1)) - ... 
            psi*alpha*((xn(i,2)-xn(i,1))/(eta(2)-eta(1)))*(A*xn(i,2))*exp(-A*xn(i,2)*xn(i,2)/2) + exp(-A*xn(i,2)) - A*xn(i,2)*exp(-A*xn(i,2)))*sin(theta(2));
        xn(i,2) = xn(i,2) - a*fn(2)/fnprime(2);
        k = k +1;
        %if (k>100)
        %    xn(i,2) = sqrt(z) - 0.001;
        %    break;
        %end
        %fn(2)=abs(fn(2));
        %if (abs(xn(i,2) -1)<10^-4 )
        %  xn(i,2) = 1.01;
        %end
    end
    
    for j = [3:1:n]
        %k=0;
        while (abs(fn(j))> 10^-3)
            % Function which is zero at the root
        fn(j) = (xn(i,j-1) - xn(i,j))*(1-xn(i,j))*(1-xn(i,j-1)) - (sqrt(z)/(2*psi))*((psi*alpha*((xn(i,j)-xn(i,j-1))/(eta(j)-eta(j-1)))*exp(-A*xn(i,j)*xn(i,j)/2) + xn(i,j)*exp(-A*xn(i,j)))*(1-xn(i,j-1))*sin(theta(j)) + ...
            (psi*alpha*(xn(i,j-1)-xn(i,j-2))*(exp(-A*xn(i,j-1)*xn(i,j-1)/2))/(eta(j-1)-eta(j-2)) + xn(i,j-1)*exp(-A*xn(i,j-1)))*sin(theta(j-1))*(1-xn(i,j)))*(theta(j) - theta(j-1));
            % Derivative of the function
        fnprime(j) = ((1-2*xn(i,j-1)) + xn(i,j-1))*(1 - xn(i,j-1)) - (sqrt(z)/(2*psi))*(theta(j)-theta(j-1))*sin(theta(j-1))*(psi*alpha*(xn(i,j-1)-xn(i,j-2))*(exp(-A*xn(i,j-1)*xn(i,j-1)/2))/(eta(j-1)-eta(j-2)) ... 
            + xn(i,j-1)*exp(-A*xn(i,j-1))) + (sqrt(z)/(2*psi))*(theta(j)-theta(j-1))*(psi*alpha*(exp(-A*xn(i,j)*xn(i,j)/2))/(eta(j)-eta(j-1)) - ...
            (A*xn(i,j))*psi*alpha*(xn(i,j)-xn(i,j-1))*(exp(-A*xn(i,j)*xn(i,j)/2))/(eta(j)-eta(j-1)) + exp(-A*xn(i,j)) - A*xn(i,j)*exp(-A*xn(i,j)))*sin(theta(j))*(1-xn(i,j-1));
        xn(i,j) = xn(i,j) + a*fn(j)/fnprime(j);
        %k=k+1;
        %if(k>100)
        %    xn(i,j) = xn(i,j-1) - 0.0001;
        %    break
        %end
        end
        %if(isnan(xn(i,j)))
        %    xn(i,j) = xn(i-1,j) + 0.001;
        %end
    end
    i = i+1;
end

Y = xn(:,end);
end


