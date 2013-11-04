function [rates] = classRatesTestTrees(dataset)
   folds = createFoldDecisionTrees(dataset.x,dataset.y);
   for i = 1:length(folds)
        test = testTrees(folds(i).trees,folds(i).test.examples);
        rates(i) = classificationRate(test,folds(i).test.labels);
        ys(i) = test;
   end
end
