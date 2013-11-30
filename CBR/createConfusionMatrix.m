function [ matrix ] = createConfusionMatrix( predictions, y )
    matrix = zeros(6, 6, 'uint32');
    for prediction = 1:length(predictions)
        p = predictions(prediction);
        a = y(prediction);
        matrix(a,p) = matrix(a,p) + 1;
    end
end

