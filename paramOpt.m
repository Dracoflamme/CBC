function [ topology, train_fn, activation_fn, epoch,learn_rate,momentum] = paramOpt( training_data,validation_data,one_or_six)
    training_fns = ['trainlm','trainscg','trainbr','trainrp','traingdm'];
    activation_fns = ['tansig','logsig','purelin'];
    topologies = [40,30,20,10,[40,30],[40,20],[40,10],[30,20],[30,10],[20,10]];
    epochs = [10,100,1000];
    learn_rates = 0.1:0.1:1;
    momentums = 0.1:0.1:0.9;
    
    
end

