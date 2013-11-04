function [cm] = creatConfusionMatrixTestTrees(x, y)
   folds = createFoldDecisionTrees(x,y);
   cm = zeros(6, 6, 'uint32');
   for i = 1:length(folds)
        test = testTrees(folds(i).trees,folds(i).test.examples);
        cm = cm + createConfusionMatrix(test,folds(i).test.labels);
   end
end
