function [ precision ] = averagePrecision(class, predictions, y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    bin_mat = conf2bin(class,createConfusionMatrix( predictions, y ))
    tp = bin_mat(1,1);
    fp = bin_mat(2,1);
    precision = tp/(tp+fp);
    
end