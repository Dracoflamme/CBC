function [ predictions ] = testTrees(trees, examples)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
predictions = zeros(length(examples));
size = length(examples);
for j = 1:size
    example = examples(:, j);
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
    tree2 = classify(tree.kids(attribute), example);
end

function [i] = getIndexOfMax(array)
    size = length(array);
    position = (1);
    value = (array(1));
    for j = 2:size
        if (array(j) > value)
            position = (j);
            value = (array(j));
        elseif (array(j) == value)
            position(length(position) + 1) = j;
            value(length(value) + 1) = array(j);
        end
    end
    if (length(value) == 1)
        i = position;
    else
        i = value(rand(1) * length(value));
    end
end
