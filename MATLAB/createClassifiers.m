% Define the training set
mainCategories = {...
    'NE_MAIN_S', 'NE_MAIN_W', 'NW_MAIN_E', 'NW_MAIN_S',...
    'SE_MAIN_N', 'SE_MAIN_W', 'SW_MAIN_E', 'SW_MAIN_N',...
};
selfCategories = {...
    'NE_SELF_S', 'NE_SELF_W', 'NW_SELF_E', 'NW_SELF_S',...
    'SE_SELF_N', 'SE_SELF_W', 'SW_SELF_E', 'SW_SELF_N'...
};
mainTrainingSet = imageDatastore(fullfile('trainingImages', mainCategories),...
    'LabelSource', 'foldernames');
mainTestSet = imageDatastore(fullfile('questionImages', mainCategories),...
    'LabelSource', 'foldernames');
mainNightTestSet = imageDatastore(fullfile('nightImages', mainCategories),...
    'LabelSource', 'foldernames');
selfTrainingSet = imageDatastore(fullfile('trainingImages', selfCategories),...
    'LabelSource', 'foldernames');
selfTestSet = imageDatastore(fullfile('questionImages', selfCategories),...
    'LabelSource', 'foldernames');
selfNightTestSet = imageDatastore(fullfile('nightImages', selfCategories),...
    'LabelSource', 'foldernames');

% Show two sample images
subplot(1,2,1);
imshow(readimage(mainTrainingSet, 1))
subplot(1,2,2);
imshow(readimage(selfTrainingSet, 9))

% Create a bag of features and a classifier
mainBag = bagOfFeatures(mainTrainingSet);
selfBag = bagOfFeatures(selfTrainingSet);
mainClassifier = trainImageCategoryClassifier(mainTrainingSet, mainBag);
selfClassifier = trainImageCategoryClassifier(selfTrainingSet, selfBag);


