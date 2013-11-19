function [ output ] = bestMatch(inputs)
    if (size(inputs, 1) == 6)
        output = zeros(size(inputs));
    else
       tmp = zeros(6, size(cell2mat(inputs(1)),2));
       output = zeros(size(tmp));
       for i = 1:6
           tmp(i, :) = cell2mat(inputs(i));
       end
       inputs = tmp;
    end
    for example = 1:size(inputs,2)
       bestAtt = 1;
       value = inputs(1,example);
       for emotion = 1:6
          if (inputs(emotion,example) > value)
              bestAtt = emotion;
              value = inputs(emotion,example);
          end
       end
       for emotion = 1:6
          if (emotion == bestAtt)
              output(emotion,example) = 1;
          else
              output(emotion,example) = 0;
          end
       end
    end
end