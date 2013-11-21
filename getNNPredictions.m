load('cleandata_students.mat')
conf_mat_clean_one = averageConfusionMatrixNN(x,y,params,'one')
conf_mat_clean_six = averageConfusionMatrixNN(x,y,params,'six')

load('noisydata_students.mat')
conf_mat_noisy_one = averageConfusionMatrixNN(x,y,params,'one')
conf_mat_noisy_six = averageConfusionMatrixNN(x,y,params,'six')

    