classificationRate = zeros(1,10);
for i = 1:10
classificationRateSmall = 0;
for j = 1:6
classificationRateSmall = classificationRateSmall + similarity2Results(i).resultsClean.confusion_matrix(j, j);
end
total = sum(sum(similarity2Results(i).resultsClean.confusion_matrix));
classificationRate(i) = double(classificationRateSmall)/double(total);
end