function  output=UnitQuatMultiply(q1,q2)
% q1*q2 input and output is the col vector, output are not be normalized

m=size(q1,1);
n=size(q1,2);
if m~=4||n~=1
    error("The first input need to be 4*1 col vector");
end
m=size(q2,1);
n=size(q2,2);
if m~=4||n~=1
    error("The second input need to be 4*1 col vector");
end

Mq1=[q1(1) -q1(2) -q1(3) -q1(4);
     q1(2) q1(1) -q1(4) q1(3);
     q1(3) q1(4) q1(1) -q1(2);
     q1(4) -q1(3) q1(2) q1(1)];
output=Mq1*q2;
% if output(1)<0
%     output=-output;
% end
end