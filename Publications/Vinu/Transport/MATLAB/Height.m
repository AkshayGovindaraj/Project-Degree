clc
clear all
%close all

tic

n = 20;  % number of grids

height = 1;    % height of bed in metres
Ts = 1200;     % Temperature of the surface of furnace
Ta = 300;      % Temperature of blowing air (assuming fixed for now)
rho = 800;     % Density
Cp = 1500;     % Specific heat
k = 0.1;       % Thermal conductivity
Length = 1;   
Width = 1;
dVol = (height*Length*Width)/n;
spacing = height/n;  

Va  = 1;       % Velocity of air
nu =  2*10^-5; % Kinematic viscosity of air
phi = 0.6;     % Packing fraction of bed

Re = Va*Width/(nu*(1-phi));
Nu = 2 + 0.9*sqrt(Re) ;

h = Nu*k/Width;      % Heat transfer coefficient

alpha = k/(rho*Cp);  % Thermal Diffusivity

T = ones(n,1)*300;   % Initializing to room temperature

for t = 0:(10^-5):10^1
    
    inc = 10^-5;     % Time step
    
    T(1) = T(1) + inc*( alpha*(-T(3)-3*T(1)+4*T(2))/(spacing*spacing) + (1/(dVol*rho*Cp))*(0.9*(Ts^4 - T(1)^4) ...
        - h*(T(1) - Ta)));
    
    for i = 2:(n-1)
        
        T(i) = T(i) + inc*( alpha*(T(i+1)+T(i-1)-2*T(i))/(spacing*spacing) - (1/(dVol*rho*Cp))*(h*(T(i) - Ta)));
        
    end
    
    T(n) = T(n) + inc*( alpha*(T(n)+T(n-2)-2*T(i))/(spacing*spacing) - (1/(dVol*rho*Cp))*(h*(T(n) - Ta)));

 
end

distance = [0:1/n:(1-1/n)];

plot(distance,T(:),'g');
hold on

toc
