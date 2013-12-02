function [ sim ] = similarity3( case1, case2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    aus1 = case1.problem_description;
    aus2 = case2.problem_description;
    sim = 0;
    for i = 1:length(aus1)
        for j = 1:length(aus2)
            if (aus1(i) == aus2(j))
                sim = sim + 1;
            end
        end
    end
end

