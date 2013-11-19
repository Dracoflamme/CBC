function [ expected ] = testANN( network, data )
    output = sim(network, data);
    corrected = bestMatch(output);
    expected = NNout2labels(corrected);
end

