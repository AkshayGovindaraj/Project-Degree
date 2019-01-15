clc
clear all
close all

% This file tries to simulate the result of temperature when the heats of
% reactions are neglected. This only includes convection and radiation.
% This works only across the length of the grate furnace

V = 0.1;   % velocity (m per sec)
k = 0.05;    % Wattt per metre per kelvin
rho = 1.2;   % air density
L = 15;       % Length of bed
Cp = 2000;   % joules per metre cube per kelvin
d = 1;       % width of the bed
phi = 0.5;   % void fraction
mew = 2 * 10^-5;   % viscosity of air

% To find the heat transfer coefficient.
Re = (V*d*rho/(mew*(1-phi)));    % Reynolds number
Nu = 2 + 0.9*sqrt(Re);           % Nusselt number
h = Nu*k/d;                      % Heat transfer coefficient

ic(1) = 300;   % Temperature in Kelvin
ic(2) = 0.5;   % Cellulose conc
ic(3) = h;     % Sending the information to function

ic(4) = 0.8;   % Concentration of Active - Cellulose
ic(5) = 0.2;   % Concentration of hemi-cellulose
%ic(6) = 0.1;   % LIG-C
%ic(7) = 0.1;   % LIG-O
%ic(8) = 0.1;   % LIG-H
ic(10) = 0;

[t,T] = ode15s(@detail, [0 15], ic);

plot(t,T(:,1),'r');
hold on;
