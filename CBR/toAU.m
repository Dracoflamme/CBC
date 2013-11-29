function [au] = toAU(example)
    au = [];
    for i = 1:length(example)
        if example(i)
            au(length(au) +1 ) = i;
        end
    end
end
