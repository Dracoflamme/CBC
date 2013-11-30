function [ bestCase ] = KNN( target, cases, k )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    bestCase = cases(1);
    bestSimilarity = similarity2(bestCase, target);
    for i=2 : length(cases)
        thisCase = cases(i);
        similarity = similarity2(thisCase, target);
        if similarity>bestSimilarity
            bestCase = thisCase;
            bestSimilarity = similarity;
        end
    end 
end