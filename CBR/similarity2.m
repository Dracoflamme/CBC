function [ sim ] = similarity1(case1,case2)
%simali
%   Detailed explanation goes here
    aus1 = fromAU(case1.problem_description);   
    aus2 = fromAU(case2.problem_description);
    compared = aus1 == aus2;
    sim = sum(compared);
end

