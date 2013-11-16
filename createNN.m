function [ network ] = createNN( hidden_layers,training_fn, epochs, x,y,one_or_six)
    [x2,y2] = ANNdata(x,y);
    if strcmp(one_or_six, 'one')
        network = makeNN(hidden_layers,training_fn,epochs,x2,y2);
    else
        for i = 1:6
            ts = getBinaryTargets(y,i);
            network{i} = makeNN(hidden_layers,training_fn,epochs,x2,ts');
        end
    end
end

function [net] = makeNN(hidden_layers,train_fn,epochs,x,y)
    [net] = feedforwardnet(hidden_layers,train_fn);
    [net] = configure(net,x,y);
    net.trainParam.epochs = epochs;
    [net] = train(net,x,y);
end

