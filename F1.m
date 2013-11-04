function [ measure ] = F1(class, confusion_matrix )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    precision = averagePrecision(class,confusion_matrix);
    recall = averageRecall(class, confusion_matrix );
    measure = 2*(precision*recall)/(precision+recall);

end