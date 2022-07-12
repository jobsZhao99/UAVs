function  output= UnitQuatInverse(q1)
        output=UnitQuatAdjugate(q1)/UnitQuatNorm(q1);
end