function [neighbours] = knn(target,similarity, k, cases)
    cases_map = [];
    for i = 1:length(cases)
        cases_map(i,1)= i; 
        cases_map(i,2)= feval(similarity,cases(i),target);
    end
    cases_map = sortrows(cases_map,2);
    for j = 1:k
        neighbours(j) = cases(cases_map(end-j,1));
    end
end
