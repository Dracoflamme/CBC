function [ recall ] = averageRecall(class, confusion_matrix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here   
    bin_mat = conf2bin(class,confusion_matrix);
    tp = double(bin_mat(1,1));
    fn = double(bin_mat(1,2));
    recall = tp/(tp+fn);
    
end
