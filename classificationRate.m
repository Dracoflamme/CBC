function [ rate ] = classificationRate( predictions, y )
%Classification rate for a given classifier
%   generates a confusion matrix and takes the number of true positives and
%   true negatives as a proportion of the total number of examples
    m = createConfusionMatrix(predictions, y);
    rate = (m(1,1) + m(2,2))/length(predictions);

end

