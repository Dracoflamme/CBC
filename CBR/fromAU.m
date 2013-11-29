function [example] = fromAU(au)
    example = zeros([1,45]); 
    for i = 1:length(au)
        example(au(i)) = 1;
    end
end
