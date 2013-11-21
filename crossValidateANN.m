function [ rates ] = crossValidateANN( labels, examples, one_or_six,optimise_parameters,params)
    folds = fold(labels,examples);
    rates = zeros(length(folds));
    if strcmp(optimise_parameters,'yes')
        [topology,train_fn,learn_rate,momentum,activation_fn,epochs] = paramOpt(folds.train(1),folds.validate(1),one_or_six);
    else
        topology = params{1};
        train_fn = params{2};
        learn_rate = params{3};
        momentum = params{4};
        activation_fn = params{5};
        epochs = params{6};
    end
    for i = 1:size(folds.train,2)
        x = folds.train(i).examples;
        y = folds.train(i).labels;
        network = createNN(topology,train_fn,learn_rate,momentum,activation_fn,epochs,x,y,one_or_six);
        test_examples = folds.test(i).examples;
        test_labels = folds.test(i).labels;
        predictions = testANN(network,test_examples');
        rates(i) = classificationRate(predictions,test_labels);
    end
end

