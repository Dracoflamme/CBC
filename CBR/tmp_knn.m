function [neighbours] = knn(target,similarity, k, cases)
    cases_map = {};
    for i = 1:length(cases)
        cases_map{i} = [cases(i) , feval(similarity,cases(i),target)];
    end
    cases_map = sortrows(cases_map,2); 
    for j = 1:k
        neighbours(i) = cases_map(i);
    end
end
