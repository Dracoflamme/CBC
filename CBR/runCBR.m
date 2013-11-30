function [ predictions ] = runCBR(cbr, learning_aus)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here    
    predictions = [];
    for i=1 : length(learning_aus) 
       thisAus = toAU(learning_aus(i,:)); 
       
       thisCase = createCaseStruct(thisAus,0);
       
       similarCases = retrieve(cbr, thisCase);
       
       solvedCase = reuse(similarCases, thisCase);
       predictions = [predictions, solvedCase.solution];
       
       cbr = retain(cbr, solvedCase);
    end
end

