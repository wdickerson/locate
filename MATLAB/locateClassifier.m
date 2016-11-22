% Define the training set
rootFolder = 'trainingImages';
categories = {...
    'NE_MAIN_S', 'NE_MAIN_W', 'NW_MAIN_E', 'NW_MAIN_S',...
    'SE_MAIN_N', 'SE_MAIN_W', 'SW_MAIN_E', 'SW_MAIN_N',...
    'NE_SELF_S', 'NE_SELF_W', 'NW_SELF_E', 'NW_SELF_S',...
    'SE_SELF_N', 'SE_SELF_W', 'SW_SELF_E', 'SW_SELF_N'...
};
trainingSet = imageDatastore(fullfile(rootFolder, categories),...
    'LabelSource', 'foldernames');

% Show two sample images
subplot(1,2,1);
imshow(readimage(trainingSet, 1))
subplot(1,2,2);
imshow(readimage(trainingSet, 9))

% Create a bag of features and a classifier
bag = bagOfFeatures(trainingSet);
categoryClassifier = trainImageCategoryClassifier(trainingSet, bag);

% Ask some questions!
% NW_..._S_Q1
nw_main_s_q1 = imread('questionImages/NW_MAIN_S_Q1.jpg');
[nw_main_s_q1_labelIdx, nw_main_s_q1_scores] = categoryClassifier.predict(nw_main_s_q1);
nw_main_s_q1_guess = categoryClassifier.Labels(nw_main_s_q1_labelIdx)

nw_self_s_q1 = imread('questionImages/NW_SELF_S_Q1.jpg');
[nw_self_s_q1_labelIdx, nw_self_s_q1_scores] = categoryClassifier.predict(nw_self_s_q1);
nw_self_s_q1_guess = categoryClassifier.Labels(nw_self_s_q1_labelIdx)

% SW_..._E_Q1
sw_main_e_q1 = imread('questionImages/SW_MAIN_E_Q1.jpg');
[sw_main_e_q1_labelIdx, sw_main_e_q1_scores] = categoryClassifier.predict(sw_main_e_q1);
sw_main_e_q1_guess = categoryClassifier.Labels(sw_main_e_q1_labelIdx)

sw_self_e_q1 = imread('questionImages/SW_SELF_E_Q1.jpg');
[sw_self_e_q1_labelIdx, sw_self_e_q1_scores] = categoryClassifier.predict(sw_self_e_q1);
sw_self_e_q1_guess = categoryClassifier.Labels(sw_self_e_q1_labelIdx)

% SW_..._E_Q2
sw_main_e_q2 = imread('questionImages/SW_MAIN_E_Q2.jpg');
[sw_main_e_q2_labelIdx, sw_main_e_q2_scores] = categoryClassifier.predict(sw_main_e_q2);
sw_main_e_q2_guess = categoryClassifier.Labels(sw_main_e_q2_labelIdx)

sw_self_e_q2 = imread('questionImages/SW_SELF_E_Q2.jpg');
[sw_self_e_q2_labelIdx, sw_self_e_q2_scores] = categoryClassifier.predict(sw_self_e_q2);
sw_self_e_q2_guess = categoryClassifier.Labels(sw_self_e_q2_labelIdx)

% SW_..._E_Q3
sw_main_e_q3 = imread('questionImages/SW_MAIN_E_Q3.jpg');
[sw_main_e_q3_labelIdx, sw_main_e_q3_scores] = categoryClassifier.predict(sw_main_e_q3);
sw_main_e_q3_guess = categoryClassifier.Labels(sw_main_e_q3_labelIdx)

sw_self_e_q3 = imread('questionImages/SW_SELF_E_Q3.jpg');
[sw_self_e_q3_labelIdx, sw_self_e_q3_scores] = categoryClassifier.predict(sw_self_e_q3);
sw_self_e_q3_guess = categoryClassifier.Labels(sw_self_e_q3_labelIdx)

% SW_..._E_Q4
sw_main_e_q4 = imread('questionImages/SW_MAIN_E_Q4.jpg');
[sw_main_e_q4_labelIdx, sw_main_e_q4_scores] = categoryClassifier.predict(sw_main_e_q4);
sw_main_e_q4_guess = categoryClassifier.Labels(sw_main_e_q4_labelIdx)

sw_self_e_q4 = imread('questionImages/SW_SELF_E_Q4.jpg');
[sw_self_e_q4_labelIdx, sw_self_e_q4_scores] = categoryClassifier.predict(sw_self_e_q4);
sw_self_e_q4_guess = categoryClassifier.Labels(sw_self_e_q4_labelIdx)

