% This file was created to inspect how MATLAB handles differential
% equations having implicit terms.

clc
clear all
close all

% Initial Condition y = 2
ic = 2;
[T Y] = ode45(@functest, [0 10], ic);

plot(T,Y,'r');
hold on

% Comparison with the analytical solution

for t = 0:0.01:10;
    y = 1 + 1/(2*exp(t) - 1);
    plot(t,y);
    hold on
end

% Initial result has no error