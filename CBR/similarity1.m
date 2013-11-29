function [ sim ] = similarity1(case1,case2)
%simali
%   Detailed explanation goes here
    pd1 = length(case1.problem_description);
    pd2 = length(case2.problem_description);
    sim = -1*abs(pd1-pd2);
end

