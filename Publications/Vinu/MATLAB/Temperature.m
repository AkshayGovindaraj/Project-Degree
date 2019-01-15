clc
clear all
close all

ic(1) = 700;   % To = 300 K
ic(2) = (1000/162)  ;   % Best possible assumption
ic(3) = 0;  % one tonne per metre cube

[t,y] = ode45(@simple, [0 5], ic);

plot(t,y(:,1));