clc
clear all
close all

%This file is used to call pyroiso, which is isothermal pyrolysis without 
% Char oxidation.

%for i = 0:10     %cellulose
 %   for j = 0:10 %hemi-cellulose
ic = zeros(41,1);
%ic(1)=0.45;      % cellulose
%ic(6)=0.08;     % lignin-c
%ic(7)=0.08;     % lignin-h
%ic(8)=0.09;     % lignin-o
%ic(3)=0.3;     % hemi-cellulose

%ic(12) = 0.01;
ic(1) = 0.4;
ic(6) = 0.1;
ic(3) = 0.3;  
%if ic(3)<0
 %   continue;
%end
ic(7)=ic(6);   % assuming equal concentrations of ligc 
ic(8)=ic(6);   % ligo and ligh

ic(1) = ic(1)/162;  % converting mass to moles
ic(3) = ic(3)/132;  % moles in 1 kg input
ic(6) = ic(6)/258;
ic(7) = ic(7)/436;
ic(8) = ic(8)/422;
ic(12) = ic(12)/12;

%options = odeset('InitialStep',1.5)
[T Y] = ode15s(@pyroiso, [0 1], ic);


l = length(T);
Y((l-1),:)
%final = Y((l-1),1)
%end
%end

%final = final.*18 %converting back to mass

%x=[0:0.1:1];
%y=[0:0.1:1];

%[xx,yy]=meshgrid(x,y)

%figure
%surf(x,y,final);
%title('Yield of water vapor');
%xlabel('Cellulose mass frac');
%ylabel('Lignin mass frac');
%axis tight
%shading interp;
%colorbar;

%plot(T,(18*Y(:,13)));
%title('Pyrolysis - Water Vapor');
%xlabel('time');
%ylabel('Concentration');


%plot(T,(Y(:,12)),'-',T,(Y(:,13)),'-.',T,(Y(:,15)),'.');
%title('r-Carbon Dioxide,b-Char,g-Water for 1 mole reactant');
%xlabel('Time'); 
%ylabel('Y(t)');

%plot(T,(Y(:,6)+Y(:,7)+Y(:,8)+Y(:,9)+Y(:,10)+Y(:,11)),'-',T,(Y(:,1)+Y(:,2)),'-.',T,(Y(:,3)+Y(:,4)+Y(:,5)),'.');
%title('B-Lignin, G-Cellulose, R-Hemi-Cellulose');
%xlabel('Time'); 
%ylabel('Y(t)');

