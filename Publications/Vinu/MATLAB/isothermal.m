clc
clear all
close all

ic = zeros(38,1);
ic(1)=0.5;
ic(3)=0.05;
ic(4)=0.05;
ic(5)=0.05;
ic(6)=0.35;
%options = odeset('InitialStep',1.5)
[T Y] = ode15s(@funciso, [0 0.0000005], ic);

%plot(T,(Y(:,3)+Y(:,4)+Y(:,5)+Y(:,28)+Y(:,31)+Y(:,38)),'-',T,(Y(:,1)+Y(:,2)),'-.',T,(Y(:,6)+Y(:,18)+Y(:,19)),'.');
%title('B-Lignin, G-Cellulose, R-Hemi-Cellulose');
%xlabel('Time'); 
%ylabel('Y(t)');

%plot(T,(Y(:,17)),'-',T,(Y(:,30)),'-.',T,(Y(:,29)),'.');
%title('r-Coumaryl,b-LVG,g-Phenol for 1 mole reactant');
%xlabel('Time'); 
%ylabel('Y(t)');

%plot(T,(Y(:,13)),'-',T,(Y(:,14)),'-.',T,(Y(:,20)),'.');
%title('r-Hydrogen,b-Carbon Monoxide,g-Methane for 1 mole reactant');
%xlabel('Time'); 
%ylabel('Y(t)');
%hold on;

plot(T,(Y(:,16)),'-',T,(Y(:,15)),'-.',T,(Y(:,12)),'.');
title('r-Carbon Dioxide,b-Char,g-Water for 1 mole reactant');
xlabel('Time'); 
ylabel('Y(t)');