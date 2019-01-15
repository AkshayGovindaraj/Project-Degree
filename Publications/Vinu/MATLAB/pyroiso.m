function [dydt,f] = pyroiso(t,y)

i=1173.15;
f=zeros(23,1);
f(1)=8*(10^13)*exp(-45000*4.18/(8.314*i));
f(2)=(10^9)*exp(-30000*4.18/(8.314*i));
f(4)=8*(10^7)*exp(-31000*4.18/(8.314*i));
f(3)=4*i*exp(-10000*4.18/(8.314*i));
f(5)=(10^10)*exp(-31000*4.18/(8.314*i));
f(6)=3*(10^9)*exp(-32000*4.18/(8.314*i));
f(7)=0.15*i*exp(-8000*4.18/(8.314*i));
f(8)=3*i*exp(-11000*4.18/(8.314*i));
f(9)=(10^10)*exp(-33000*4.18/(8.314*i));
f(10)=4*(10^15)*exp(-48500*4.18/(8.314*i));
f(11)=2*(10^13)*exp(-37500*4.18/(8.314*i));
f(12)=(10^9)*exp(-25500*4.18/(8.314*i));
f(13)=5*(10^6)*exp(-31500*4.18/(8.314*i));
f(14)=3*(10^8)*exp(-30000*4.18/(8.314*i));
f(15)=(10^2)*exp(-15000*4.18/(8.314*i));
f(16)=8*i*exp(-12000*4.18/(8.314*i));
f(17)=1.2*(10^9)*exp(-30000*4.18/(8.314*i));
f(18)=0.25*i*exp(-8000*4.18/(8.314*i));
f(19)=6*(10^5)*exp(-24000*4.18/(8.314*i));
f(20)=5*(10^11)*exp(-50000*4.18/(8.314*i));
f(21)=5*(10^11)*exp(-71000*4.18/(8.314*i));
f(22)=5*(10^11)*exp(-75000*4.18/(8.314*i));
f(23)=5*(10^12)*exp(-50000*4.18/(8.314*i));

dydt=zeros(41,1);

b=1;
dydt(1)= (-1)*(f(1)*y(1)+f(4)*y(1));
dydt(2)= b*(f(1)*y(1))-f(2)*y(2)-f(3)*y(2);
dydt(3)= (-1)*(f(5)*y(3));
dydt(4)= b*(0.4*f(5)*y(3)-(f(6)+f(7)+f(8))*y(4));
dydt(5)= 0.6*f(5)*y(3)-f(9)*y(5);
dydt(6)= -f(10)*y(6);
dydt(7)= -f(11)*y(7);
dydt(8)= -f(12)*y(8);
dydt(9)= -f(13)*y(9)+f(10)*y(6);
dydt(10)= f(11)*y(7)+f(12)*y(8)-(f(14)+f(15))*y(10);
dydt(11)= f(14)*y(10)-(f(14)+f(15)+f(16))*y(11);
dydt(12)= 0.61*f(2)*y(2)+6*f(4)*y(1)+0.875*f(6)*y(4)+0.675*f(7)*y(4)+f(9)*y(5)+5.735*f(10)*y(6)+6.75*f(13)*y(9)+4.15*f(14)*y(10)+10.15*f(15)*y(10)+5.5*f(17)*y(11)+6*f(18)*y(11);
dydt(13)= 0.83*f(2)*y(2)+5*f(4)*y(1)+0.025*f(6)*y(4)+0.25*f(7)*y(4)+0.2*f(9)*y(5)+f(10)*y(6)+0.7*f(13)*y(9)+0.9*f(14)*y(10)+1.5*f(15)*y(10)+0.95*f(17)*y(11)+0.6*f(18)*y(11);
dydt(14)= 0.16*f(2)*y(2)+1.1*f(6)*y(4)+0.7*f(7)*y(4)+0.2*f(9)*y(5)+0.32*f(10)*y(6)+0.4*f(13)*y(9)+0.3*f(14)*y(10)+f(17)*y(11)+0.4*f(18)*y(11)+f(20)*y(29)+f(21)*y(30);
dydt(15)= 0.22*f(2)*y(2)+1.075*f(6)*y(4)+0.75*f(7)*y(4)+0.425*f(9)*y(5)+f(12)*y(8)+0.05*f(14)*y(10)+0.5*f(15)*y(10)+f(19)*y(33)+0.4*f(18)*y(11);
dydt(16)= f(21)*y(30)+f(22)*y(27);
dydt(17)= 0.1*f(2)*y(2)+0.625*f(6)*y(4)+0.495*f(10)*y(6)+f(23)*y(31);
dydt(18)= f(3)*y(2);
dydt(19)= 0.08*f(10)*y(6)+0.2*f(13)*y(9);
dydt(20)= 0.1*f(10)*y(6)+0.3*f(13)*y(9);
dydt(21)= f(2)*y(2)+0.2*f(9)*y(5)+0.35*f(13)*y(9);
dydt(22)= 0.2*f(2)*y(2);
dydt(23)= 0.2*f(2)*y(2)+0.2*f(17)*y(11);
dydt(24)= 0.25*f(2)*y(2);
dydt(25)= 0.2*f(2)*y(2)+0.2*f(17)*y(11)+f(11)*y(7);
dydt(26)= 0.01*f(2)*y(2)+0.025*f(6)*y(4)+0.05*f(7)*y(4)+0.025*f(9)*y(5)+0.05*f(14)*y(10)+0.05*f(17)*y(11);
dydt(27)= 0.01*f(2)*y(2)+1.025*f(6)*y(4)+0.4*f(7)*y(4)+0.325*f(9)*y(5)+0.15*f(14)*y(10)+1.3*f(15)*y(10)+0.4*f(18)*y(11)-f(22)*y(27);
dydt(28)= 0.25*f(6)*y(4)+0.5*f(14)*y(10)-f(23)*y(28);
dydt(29)= 0.15*f(7)*y(4)+0.4*f(13)*y(9)+f(14)*y(10)+1.6*f(15)*y(10)+0.45*f(17)*y(11)+0.2*f(18)*y(11)-f(20)*y(29);
dydt(30)= 1.3*f(7)*y(4)+f(9)*y(5)+f(10)*y(6)+f(13)*y(9)+0.6*f(14)*y(10)+3.9*f(15)*y(10)+0.5*f(17)*y(11)+2*f(18)*y(11)-f(21)*y(30);
dydt(31)= 0.625*f(7)*y(4)+0.55*f(9)*y(5)+0.65*f(13)*y(9)+0.15*f(14)*y(10)+1.45*f(15)*y(10)+0.6*f(17)*y(11)+0.4*f(18)*y(11)-f(23)*y(31);
dydt(32)= 0.375*f(7)*y(4)+0.275*f(9)*y(5)+0.6*f(13)*y(9)+0.2*f(14)*y(10)+0.65*f(17)*y(11)+0.5*f(18)*y(11)-f(23)*y(32);
dydt(33)= 0.55*f(9)*y(5)-f(19)*y(33);
dydt(34)= f(8)*y(4);
dydt(35)= 0.3*f(6)*y(4)+0.1*f(9)*y(5)+0.2*f(17)*y(11);
dydt(36)= 0.125*f(6)*y(4)+0.1*f(9)*y(5);
dydt(37)= 0.25*f(6)*y(4)+0.41*f(10)*y(6)+0.7*f(15)*y(10)-f(23)*y(37);
dydt(38)= 0.5*f(14)*y(10)+0.4*f(17)*y(11)+f(23)*y(28);
dydt(39)= f(16)*y(11);
dydt(40)= 0;

