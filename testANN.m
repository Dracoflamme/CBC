function [ expected ] = testANN( network, data )
    if (size(network, 2) == 1)
        output = sim(network, data);
    else
        output = cell(1,6);
        for i = 1:6
            output{i} = sim(network{i}, data);
        end
    end
    corrected = bestMatch(output);
    expected = NNout2labels(corrected);
end

