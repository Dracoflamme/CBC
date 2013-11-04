function [ data ] = fold( examples , labels )
%FOLD Summary of this function goes here
%   Detailed explanation goes here
    num_exs = length(labels);
    jump = floor(num_exs/10);
    data.test = struct([]);
    data.train =struct([]);
    validation_size = 20;
    for i = 0:9
       start  = jump*i + 1; %1,101,201,
       finish = jump*(i+1);%100,200,300
       if (i==9) finish = num_exs;
        end
       data.test(i+1).labels = labels(start:finish-validation_size);
       data.test(i+1).examples = examples(start:finish-validation_size,:);
       data.train(i+1).labels = cat(1,labels(1:start-1),labels(finish+1:end));
       data.train(i+1).examples = cat(1,examples(1:start-1,:),examples(finish+1:end,:));
       data.validate(i+1).labels = labels(finish-validation_size+1:finish);
       data.validate(i+1).examples = examples(finish-validation_size+1:finish);
    end

end

