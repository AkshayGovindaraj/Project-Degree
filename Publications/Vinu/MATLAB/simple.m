function dy = simple(t,y)
dy = zeros(3,1);

Cp = 1000 ;  % Specific heat capacity of biomass (J per Kg per K)
k  = 0.15  ;  % W per metre per Kelvin
V  = 4.583*10^(-3);  % Velocity of the bed

dy(1) = (y(3)/(Cp*V*1000))*((10^9)*exp(-15000/y(1))*(-650) + 4*y(1)*exp(-5000/y(1))*(-490) + (8*10^7)*exp(-15500/y(1))*(1800)); %-y(2);
dy(2) = 0; %-(y(3)/(162*k))*((10^9)*exp(-15000/y(1))*(-650) + 4*y(1)*exp(-5000/y(1))*(-490) + (8*10^7)*exp(-15500/y(1))*(1800))
dy(3) = (-y(3)*(10^9)*exp(-15000/y(1)) - y(3)*(8*10^7)*exp(-15500/y(1)) - 4*y(3)*y(1)*exp(-5000/y(1)))*(1/V);

end