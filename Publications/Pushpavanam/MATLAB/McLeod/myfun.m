% This is a function file which is called upon by the implicit file

function F = myfun(C,D)

n = 40;

a = 1;
c = 350;
%d = 50;
inc = 10^-7;
spacing = 1/(350*n);
b = 10^4;
w = 0;
k = 10;

%F = [ (C(1,1) - D(1,1))/inc + a*((C(1,4) - C(1,2))/(2*spacing) - C(1,3)*(C(3,4)-C(3,2))/(2*spacing) + 3*b*(k*C(1,1)*(1-C(4,1)) ...
%    - C(4,1)*exp(w*C(4,1))) - 4*((C(1,3) - C(1,1))/(2*spacing) - C(1,2)*(C(3,3)-C(3,1))/(2*spacing)));
    
%    (C(2,1) - D(2,1))/inc + a*((C(2,4) - C(2,2))/(2*spacing) + C(2,3)*(C(3,4)-C(3,2))/(2*spacing) + 3*b*(k*C(2,1)*(1-C(4,1)) ...
%    - C(4,1)*exp(w*C(4,1))) - 4*((C(2,3) - C(2,1))/(2*spacing) + C(2,2)*(C(3,3)-C(3,1))/(2*spacing)));
    
%     (1/2*spacing)*(C(3,3) + 3*C(3,1) - 4*C(3,2)) - c*c*C(4,1);
     
%     for i = 2:(n-1)
     
%     (C(1,i)-D(1,i))/inc + (C(1,i+1) + C(1,i-1) - 2*C(i))/(spacing)^2 + C(1,i)*(C(3,i+1)+C(3,i-1) - 2*C(3,i)) ...
%         (C(1,i+1) - C(1,i-1);
    
%    (C(2,1) - D(2,1))/inc + a*((C(2,4) - C(2,2))/(2*spacing) + C(2,3)*(C(3,4)-C(3,2))/(2*spacing) + 3*b*(k*C(2,1)*(1-C(4,1)) ...
%    - C(4,1)*exp(w*C(4,1))) - 4*((C(2,3) - C(2,1))/(2*spacing) + C(2,2)*(C(3,3)-C(3,1))/(2*spacing)));
    
%     (1/2*spacing)*(C(3,3) + 3*C(3,1) - 4*C(3,2)) - c*c*C(4,1);
     
%     end
%     ]
     
     
F(1) = -(C(1,1) - D(1,1))/inc + a*( - b*(k*C(1,1)*(1-C(4,1)) ...
    - C(4,1)*exp(w*C(4,1))) + ((C(1,3) - C(1,1))/(2*spacing) - C(1,2)*(C(3,3)-C(3,1))/(2*spacing)))/(spacing);

F(2) = -(C(2,1) - D(2,1))/inc + a*(((C(2,3) - C(2,1))/(2*spacing) + C(2,2)*(C(3,3)-C(3,1))/(2*spacing)))/(spacing);

F(3) = (1/spacing)*(C(3,2) - C(3,1)) - (c*c)*C(4,1);

for i = 2:(n-1)
    
    F(3*i-2) = -(C(1,i)-D(1,i))/inc + (C(1,i+1) + C(1,i-1) - 2*C(1,i))/(spacing)^2 - (4*C(1,i)*(C(3,i+1)+C(3,i-1) - 2*C(3,i)) ...
        + (C(1,i+1) - C(1,i-1))*(C(3,i+1) - C(3,i-1))/(4*spacing*spacing) );
    
    F(3*i-1) = -(C(2,i)-D(2,i))/inc + (C(2,i+1) + C(2,i-1) - 2*C(2,i))/(spacing)^2 + (4*C(2,i)*(C(3,i+1)+C(3,i-1) - 2*C(3,i)) ...
        + (C(2,i+1) - C(2,i-1))*(C(3,i+1) - C(3,i-1))/(4*spacing*spacing) );
    
    F(3*i) =   (C(3,i+1) + C(3,i-1) - 2*C(3,i))/(spacing*spacing) +  (c*c)*(-C(1,i) + 2*C(2,i)) ;
    
end

F(3*n-2) = C(1,n) - 1;

F(3*n-1) = C(2,n) - 0.5;

F(3*n)   = C(3,n);

F(3*n+1) = (C(4,1) - D(4,1))/inc - b*(k*C(1,1)*(1-C(4,1))  - C(4,1)*exp(w*C(4,1)));

for i = 1:(n-1)
    F(3*n + i +1) = C(4,i+1);
end
    
