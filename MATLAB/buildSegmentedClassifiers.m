% Define the training set
mainCategories = {...
    'NE_MAIN_S', 'NE_MAIN_W', 'NW_MAIN_E', 'NW_MAIN_S',...
    'SE_MAIN_N', 'SE_MAIN_W', 'SW_MAIN_E', 'SW_MAIN_N',...
};
selfCategories = {...
    'NE_SELF_S', 'NE_SELF_W', 'NW_SELF_E', 'NW_SELF_S',...
    'SE_SELF_N', 'SE_SELF_W', 'SW_SELF_E', 'SW_SELF_N'...
};
mainTrainingSet12 = imageDatastore(fullfile('trainingImages', mainCategories),...
    'LabelSource', 'foldernames', 'ReadFcn', @firstHalf);
mainTestSet12 = imageDatastore(fullfile('questionImages', mainCategories),...
    'LabelSource', 'foldernames', 'ReadFcn', @firstHalf);
mainNightTestSet12 = imageDatastore(fullfile('nightImages', mainCategories),...
    'LabelSource', 'foldernames', 'ReadFcn', @firstHalf);
selfTrainingSet12 = imageDatastore(fullfile('trainingImages', selfCategories),...
    'LabelSource', 'foldernames', 'ReadFcn', @firstHalf);
selfTestSet12 = imageDatastore(fullfile('questionImages', selfCategories),...
    'LabelSource', 'foldernames', 'ReadFcn', @firstHalf);
selfNightTestSet12 = imageDatastore(fullfile('nightImages', selfCategories),...
    'LabelSource', 'foldernames', 'ReadFcn', @firstHalf);

% Show two sample images
subplot(1,2,1);
imshow(readimage(mainTrainingSet12, 1))
subplot(1,2,2);
imshow(readimage(selfTrainingSet12, 9))

% Create a bag of features and a classifier
mainBag12 = bagOfFeatures(mainTrainingSet12);
selfBag12 = bagOfFeatures(selfTrainingSet12);
mainClassifier12 = trainImageCategoryClassifier(mainTrainingSet12, mainBag12);
selfClassifier12 = trainImageCategoryClassifier(selfTrainingSet12, selfBag12);

