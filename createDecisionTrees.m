function [ trees ] = createDecisionTrees(examples, attributes, targets)
    for i = 1:6
        trees(i) = decisionTreeLearning(examples,attributes,getBinaryTargets(targets,i));
    end
end

