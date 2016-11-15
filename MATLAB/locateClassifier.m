% Define the training set
rootFolder = 'trainingImages';
categories = {'NE_Main_S', 'NE_Main_W', 'NW_Main_E', 'NW_Main_S',...
    'SE_Main_N', 'SE_Main_W', 'SW_Main_E', 'SW_Main_N'};
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

% Ask a question!
img = imread('questionImages/NW_Main_S_Q1.jpg');
[labelIdx, scores] = categoryClassifier.predict(img);
categoryClassifier.Labels(labelIdx)

