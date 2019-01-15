clc
clear all
close all

x = zeros(5,1);
x(1) =5.0001;
x(3) = -1.0001;
x(4) = 4;
x(5) = 10;
x(2) = 0.001;

x = fsolve( @myfunc,x) ;

x