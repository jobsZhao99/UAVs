function  output= UnitQuatRotation(q,P)
% q*r*q-1
m=size(P,1);
n=size(P,2);
if m*n==3
    r=[0;P(1);P(2);P(3)];
else
    r=P;
end
f1=UnitQuatMultiply(q,r);
output=UnitQuatMultiply(f1,UnitQuatInverse(q));
output=output(2:4);
end