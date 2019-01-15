% This file is a modification to the particle_main file and we account for
% the potential in this file

clc
clear all
close all

a = 50;       % Constant for potential 
b = 10^6;    % Constant ; adsorption kinetics
d = 10^-2;       % Constant in boundary condition
m = 1;       % Exponent in adsorption rate equation
B = 10^6;    % Equilubrium constant

n = 200;     % Number of grids

