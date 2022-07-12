function q = DirectionCosMatrix2UnitQuat(R)
w=sqrt(R(1,1)+R(2,2)+R(3,3)+1)/2;
q=1/4*[4*w;(R(3,2)-R(2,3))/w;(R(1,3)-R(3,1))/w;(R(2,1)-R(1,2))/w;];


% q=q/UnitQuatNorm(q);
% norm(q)
end