function [ cm] = createConfusionMatrixANN( labels, examples,params, one_or_six)
    folds = fold(labels,examples);
    cm = zeros(6, 6, 'uint32');
    topology = params{1};
    train_fn = params{2};
    learn_rate = params{3};
    momentum = params{4};
    activation_fn = params{5};
    epochs = params{6};
    for i = 1:size(folds.train,2)
        x = folds.train(i).examples;
        y = folds.train(i).labels;
        network = createNN(topology,train_fn,learn_rate,momentum,activation_fn,epochs,x,y,one_or_six);
        test_examples = folds.test(i).examples;
        test_labels = folds.test(i).labels;
        predictions = testANN(network,test_examples');
        cm = cm + createConfusionMatrix(predictions,test_labels);
    end
end

