function [ output ] = bestMatch(inputs)
    output = zeros(size(inputs));
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

