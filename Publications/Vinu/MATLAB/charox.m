clc
clear all
close all

ic = zeros(41,1);

ic(1)= 0.40; % cellulose mass fraction
ic(3)= 0.30; % Hemi-cellulose
ic(6)= 0.10; % Lignin - C
ic(7)= 0.10; % Lignin - H
ic(8)= 0.10; % Lignin - O
ic(41)= 0; % Initial char
ic(12)= ic(41); % = total char 

ic(1) = ic(1) - ic(41);

ic(1) = ic(1)/162;  % converting mass to moles
ic(3) = ic(3)/132;  % moles in 1 kg input
ic(6) = ic(6)/258;
ic(7) = ic(7)/436;
ic(8) = ic(8)/422;
ic(41)=ic(41)/12;
ic(12)=ic(12)/12;

[T Y] = ode15s(@pyroiso, [0 1], ic);

l = length(T);
final = Y((l-1),:);

final(:,41) = final(:,12)

[T1 Y1] = ode15s(@funccharox, [0 0.005], final);

MW = [162,162,132,132,132,258,436,422,258,378,208,12,18,28,44,2,16,162,94,150,60,58,44,96,58,46,2,32,28,30,16,28,44,132,30,46,28,32,208,0,12] % Molecular weight matrix
%MW = transpose(MW);

l = length(T1);
Y2 = Y1((l-1),:).*MW;

%To find mass

mass=0;
for i= 1:1:40
    mass=mass + Y2(i);
end
mass
(Y2/mass)

%plot(T1,(44*Y1(:,15)));
%title('Char oxidation - Carbon Dioxide');
%xlabel('time (s)');
%ylabel('Concentration');
