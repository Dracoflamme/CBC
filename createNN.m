function [ network ] = createNN( hidden_layers,training_fn,learning_rate,momentum,activation_fn, epochs, examples,labels,one_or_six)
% inputs:
% hidden_layers - either an array of required hidden layer nodes, or just a
%                 number of nodes
% training_fn   - e.g. 'trainlm'
% epochs        - number of epochs in training
% learning_rate - learning rate
% momentum      - momentum for gdm
% activation_fn - activation function
% examples      - examples to train on
% labels        - labels to train on
% one_or_six    - 'one' - output a single NN
%                 'six' - output six NNs, one for each label

    [x2,y2] = ANNdata(examples,labels);
    if strcmp(one_or_six, 'one')
        network = makeNN(hidden_layers,training_fn,learning_rate,momentum,activation_fn,epochs,x2,y2);
    else
        network = cell(1,6);
        for i = 1:6
            ts = getBinaryTargets(labels,i);
            network{i} = makeNN(hidden_layers,training_fn,learning_rate,momentum,activation_fn,epochs,x2,ts');
        end
    end
end

function [net] = makeNN(hidden_layers,train_fn,learn,mom, activation,epochs,x,y)
    [net] = feedforwardnet(hidden_layers,train_fn);
    [net] = configure(net,x,y);
    net.trainParam.epochs = epochs;
    net.trainParam.lr = learn;
    net.trainParam.mc = mom;
    for i = 1: size(hidden_layers)
        net.layers{i}.transferFcn = activation;
    end
    [net] = train(net,x,y,'useParallel','yes','useGPU','only');
end

