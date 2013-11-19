function [ expected ] = testANN( network, data )
    expected = zeros(size(data, 2), 1);
    output = sim(network, data);
    corrected = bestMatch(output);
    for i = 1:size(expected, 1)
        for j = 1:6
            if (corrected(j, i) == 1)
                expected(i, 1) = j;
            end
        end
    end
end

