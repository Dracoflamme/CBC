function [ recall ] = averageRecall(class, predictions, y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here   
    bin_mat = conf2bin(class,createConfusionMatrix( predictions, y ));
    tp = double(bin_mat(1,1));
    fn = double(bin_mat(1,2));
    recall = tp/(tp+fn);
    
end
