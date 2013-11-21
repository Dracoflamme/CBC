load('cleandata_students.mat')
nn_clean_one = createNN([40,20], 'trainrp',0.8, 0.6, 'tansig', 1000, x, y ,'one');
nn_clean_six = createNN([40,20], 'trainrp',0.8, 0.6, 'tansig', 1000, x, y ,'six');
predictions_clean_one = testANN(nn_clean_one,x')
predictions_clean_six = testANN(nn_clean_six,x')


load('noisydata_students.mat')
nn_noisy_one = createNN([40,20], 'trainrp',0.8, 0.6, 'tansig', 1000, x, y ,'one');
nn_noisy_six = createNN([40,20], 'trainrp',0.8, 0.6, 'tansig', 1000, x, y ,'six');
predictions_noisy_one = testANN(nn_noisy_one,x')
predictions_noisy_six = testANN(nn_noisy_six,x')

    