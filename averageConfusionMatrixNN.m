function [cm] = averageConfusionMatrixNN(x,y,params,one_or_six)
    average = zeros(6,6,'uint32');
    iterations = 10;
    for i =1:iterations,
        cv = createConfusionMatrixANN(x,y,params,one_or_six)
        average = average + cv;
    end
    average = average/iterations
    cm = average
end