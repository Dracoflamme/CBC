function [predictions] = predictions(folds)
   for i = 1:length(folds)
        test = testTrees(folds(i).trees,folds(i).test.examples);
        predictions{i} = test; 
   end
end
