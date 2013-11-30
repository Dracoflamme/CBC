function [matrices] = runTenFoldCV(x, y)
    matrices = cell(10,1);
    for i = 1:10
        splits = fold(x, y, i);
        learning_aus = cell2mat(splits(1));
        learning_labels = cell2mat(splits(2));
        init_aus = cell2mat(splits(3));
        init_labels = cell2mat(splits(4));
        cbr = CBRinit(init_aus, init_labels);
        predictions = runCBR(cbr, learning_aus);
        matrices(i) = {createConfusionMatrix(predictions, learning_labels)};
    end
end