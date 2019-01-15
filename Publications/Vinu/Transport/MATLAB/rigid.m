% This file contains a function which is called by Height_odesolver
% This function solves the ode


function dT = rigid(t,T)

n = 50;  % number of grids

height = 1;    % height of bed in metres
Ts = 1200;     % Temperature of the surface of furnace
Ta = 300;      % Temperature of blowing air (assuming fixed for now)
rho = 300;     % Density
Cp = 1500;     % Specific heat
k = 0.1;       % Thermal conductivity
Length = 1;   
Width = 1;
dVol = (height*Length*Width)/n;
spacing = height/n;  

Va  = 3;       % Velocity of air
nu =  2*10^-5; % Kinematic viscosity of air
phi = 0.6;     % Packing fraction of bed

Re = Va*Width/(nu*(1-phi));
Nu = 2 + 0.9*sqrt(Re) ;

h = Nu*k/Width;      % Heat transfer coefficient

alpha = k/(rho*Cp);  % Thermal Diffusivity

%T = ones(n,1)*300;   % Initial temperature

dT = zeros(n,1);

dT(1) = ( alpha*(-T(3)-3*T(1)+4*T(2))/(spacing*spacing) + (1/(dVol*rho*Cp))*(0.5*(Ts^4 - 2*T(1)^4) ...
        - h*(T(1) - Ta)));
    
 for i = 2:(n-1)
        
        dT(i) = ( alpha*(T(i+1)+T(i-1)-2*T(i))/(spacing*spacing) - (1/(dVol*rho*Cp))*(0.5*(2*T(i)^4 - T(i+1)^4 - T(i-1)^4) ...
            + h*(T(i) - Ta)));
        
    end
    
    dT(n) = ( alpha*(T(n)+T(n-2)-2*T(i))/(spacing*spacing) - (1/(dVol*rho*Cp))*( 0.5*(2*T(n)^4 - T(n-1)^4 - 300^4) ...
        + h*(T(n) - Ta)));
    
    
    
end