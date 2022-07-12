function quat = AxisAngle2UnitQuat(Axis,RawAngle)
%Axis need to be col vector


if size(Axis,1)~=3||size(Axis,2)~=1
    error("The input axis need to be the 3*1 col vector");
end

Angle=mod(RawAngle,2*pi);
if Angle >pi
    Angle=Angle-2*pi;
end

    if norm(Axis)==0

    quat=[1;0;0;0];

    else
    
    Axis=Axis/norm(Axis);

    w=cos(Angle/2);
    wsin=sin(Angle/2);
    quat=[w;wsin*Axis];
    end 
end

