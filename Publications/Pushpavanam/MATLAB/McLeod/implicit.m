clc
clear all
%close all

tic

kappa = 10;
w = 0;
a = 2;        % C(bar) divided by c1 (infinite)
b = 350;      % Gamma (max) divided by (c1 (inf) * Debye Length)
c = 1;        % Diffusivity ratios of specie 2,3 with specie 1

n = 40;       % Number of grids


C = zeros(4,n) ;      % (Component number, spatial position) Concentration of 2 species and potential wrt position 
C(2,:) = 0.5;
C(1,:) = 1;

D = C;                % D is C of the previous time

%phi = zeros(1,n);    % Potential versus position
theta = 0;            % Surface excess of surfactant
spacing = 2/(350*n);      % Represents the spacing between two grids

temp =0;
%inc = 10^-9;

for t = 0 : 10^-7 : 10^-5
    
    f = @(C) myfun(C,D);
    options = optimoptions('fsolve','TolFun',1e-8);
    C = fsolve(f,D,options);
    
    D = C;
end

 toc
 
 Xi = 0:spacing:(spacing*(n-1));       % Non-dimensional distance

% plot(Xi(:), (C(1,:)-1),'r');
% title('Surfactant');
% 
% figure;
plot((Xi(:)),2*(C(2,:)-0.5),'b');     % True only for C2(inf) = 0.5
title('Counter-ion');
hold on

% figure
% semilogx(Xi(:),2*(C(2,:)-0.5),'b');     % True only for C2(inf) = 0.5
% title('Counter-ion');
% %hold on



% plot(Xi(:),-C(3,:)/C(3,1),'b');
% title('Potential');    
 
 %plot([0:spacing:spacing*(n-1)],C(2,:),'r')
% hold on