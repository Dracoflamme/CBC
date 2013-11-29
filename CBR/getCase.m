function [ output ] = getCase( target, cases )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    casesLength = length(cases);
    for i = 1:casesLength
        c = cases(i);
        if (length(c.problem_description) == length(target.problem_description))
            if (all(c.problem_description == target.problem_description) && (c.solution == target.solution))
                output = i;
                return
            end
        end
    end
    output = 0;
    return
end

