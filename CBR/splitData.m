function [ output ] = splitData( aus, emotions )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    pivot = round(size(aus, 1) / 5);
    ausA = aus(1:pivot, :);
    ausB = aus(pivot + 1:length(aus), :);
    emotionsA = emotions(1:pivot, :);
    emotionsB = emotions(pivot + 1:length(emotions), :);
    output = {ausA emotionsA ausB emotionsB};
end

