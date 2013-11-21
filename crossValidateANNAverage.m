average = 0;
iterations = 5;
for i =1:iterations,
    cv = crossValidateANN(x,y,'six','no',params);
    average = average + mean(cv);
end
average = average/iterations
