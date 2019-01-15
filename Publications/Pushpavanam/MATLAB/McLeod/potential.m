% This file contains a function which will solve for potential in the
% DiscreteTnS program.

function F = potential(phi,C,k)

% The k is added to input whichever constant is needed
spacing = k(1) ;
b = k(2) ;         % gamma m /(C1(inf)*lambda1)
theta = k(3) ;


F = [phi(10);
    (phi(2) - phi(1))/spacing - (b^2)*theta;
    (1/spacing^2)*(phi(3)+phi(1)-2*phi(2)) + (b^2)*(C(1,2)-C(2,2));
    (1/spacing^2)*(phi(4)+phi(2)-2*phi(3)) + (b^2)*(C(1,3)-C(2,3));
    (1/spacing^2)*(phi(5)+phi(3)-2*phi(4)) + (b^2)*(C(1,4)-C(2,4));
    (1/spacing^2)*(phi(6)+phi(4)-2*phi(5)) + (b^2)*(C(1,5)-C(2,5));
    (1/spacing^2)*(phi(7)+phi(5)-2*phi(6)) + (b^2)*(C(1,6)-C(2,6));
    (1/spacing^2)*(phi(8)+phi(6)-2*phi(7)) + (b^2)*(C(1,7)-C(2,7));
    (1/spacing^2)*(phi(9)+phi(7)-2*phi(8)) + (b^2)*(C(1,8)-C(2,8));
    (1/spacing^2)*(phi(10)+phi(8)-2*phi(9)) + (b^2)*(C(1,9)-C(2,9));
    ];
    
end