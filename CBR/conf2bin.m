function [ bin_mat ] = conf2bin( class, confusion_matrix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    %creates new binary confusion matrix like in page 13 of spec
    %     
    bin_mat = zeros(2,2,'uint32');
    %max dimension of confusion matrix
    conf_mat_dim = length(confusion_matrix(:,1));
    for row = 1:conf_mat_dim
        for col = 1:conf_mat_dim
            x = confusion_matrix(row,col);
            if row ~= class 
                if col ~=class
                    bin_mat(2,2) = bin_mat(2,2) + x;
                else
                    bin_mat(2,1) = bin_mat(2,1) + x;
                end
            elseif col ~=class
                    bin_mat(1,2) = bin_mat(1,2) + x;
            else
                 bin_mat(1,1) = bin_mat(1,1) + x;
            end
        end
    end
