function [rates] = classRatesTestTrees(x, y)
   folds = createFoldDecisionTrees(x,y);
   for i = 1:length(folds)
        test = testTrees(folds(i).trees,folds(i).test.examples);
        rates(i) = classificationRate(test,folds(i).test.labels);
   end
end
