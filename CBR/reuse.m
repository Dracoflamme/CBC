function [ solvedcase ] = reuse( cs, newcase )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    best_attribute = [0 0 0 0 0 0];
    for i = 1:length(cs)
        best_attribute(knns(i).solution) = best_attribute(knns(i).solution+1);
    end
    best = 1;
    for i = 1:6
        current = best_attribute(i);
        if current>best
            best = current;
        end
    end
    solvedcase = createCaseStruct(newcase.problem_description,best);
end

