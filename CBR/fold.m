function [ output ] = fold( aus, emotions, fold_index )
%% fold_index : 1-10
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    chunkSize = floor(size(aus, 1)/10);
    startPoint = chunkSize * (fold_index - 1) + 1;
    endPoint = chunkSize * fold_index;
    ausVal = aus(startPoint:endPoint, :);
    ausTrainA = aus(1:(startPoint - 1), :);
    ausTrainB = aus((endPoint + 1):size(aus,1), :);
    emotionsVal = emotions(startPoint:endPoint, :);
    emotionsTrainA = emotions(1:(startPoint - 1), :);
    emotionsTrainB = emotions((endPoint + 1):size(aus,1), :);
    ausTrain = vertcat(ausTrainA, ausTrainB);
    emotionsTrain = vertcat(emotionsTrainA, emotionsTrainB);
    output = {ausVal emotionsVal ausTrain emotionsTrain};
end