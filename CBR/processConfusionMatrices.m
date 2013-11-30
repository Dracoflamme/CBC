function [ results ] = processConfusionMatrices( matrices )
%PROCESSCONFUSIONMATRICES Summary of this function goes here
%   Detailed explanation goes here
    folds = size(matrices,1);
    results = cell(folds,1);
    for fold = 1:folds  
       confMat = cell2mat(matrices(fold));
       precision = zeros(6,1);
       recall = zeros(6,1);
       f1 = zeros(6,1);
       for class=1:6
          precision(class) = averagePrecision(class,confMat); 
          recall(class) = averageRecall(class,confMat);
          f1(class) = F1(class,confMat);
       end
       result = createResultStruct(confMat, precision, recall, f1);
       results(fold) = {result};
    end

end

