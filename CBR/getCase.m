function [ output ] = getCase( target, cases )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    casesLength = length(cases);
    for i = 1:casesLength
        c = cases(i);
        if (all(c.problem_description == target.problem_description) && (c.solution == target.solution))
            output = c;
            return
        end
    end
    output = 0;
    return
end

