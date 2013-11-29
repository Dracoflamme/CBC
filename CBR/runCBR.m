function [ output_args ] = runCBR( aus,labels )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    splitted = split(aus,labels);
    init_aus = splitted(1);
    init_labels = splitted(2);
    learning_aus = splitted(3);
    learning_labels = splitted(4);
    

end

