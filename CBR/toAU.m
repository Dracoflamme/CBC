function [au] = toAU(example)
    au = [];
    for i = 1:length(example)
        if example(i)
            au = [au i];
        end
    end
end
