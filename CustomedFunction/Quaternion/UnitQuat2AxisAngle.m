function [Axis,Angle] =UnitQuat2AxisAngle(q1)
if q1(1)<0
    q1=-q1;
end

Angle=acos(q1(1))*2;
if Angle>pi
Angle=Angle-2*pi;
end

if(Angle==0)
    Axis=[1;0;0];
else
Axis=q1(2:4)/sin(Angle/2);
end

if Axis(3)<0
    Axis=-Axis;
    Angle=-Angle;
elseif Axis(3)==0&&Axis(2)<0
    Axis=-Axis;
    Angle=-Angle;
elseif Axis(3)==0&&Axis(2)==0&&Axis(1)<0
    Axis=-Axis; 
    Angle=-Angle;
end

end