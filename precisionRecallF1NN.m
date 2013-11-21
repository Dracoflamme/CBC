load('confmats.mat');
precisions = zeros(6,4,'double');
recalls = zeros(6,4,'double');
f1s = zeros(6,4,'double');
types = cat(3,conf_mat_clean_one, conf_mat_clean_six, conf_mat_noisy_one, conf_mat_noisy_six);
averagePrecision(1,types(1));
for y = 1:4
    for x = 1:6
        precision = averagePrecision(x,types(:,:,y));
        precisions(y,x) = precision;
        recall = averageRecall(x,types(:,:,y));
        recalls(y,x) = recall;
        f1s(y,x) = 2*(precision*recall)/(precision+recall);
    end
end

