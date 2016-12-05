% myMainTestSet = mainTestSet12;
% mySelfTestSet = selfTestSet12;
myMainTestSet = mainNightTestSet12;
mySelfTestSet = selfNightTestSet12;
myMainClassifier = mainClassifier12;
mySelfClassifier = selfClassifier12;
myLabels = string(myMainClassifier.Labels);

l = length(myMainTestSet.Files);
c = length(myMainClassifier.Labels);
sumCorrect = zeros(l, 1);
maxCorrect = zeros(l, 1);
sumGuess = zeros(l, 1);
maxGuess = zeros(l, 1);

mainGuess = zeros(l, 1);
selfGuess = zeros(l, 1);
mainScores = zeros(l, c);
selfScores = zeros(l, c);
for i=1:l
    [mainG, mainS] = myMainClassifier.predict(readimage(myMainTestSet,i));
    [selfG, selfS] = mySelfClassifier.predict(readimage(mySelfTestSet,i));
    mainGuess(i) = mainG;
    mainScores(i,:) = mainS;
    selfGuess(i) = selfG;
    selfScores(i,:) = selfS;
end

sumScores = mainScores + selfScores;
sumConfusionMatrix = zeros(c,c);
for k=1:length(sumScores)
    [myMax, myIndex] = max(sumScores(k,:));
    sumGuess(k) = myIndex;
    if strcmp(string(myMainClassifier.Labels(sumGuess(k))), string(myMainTestSet.Labels(k)))
        sumCorrect(k) = 1;
    end
    q = find(myLabels == string(myMainTestSet.Labels(k)));
    sumConfusionMatrix(q, sumGuess(k)) = sumConfusionMatrix(q, sumGuess(k)) + 1;
end

maxScores = mainScores;
[countR, countC] = size(maxScores);
for r=1:countR
    for c=1:countC
        maxScores(r,c)=max(mainScores(r,c),selfScores(r,c));
    end
end

maxConfusionMatrix = zeros(c,c);
for k=1:length(maxScores)
    [myMax, myIndex] = max(maxScores(k,:));
    maxGuess(k) = myIndex;
    if strcmp(string(myMainClassifier.Labels(maxGuess(k))), string(myMainTestSet.Labels(k)))
        maxCorrect(k) = 1;
    end
    q = find(myLabels == string(myMainTestSet.Labels(k)));
    maxConfusionMatrix(q, maxGuess(k)) = maxConfusionMatrix(q, maxGuess(k)) + 1;
end


labelCount = countEachLabel(myMainTestSet);
for k=1:length(sumConfusionMatrix)
    sumConfusionMatrix(k,:) = sumConfusionMatrix(k,:) ./ labelCount.Count(k);
    maxConfusionMatrix(k,:) = maxConfusionMatrix(k,:) ./ labelCount.Count(k);
end
sumConfusionMatrix
sumPercent = sum(sumCorrect)/length(sumCorrect)
maxConfusionMatrix
maxPercent = sum(maxCorrect)/length(maxCorrect)
