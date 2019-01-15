% THis file is a failed attempt.


clc
clear all
close all

   % This file is used mainly to call the function funcBWfinal and plot the
   % graphs obtained from the results.
   
A = 0;
psi = 20;
alpha = 0;

X = funcBWfinal(psi,alpha,A,4);

ze = [0.01:0.01:1];

plot(sqrt(ze),X);