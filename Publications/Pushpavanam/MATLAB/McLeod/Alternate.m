clc
clear all
close all

kappa = 1;
w = 0;
a = 2;        % C(bar) divided by c1 (infinite)
b = 350;      % Gamma (max) divided by (c1 (inf) * Debye Length)
c = 1;        % Diffusivity ratios of specie 2,3 with specie 1

% Taking ten poles

C = ones(2,20) ;      % Concentration of 2 species wrt position
C(2,:) = C(2,:)*(0.5);

phi = zeros(1,20);    % Potential versus position
theta = 0;            % Surface excess of surfactant
spacing = 10^0;      % Represents the spacing between two poles

k(1) = spacing;
k(2) = b;


for t = 0 : 10^-8 : 10^-5
    
    inc = 10^-8;      % The time step
    
    temp = (10^6)*(10*(1-theta) - theta);    % This variable stores the increment in theta
    theta = theta + temp*inc;
    
    % To solve for C we need to use fsolve
    
    C(1,1) = C(1,1) + inc*(((C(1,2)-C(1,1)) - C(1,1)*(phi(2)-phi(1)))/(spacing) - temp)/spacing;
    C(2,1) = C(2,1) + inc*(((C(2,2)-C(2,1)) + C(2,1)*(phi(2)-phi(1)))/(spacing)^2);
    
    C(1,20) = 1;
    C(2,20) = 1/2;
    
    for i = 2:19
        C(1,i) = C (1,i) + inc*((C(1,i+1) + C(1,i-1) - 2*C(1,i))/(spacing*spacing) - ...
            (C(1,i+1)-C(1,i-1))*(phi(i+1)-phi(i-1))/(4*spacing^2) - C(1,i)*(phi(i+1) + phi(i-1) - 2*phi(i))/(spacing^2));
        
        C(2,i) = C (2,i) + inc*((C(2,i+1) + C(2,i-1) - 2*C(2,i))/(spacing*spacing) + ...
            (C(2,i+1)-C(2,i-1))*(phi(i+1)-phi(i-1))/(4*spacing^2) + C(2,i)*(phi(i+1) + phi(i-1) - 2*phi(i))/(spacing^2));
              
    end
    
    % To solve for phi we have 2 boundary conditions, we must use fsolve
    k(3) = theta;
    
    auxfunc = @ potential(phi, C,k); %(phi,C(:,:),k);
    [phi,fval] = fsolve(auxfunc, phi);
    
    
end

plot (C(1,:));