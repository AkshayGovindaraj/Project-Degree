% After 20 -40 loops the plot doesn`t change much



clc
clear all
%close all

tic

kappa = 10;

a = 2;       
b = 350;     
c = 1;       

n = 40;      

C = ones(2,n) ;      

C(2,:) = C(2,:)*(0.5);


w = 0;
phi = zeros(1,n);   
theta = 0;           
spacing = 2/(350*n);     
temp =0;


inc = 10^-11;
inct = 10^-11;



for t = 0 : 10^-11 : 10^-7
    
    D = C;
    thetavar = theta;
       
    for x = 1:1
   %  for T = t:10^-11:(t+10^-9)
        
        
        temp = (10^4)*(kappa*C(1,1)*(1-theta) - theta)   ;  
        theta = thetavar + temp*inct ;
        
        
    C(1,1) = D(1,1) + inct*( 4*(C(1,3)-C(1,1) - C(1,2)*(phi(3) - phi(1)))/(4*spacing)  - (1.5)*temp - ... 
        (C(1,4)-C(1,2) - C(1,3)*(phi(4) - phi(2)))/(4*spacing) )/(spacing);
      
    
     
    C(2,1) = D(2,1) + inct*(4*(C(2,3)-C(2,1) + C(2,2)*(phi(3)-phi(1)))/(4*(spacing^2)) - ...
         (C(2,4)-C(2,2) + C(2,3)*(phi(4)-phi(2)))/(4*(spacing^2)) );
    
 %   end
   
    for i = 2:(n-1)
        C(1,i) = D(1,i) + inc*((C(1,i+1) + C(1,i-1) - 2*C(1,i))/(spacing*spacing) - ...
            (C(1,i+1)-C(1,i-1))*(phi(i+1)-phi(i-1))/(4*spacing^2) - C(1,i)*(phi(i+1) + phi(i-1) - 2*phi(i))/(spacing^2));
       
        C(2,i) = D(2,i) + inc*((C(2,i+1) + C(2,i-1) - 2*C(2,i))/(spacing*spacing) + ...
            (C(2,i+1)-C(2,i-1))*(phi(i+1)-phi(i-1))/(4*spacing^2) + C(2,i)*(phi(i+1) + phi(i-1) - 2*phi(i))/(spacing^2));
              
    end
    
    A = zeros(n,n);
    
    A(1,1) = -1;      
    A(1,2) = 1;
   % A(1,3) = -1;
    A(n,n) = 1;       
    
    
    
    for i = 2:(n-1)
       A(i,i-1) = 1;
       A(i,i+1) = 1;
       A(i,i) = -2;
    end
    
       
    B = zeros(n,1);
    
    B(1) = spacing*theta*(b*b);
    B(n) = 0;
    
    for i = 2:(n-1)
        B(i) = spacing*spacing*(C(1,i)-2*C(2,i))*(b*b);
    end
    
    
    phi = A\B;
    end
    
end


Xi = 0:spacing:(spacing*(n-1));       

plot((Xi(:)),2*(C(2,:)-0.5),'b');     
title('Counter-ion');
hold on

toc
