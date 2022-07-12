function  output= UnitQuatDivide(q1,q2)
% QuatDivde q1/q2=q1*q2-1;
q2=UnitQuatInverse(q2);
output=UnitQuatMultiply(q1,q2);
end