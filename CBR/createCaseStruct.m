function [ case_struct ] = createCaseStruct( active_aus, label )
% Takes a set of Action Units and Label and produces a case structure
%   The case structure has the following fields: problem_description which
% contains the vector of active activation units, and solution which
% contains the corresponding label, between 1 and 6 or 0 if no known label
% exists
    case_struct = struct('problem_description',active_aus,'solution',label);
end

