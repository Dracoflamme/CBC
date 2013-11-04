function [ measure ] = F1(class, predictions, y )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    precision = averagePrecision(class, predictions, y );
    recall = averageRecall(class, predictions, y );
    measure = 2*(precision*recall)/(precision+recall);

end