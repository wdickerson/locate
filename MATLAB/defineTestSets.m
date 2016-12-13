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
mainAllTestSet = imageDatastore(fullfile('allQuestionImages', mainCategories),...
    'LabelSource', 'foldernames');
mainDayTestSet = imageDatastore(fullfile('dayQuestionImages', mainCategories),...
    'LabelSource', 'foldernames');
mainNightTestSet = imageDatastore(fullfile('nightQuestionImages', mainCategories),...
    'LabelSource', 'foldernames');
selfAllTestSet = imageDatastore(fullfile('allQuestionImages', selfCategories),...
    'LabelSource', 'foldernames');
selfDayTestSet = imageDatastore(fullfile('dayQuestionImages', selfCategories),...
    'LabelSource', 'foldernames');
selfNightTestSet = imageDatastore(fullfile('nightQuestionImages', selfCategories),...
    'LabelSource', 'foldernames');
