function [ output ] = getCase( target, cases )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    casesLength = length(cases);
    for i = 1:casesLength
        c = cases(i);
        d1=c.problem_description;
        d2=target.problem_description;
        if (length(d1) == length(d2))
            if (all(d1 == d2) && (c.solution == target.solution))
                output = i;
                return
            end
        end
    end
    output = 0;
    return
end

