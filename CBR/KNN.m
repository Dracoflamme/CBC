function [ bestCase ] = KNN( target, cases, k )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    bestCaseSimilarity = zeros(size(cases, 1), 2);
    casesLength = length(cases);
    for i=1 : casesLength
        thisCase = cases(i);
        bestCaseSimilarity(i, 1) = i;
        bestCaseSimilarity(i, 2) = similarity2(thisCase, target);
    end
    bestCaseSimilarity = sortrows(bestCaseSimilarity, 2);
    for i = 1:k
        bestCase(i) = cases(bestCaseSimilarity(casesLength - i));
    end
end