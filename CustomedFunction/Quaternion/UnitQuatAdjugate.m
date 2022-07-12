function  output= UnitQuatAdjugate(q1)
        output=[q1(1);-q1(2);-q1(3);-q1(4)];
            output=output/norm(q1);
end