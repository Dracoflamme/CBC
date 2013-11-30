function [ result_struct ] = createResultStruct(conf, prec, recall, f1 )
% Takes a set of Action Units and Label and produces a case structure
%   The case structure has the following fields: problem_description which
% contains the vector of active activation units, and solution which
% contains the corresponding label, between 1 and 6 or 0 if no known label
% exists
    result_struct = struct('confusion_matrix',conf, 'precision',prec, 'recall', recall, 'f1', f1);
end

