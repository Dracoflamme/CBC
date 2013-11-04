function [ folds ] = createFoldDecisionTrees( examples, labels )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    data_folds = fold(examples,labels);
    folds = struct([]);
    for i = 1:length(data_folds.test)
        folds(i).trees = createDecisionTrees(data_folds.train(i).examples,1:45,data_folds.train(i).labels);
        folds(i).test = data_folds.test(i);
    end
end

