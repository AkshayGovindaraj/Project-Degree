clc
%clear all
%close all
tic

% Solving BW equation using linear guess method. The working method.

n = 10;    % Represents the number of trapezoids
psi = 2;
alpha = 2;
A = 0;

i(2) = psi;
i(3) = alpha;
i(4) = A;
i(5) = n;

mew = zeros(101,n); % To store the mew values

j =1;      % Parameter used to store the index numbers

for z = [0:0.04:4];
    for k = [1:n]
        i(1) = k;
        mew(j,k) = mininmized(i,z,mew);
    end
    j = j+1;
end

plot(sqrt([0:0.04:4]),mew(:,end),'b');
grid on;

toc
hold on;