function [ knns ] = retrieve( cbr, newcase )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    knns = KNN(newcase, cbr, 1);

end

