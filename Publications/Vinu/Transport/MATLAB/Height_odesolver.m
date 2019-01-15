% This file is used to solve the height problem using the ode solvers

clc
clear all
%close all

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

T = ones(n,1)*300;   % Initial temperature

[Y, T] = ode15s(@rigid,[0 0.005],T);

distance = [0:1/n:(1-1/n)];

plot(distance,T(end,:),'c');
hold on