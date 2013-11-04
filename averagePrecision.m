function [ precision ] = averagePrecision(class, confusion_matrix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    bin_mat = conf2bin(class,confusion_matrix);
    tp = double(bin_mat(1,1));
    fp = double(bin_mat(2,1));
    precision = tp/(tp+fp);
    
end
