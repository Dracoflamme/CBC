function [ cbr ] = runCBR( aus,labels )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    splitted = splitData(aus,labels);
    init_aus = cell2mat(splitted(1));
    init_labels = cell2mat(splitted(2));
    learning_aus = cell2mat(splitted(3));
    learning_labels = cell2mat(splitted(4));
    
    cbr = CBRinit(init_aus,init_labels);
    
    for i=1 : length(learning_aus) 
       thisAus = toAU(learning_aus(i,:)); 
       thisLabel = learning_labels(i);
       thisCase = createCaseStruct(thisAus,thisLabel);
       
       similarCases = retrieve(cbr, thisCase);
       
       solvedCase = reuse(similarCases, thisCase);
       
       cbr = retain(cbr, solvedCase);
    end

end

