% Define categories
mainCategories = {...
    'NE_MAIN_S', 'NE_MAIN_W', 'NW_MAIN_E', 'NW_MAIN_S',...
    'SE_MAIN_N', 'SE_MAIN_W', 'SW_MAIN_E', 'SW_MAIN_N',...
};
selfCategories = {...
    'NE_SELF_S', 'NE_SELF_W', 'NW_SELF_E', 'NW_SELF_S',...
    'SE_SELF_N', 'SE_SELF_W', 'SW_SELF_E', 'SW_SELF_N'...
};

% Define test set
mainAllTestSet12 = imageDatastore(fullfile('allQuestionImages', mainCategories),...
    'LabelSource', 'foldernames', 'ReadFcn', @firstHalf);
mainDayTestSet12 = imageDatastore(fullfile('dayQuestionImages', mainCategories),...
    'LabelSource', 'foldernames', 'ReadFcn', @firstHalf);
mainNightTestSet12 = imageDatastore(fullfile('nightQuestionImages', mainCategories),...
    'LabelSource', 'foldernames', 'ReadFcn', @firstHalf);
selfAllTestSet12 = imageDatastore(fullfile('allQuestionImages', selfCategories),...
    'LabelSource', 'foldernames', 'ReadFcn', @firstHalf);
selfDayTestSet12 = imageDatastore(fullfile('dayQuestionImages', selfCategories),...
    'LabelSource', 'foldernames', 'ReadFcn', @firstHalf);
selfNightTestSet12 = imageDatastore(fullfile('nightQuestionImages', selfCategories),...
    'LabelSource', 'foldernames', 'ReadFcn', @firstHalf);
