function [ cbr ] = CBRinit(x, y)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    cbr = [];
    for auv = 1:length(x)
        active_aus = toAU(x(auv,:));
        label = y(auv);
        c = createCaseStruct(active_aus,label);
        cbr = addCase(c,cbr);
    end
end

