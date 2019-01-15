% This function is used to solve the Simplified Diffusion-kinetic method.
% Working Method


function dmew = funcdk(z,mew)
dmew = zeros(3,1);
A = 0;
psi = mew(2);
alpha = mew(3);
N = (1-mew(1)) - (mew(1)/psi)*exp(-A*mew(1));
D =  2*(1-mew(1))*(z^0.5) + alpha*exp(-A*mew(1)*mew(1)/2);
%dmew(1) = ((1-mew(1) - (mew(1)*exp(-A*mew(1))/psi))/(alpha*exp(-A*mew(1)*mew(1)/2))+2*(1-mew(1))*sqrt(z));
dmew(1) = N/D;
end
