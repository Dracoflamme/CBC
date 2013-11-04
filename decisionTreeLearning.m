function [tree] = decisionTreeLearning(examples, attributes, binary_targets, depth)
    tree = struct('op', [],'kids', [],'class', 0);
    %if all members of binary_targets are equal return leaf node
    if all (binary_targets == binary_targets(1))
        tree.class = binary_targets(1);
        return
    % if attributes is empty return leaf node
    elseif isempty(attributes)
        tree.class = majorityValue(binary_targets);
        return
    else 
        best_attribute = chooseBestDecisionAttribute(examples, attributes, binary_targets);
        tree.op = best_attribute;
        for i = 0:1,
            examples_a = []; targets_a = [];
            % this is correct (apart from best_attribute maybe)
            for row = 1:size(examples,1),
                if examples(row,best_attribute) == i
                    examples_a = [examples_a; examples(row,:)] ;%#ok<*AGROW>
                    targets_a = [targets_a;binary_targets(row)];
                end
            end
            % ---
            if isempty(examples_a)
                tree.class = majorityValue(binary_targets);
                return
            else
                if i==0 
                    kid1 = decisionTreeLearning(examples_a, attributes(attributes~=best_attribute), targets_a, depth + 1);
                else    kid2 = decisionTreeLearning(examples_a, attributes(attributes~=best_attribute), targets_a, depth + 1);
                end
            end
       end
       tree.kids = {kid1 kid2};
    end 
end

function [out] = majorityValue(binary_targets)
    out = mode(binary_targets);
end

function [bestAtt] = chooseBestDecisionAttribute(examples, attributes, binary_targets)
    bestAtt = attributes(1);
    bestValue = -999;
    for col=1:length(attributes)
        elm = attributes(col);
        gain = Gain(elm, examples, binary_targets);
        if gain > bestValue
            bestAtt = elm;
            bestValue = gain;
        end
    end
end

function [gain] = Gain(attribute, examples, binary_targets)
    p0 = 0.0001;
    p1 = 0.0001;
    n0 = 0.0001;
    n1 = 0.0001;
    for row = 1:size(examples,1)
        a = examples(row,attribute);
        b = binary_targets(row);
        if a
            if b
                p1 = p1 + 1;
            else
                n1 = n1 + 1;
            end
        else
            if b
                p0 = p0 + 1;
            else
                n0 = n0 + 1;
            end
        end
    end
    p = p0 + p1;
    n = n0 + n1;
    
    gain = I(p,n) - Remainder(p0, p1, n0, n1, p, n);
    
end

function [i] = I(p,n)
    i = (-p/(p+n))*log2(p/(p+n)) - (n/(p+n))*log2(n/(p+n));
end

function [remainder] = Remainder(p0, p1, n0, n1, p, n)
    remainder = ((p0+n0)/(p+n))*I(p0,n0) + ((p1+n1)/(p+n))*I(p1,n1);
end