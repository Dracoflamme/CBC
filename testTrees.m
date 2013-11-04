function [ predictions ] = testTrees(trees, examples)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
predictions = zeros(length(examples), 1);
len = size(examples,1);
for j = 1:len
    example = examples(j, :);
    discriminants = zeros(6);
    for i = 1:6
        tree = classify(trees(i), example);
        if (tree.class == 1)
            discriminants(i) = 1/tree.depth;
        end
    end
    predictions(j) = getIndexOfMax(discriminants);
end
end

function [tree2] = classify(tree, example)
    if (tree.op == 0)
        tree2 = tree;
        return
    end
    attribute = example(tree.op);
    tree2 = classify(tree.kids{attribute + 1}, example);
end

function [i] = getIndexOfMax(array)
    size = length(array);
    positions = (1);
    value = array(1);
    for j = 2:size
        if (array(j) > value)
            positions = (j);
            value = array(j);
        elseif (array(j) == value)
            positions(length(positions) + 1) = j;
        end
    end
    if (length(positions) == 1)
        i = positions(1);
    else
        i = positions(randi(length(positions)));
    end
end
