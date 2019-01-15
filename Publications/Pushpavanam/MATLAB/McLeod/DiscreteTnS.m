
% Verified : No need for new variable D : C perfect\
% Verified : Two times steps almost same as one time step


clc
clear all
%close all
tic
% To implement: pseudo steady state approximation where the Subsurface
% concentration and the surface excesss are in equilubrium.

% Further objectives
% 1) Critical : Need to reduce the running time
% 2) To see why the method fails for a spacing less than Debye length
% 3) Currently the time for which we obtain sensible results is too low
% 4) Why is phi not going to zero gradually ?? 
% 5) Why is theta decreasing at times
% 6) Why is C1 and phi not asymptotically approaching final value ??


kappa = 10;
w = 0;
a = 2;        % C(bar) divided by c1 (infinite)
b = 350;      % Gamma (max) divided by (c1 (inf) * Debye Length)
c = 1;        % Diffusivity ratios of specie 2,3 with specie 1

n = 81;       % Number of grids


C = ones(2,n) ;      % (Component number, spatial position) Concentration of 2 species wrt position 
C(2,:) = C(2,:)*(0.5);

phi = zeros(1,n);    % Potential versus position
theta = 0;            % Surface excess of surfactant
spacing = 2/(350*n);      % Represents the spacing between two poles

temp =0;
inc = 10^-9;
inct = 10^-11;

for t = 0 : 10^-9 : 10^-5
    
       
    
    for T = t:10^-11:(t+10^-9)
        
        
        temp = (10^4)*(kappa*C(1,1)*(1-theta) - theta)   ;  % This variable stores the increment in theta
        theta = theta + temp*inct ;
        
        
    C(1,1) = C(1,1) + inct*((   4*(C(1,3)-C(1,1) - C(1,2)*(phi(3)-phi(1)))         )/(2*spacing) - 3*temp   - ...
         ((C(1,4) - C(1,2)) - C(1,3)*(phi(4)-phi(2)))/(2*spacing)   )/(2*spacing);
      
    end
     
    C(2,1) = C(2,1) + inc*(((C(2,3)-C(2,1)) + C(2,2)*(phi(3)-phi(1)))/(2*(spacing^2)));
    
    
   
    for i = 2:(n-1)
        C(1,i) = C(1,i) + inc*((C(1,i+1) + C(1,i-1) - 2*C(1,i))/(spacing*spacing) - ...
            (C(1,i+1)-C(1,i-1))*(phi(i+1)-phi(i-1))/(4*spacing^2) - C(1,i)*(phi(i+1) + phi(i-1) - 2*phi(i))/(spacing^2));
       
        C(2,i) = C(2,i) + inc*((C(2,i+1) + C(2,i-1) - 2*C(2,i))/(spacing*spacing) + ...
            (C(2,i+1)-C(2,i-1))*(phi(i+1)-phi(i-1))/(4*spacing^2) + C(2,i)*(phi(i+1) + phi(i-1) - 2*phi(i))/(spacing^2));
              
    end
    
    % Use backslash operator to solve for phi
    % For this we have the eqn of the form AX = B followed by X = A\B
    
    % Loop to find A
    A = zeros(n,n);
    
    A(1,1) = -1;      % Interface B.C
    A(1,2) = 1;
    A(n,n) = 1;       % B.C at infinite : potential = 0
    
    %A(n-1,n-1) = -1;    % Boundary condition : potential gradient = 0 
    %A(n-1,n) = 1;
    
    for i = 2:(n-1)
       A(i,i-1) = 1;
       A(i,i+1) = 1;
       A(i,i) = -2;
    end
    
    % Loop to find b
    
    B = zeros(n,1);
    
    B(1) = spacing*theta*(b*b);
    B(n) = 0;
    
    for i = 2:(n-1)
        B(i) = spacing*spacing*b*b*(C(1,i)-2*C(2,i));
    end
    
    
    phi = A\B;
    
    %keyboard
end


Xi = 0:spacing:(spacing*(n-1));       % Non-dimensional distance

% semilogx(Xi(:), (C(1,:)-1),'r');
%  title('Surfactant');
% % 
% figure;
plot(Xi(:),2*(C(2,:)-0.5),'r');     % True only for C2(inf) = 0.5
title('Counter-ion');
 hold on

%figure
% semilogx(Xi(:),-phi(:)/phi(1),'g');  
% title('potential');
%hold on


% plot(Xi(:),-(phi(:))/phi(1),'g');
% title('Potential');    
% hold on

toc