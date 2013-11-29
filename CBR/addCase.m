function [ cs ] = addCase( c, cs )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    tc = getCase(c,cs);
    if getCase(c,cs)~=0
        c.typicality = c.typicality+1;
    else
        cs = [cs tc];
    end

end

