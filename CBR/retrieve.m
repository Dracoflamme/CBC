function [ knns ] = retrieve( cbr, newcase )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    knns = KNN(n, newcase, cbr, 'similarity1');

end

