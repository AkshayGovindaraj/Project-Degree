function dT = detail(t,T)
dT = zeros(10,1);

% This file is called by generalcaller.
% 9- HCE1 , 10 - HCE2

A = 1000 ;   % Surface Area per unit volume (metre squared/kg)
rho = 1500;  % Briquette density
Cp = 1000; % Specific Heat capacity
%k = 0.15;  % thermal conductivity
%alpha = k/(rho*Cp);
V =  0.1;  % effectively a batch reactor when V = 0 (was written 1 ?? )

f = 0.9;   % Fraction of the heat absorbed due to radiation.
e = 0.7;   % Emissivity; unfair assumption (need to modify)
sig = 5.67*(10^-8);  % stefan`s constant
Ts = 1200; % Surface Temperature
h  = T(3);  % Stores the heat transfer coefficient 
To = 300;

% To calculate the increment in temperature we break the increments into
% different contributions

delT1 = f*e*sig*(Ts^4 - T(1)^4) - h*(T(1)-To);  % Increment due to convection and radiation
delT2 = rho*T(4)*((10^9)*exp(-15000/T(1))*650 + (4*T(1))*exp(-5000/T(1))*490 - 8*(10^7)*exp(-15500/T(1))*1800);   
         % kilo Joule per second per metre cube released by
         % Active-Cellulose reactions
delT3 = rho*T(5)* ((10^10)*exp(-15500/T(1))*100);  % HCE rxns
delT4 = rho*T(9)* ((3*10^9)*exp(-16000/T(1))*22 - 0.15*T(1)*exp(-4000/T(1))*1400 + 3*T(1)*exp(-5500/T(1))*590);  %HCE1
delT5 = rho*T(10)*(-(10^10)*exp(-16500/T(1))*330); % HCE2

density = 0.3;   % one percent inorganics
for i = 4:10
    density = density + T(i)
end

% Need to account for mass balance. Temperature not realistic (14/7/15)


dT(1) = (1/(density*Cp*V))*(delT1-(delT2+delT3+delT4+delT5)*0.85);
dT(2) = -T(2)*(8*(10^13))*exp(-22500/T(1)) ;
dT(3) = 0;
dT(4) = -T(4)*((10^9)*exp(-15000/T(1)) + (4*T(1))*exp(-5000/T(1)) + 8*(10^7)*exp(-15500/T(1))) + T(2)*(8*(10^13))*exp(-22500/T(1));
dT(5) = -T(5)* ((10^10)*exp(-15500/T(1)));
dT(9) = 0.4*T(5)* ((10^10)*exp(-15500/T(1))) -T(9)*((3*10^9)*exp(-16000/T(1)) + 0.15*T(1)*exp(-4000/T(1)) + 3*T(1)*exp(-5500/T(1)));
dT(10)= 0.6*T(5)* ((10^10)*exp(-15500/T(1))) - T(10)*((10^10)*exp(-16500/T(1))) ;