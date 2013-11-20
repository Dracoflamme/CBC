function [ rates ] = crossValidateANN( labels, examples, one_or_six,optimise_parameters,params)
    folds = fold(labels,examples);
    rates = zeros(length(folds));
    if strcmp(optimise_parameters,'yes')
        [topology,train_fn,learn_rate,momentum,activation_fn,epochs] = paramOpt(folds(1).train,folds(1).validate);
    else
        topology = params{1};
        train_fn = params{2};
        learn_rate = params{3};
        momentum = params{4};
        activation_fn = params{5};
        epochs = params{6};
    end
    for i = 1:length(folds)
        x = folds(i).train.examples;
        y = folds(i).train.labels;
        network = createNN(topology,train_fn,learn_rate,momentum,activation_fn,epochs,x,y,one_or_six);
        predictions = testANN(network,folds(i).examples);
        rates(i) = classificationRate(predictions,folds(i).test.labels);
    end
end

