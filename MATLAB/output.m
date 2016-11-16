>> rootFolder = 'trainingImages';
categories = {'NE_Main_S', 'NE_Main_W', 'NW_Main_E', 'NW_Main_S',...
    'SE_Main_N', 'SE_Main_W', 'SW_Main_E', 'SW_Main_N'};
trainingSet = imageDatastore(fullfile(rootFolder, categories),...
    'LabelSource', 'foldernames');
>> % Show two sample images
subplot(1,2,1);
imshow(readimage(trainingSet, 1))
subplot(1,2,2);
imshow(readimage(trainingSet, 9))
>> bag = bagOfFeatures(trainingSet);

Creating Bag-Of-Features.
-------------------------
* Image category 1: NE_Main_S
* Image category 2: NE_Main_W
* Image category 3: NW_Main_E
* Image category 4: NW_Main_S
* Image category 5: SE_Main_N
* Image category 6: SE_Main_W
* Image category 7: SW_Main_E
* Image category 8: SW_Main_N
* Selecting feature point locations using the Grid method.
* Extracting SURF features from the selected feature point locations.
** The GridStep is [8 8] and the BlockWidth is [32 64 96 128].

* Extracting features from 32 images...done. Extracted 359168 features.

* Keeping 80 percent of the strongest features from each category.

* Using K-Means clustering to create a 500 word visual vocabulary.
* Number of features          : 287336
* Number of clusters (K)      : 500

* Initializing cluster centers...100.00%.
* Clustering...completed 29/100 iterations (~2.02 seconds/iteration)...converged in 29 iterations.

* Finished creating Bag-Of-Features

>> categoryClassifier = trainImageCategoryClassifier(trainingSet, bag);

Training an image category classifier for 8 categories.
--------------------------------------------------------
* Category 1: NE_Main_S
* Category 2: NE_Main_W
* Category 3: NW_Main_E
* Category 4: NW_Main_S
* Category 5: SE_Main_N
* Category 6: SE_Main_W
* Category 7: SW_Main_E
* Category 8: SW_Main_N

* Encoding features for 32 images...done.

* Finished training the category classifier. Use evaluate to test the classifier on a test set.

>> img = imread('questionImages/NW_Main_S_Q1.jpg');
[labelIdx, scores] = categoryClassifier.predict(img);
categoryClassifier.Labels(labelIdx)
ans =
  cell
    'NW_Main_S'
>> scores
scores =
  1×8 single row vector
   -0.1925   -0.1725   -0.1866   -0.1122   -0.1538   -0.1889   -0.1988   -0.1809
>> 