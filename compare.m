function [ compare ] = compare(input, ref)
    correct = 0;
    error = 0;
    for i = 1:size(input,2)
       for j = 1:size(input,1)
           if (input(j,i) == 1)
              if (ref(j,i) == 1)
                  correct = correct + 1;
              else
                  error = error + 1;
              end
           end
       end
    end
    compare = [correct, error];
end

