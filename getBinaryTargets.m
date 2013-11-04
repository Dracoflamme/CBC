function [targets] = getBinaryTargets(answers, class)
targets = zeros(size(answers));
for i = 1:size(answers)
    targets(i) = answers(i) == class;
end
end