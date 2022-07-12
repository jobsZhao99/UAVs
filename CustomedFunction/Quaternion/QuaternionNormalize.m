function y = QuaternionNormalize(u)

    if ~iscolumn(u)
       error ("The Input of the q should be col vector")
    end
    nor=sqrt(u.'*u);
    if(nor~=0)
    y=u/nor;
    else
        error ("The norm of the q is zeros, which could not be normalized")
    end
    
end