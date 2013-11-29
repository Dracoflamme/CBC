function [ cs ] = addCase( c, cs )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    tc = getCase(c,cs);
    if tc ~= 0
        cs(tc).typicality = cs(tc).typicality+1;
    else
        cs = [cs c];
    end
end

