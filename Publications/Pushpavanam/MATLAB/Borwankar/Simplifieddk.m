% THis file is used to call funcdk.m . Working method.
% Used to solve Simplified Diffusion- kinetic model


clc
clear all
%close all

ic(1) = 0;
ic(2) = 2; % psi
ic(3) = 0; % alpha
[z,mew] = ode45(@funcdk,[0.000001 4],ic);
plot(sqrt(z),mew(:,1));
hold on

ic(1) = 0;
ic(2) = 2; % psi
ic(3) = 2; % alpha
[z,mew] = ode45(@funcdk,[0 4],ic);
plot(sqrt(z),mew(:,1),'r');
grid on;
xlabel('Dimensionless Time sqrt(t)');
ylabel('Fractional Coverage');