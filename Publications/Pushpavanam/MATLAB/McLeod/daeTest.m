% This script was created to understand how the daeFunction works and try
% an example problem.

syms x1(t) x2(t) a b r(t)
eqs = [diff(x1(t),t) == a*x1(t) + b*x2(t)^2,...
       x1(t)^2 + x2(t)^2 == r(t)^2];
vars = [x1(t), x2(t)];

f = daeFunction(eqs, vars, a, b, r(t))

f = 
    @(t,in2,in3,param1,param2,param3)[in3(1,:)-param1.*in2(1,:)...
-param2.*in2(2,:).^2;-param3.^2+in2(1,:).^2+in2(2,:).^2]

a = -0.6;
b = -0.1;
r = @(t) cos(t)/(1 + t^2);
F = @(t, Y, YP) f(t,Y,YP,a,b,r(t));

t0 = 0;
y0 = [-r(t0)*sin(0.1); r(t0)*cos(0.1)];
yp0= [a*y0(1) + b*y0(2)^2; 1.234];

ode15i(F, [t0, 1], y0, yp0)