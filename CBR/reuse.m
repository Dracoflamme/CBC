function [ solvedcase ] = reuse( cs, newcase )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    best_attribute = [0 0 0 0 0 0];
    for i = 1:length(cs)
        best_attribute(cs(i).solution) = best_attribute(cs(i).solution)+1;
    end
    best = best_attribute(1);
    bestIndex = 1;
    for i = 1:6
        current = best_attribute(i);
        if current>best
            best = current;
            bestIndex = i;
        end
    end
    solvedcase = createCaseStruct(newcase.problem_description,bestIndex);
end

