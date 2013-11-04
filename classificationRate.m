function [ rate ] = classificationRate(predictions, y )
%Classification rate for a given classifier
%   generates a confusion matrix and takes the number of true positives and
%   true negatives as a proportion of the total number of examples
    rate = 0;
    for i=1:length(predictions)
        if predictions(i) == y(i)
            rate = rate + 1;
        end
    end
    rate = rate/length(predictions)
end

