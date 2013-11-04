function [ data ] = fold( examples , labels )
%FOLD Summary of this function goes here
%   Detailed explanation goes here
    num_exs = length(labels);
    jump = floor(num_exs/10);
    data.test = struct([]);
    data.train =struct([]);
    validation_size = 20; % size of the validation set
    for i = 1:10
       start  = jump*(i-1) + 1; %1,101,201,
       finish = jump*(i); %100,200,300
       if (i==10) finish = num_exs; %ensure we train on all data
        end
       data.test(i).labels = labels(start:finish-validation_size);
       data.test(i).examples = examples(start:finish-validation_size,:);
       data.train(i).labels = cat(1,labels(1:start),labels(finish+1:end));
       data.train(i).examples = cat(1,examples(1:start,:),examples(finish+1:end,:));
       data.validate(i).labels = labels(finish-validation_size+1:finish);
       data.validate(i).examples = examples(finish-validation_size+1:finish);
    end

end

