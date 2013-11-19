function [ topology, train_fn,learn_rate,momentum,activation_fn, epoch] = paramOpt( training_data,validation_data,one_or_six)
    topologies = {40,30,20,10,[40,30],[40,20],[40,10],[30,20],[30,10],[20,10]};
    training_fns = {'trainlm','trainscg','trainrp','traingdm'};
    learn_rates = 0.1:0.1:1;
    momentums = 0.1:0.1:0.9;
    activation_fns = {'tansig','logsig','purelin'}; 
    epochs = [10,100,1000];
    max_acc = 0;
    x = training_data.examples;
    y = training_data.labels;
    for top = 1:length(topologies)
        for tra = 1:length(training_fns)
            for le = 1:length(learn_rates)
                for  mom = 1:length(momentums)
                    for act = 1:length(activation_fns)
                        for ep = 1:length(epochs)
                            network = createNN(topologies{top},training_fns{tra},learn_rates(le),momentums(mom),activation_fns{act},epochs(ep),x,y,one_or_six);                   
                            examples = validation_data.examples;
                            out = sim(network,examples');
                            test = NNout2labels(out);
                            labels = validation_data.labels;
                            accuracy = classificationRate(test,labels);
                            if accuracy > max_acc
                                max_acc = accuracy;
                                topology = topologies{top};
                                train_fn = training_fns{tra};
                                learn_rate = learn_rates(le);
                                momentum = momentums(mom);
                                activation_fn = activation_fns{act};
                                epoch = epochs(ep);
                            end
                        end
                    end
                end
           end
        end  
    end
end

