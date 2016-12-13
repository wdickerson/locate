% myMainTestSet = mainAllTestSet12;
% mySelfTestSet = selfAllTestSet12;
% myMainTestSet = mainDayTestSet12;
% mySelfTestSet = selfDayTestSet12;
myMainTestSet = mainNightTestSet12;
mySelfTestSet = selfNightTestSet12;
myLabels = string(mainClassifier.Labels);

l = length(myMainTestSet.Files);
c = length(mainClassifier.Labels);
mainCorrect = zeros(l, 1);
selfCorrect = zeros(l, 1);
sumCorrect = zeros(l, 1);
maxCorrect = zeros(l, 1);

mainGuess = zeros(l, 1);
selfGuess = zeros(l, 1);
sumGuess = zeros(l, 1);
maxGuess = zeros(l, 1);

mainScores = zeros(l, c);
selfScores = zeros(l, c);
sumScores = zeros(l, c);
maxScores = zeros(l, c);

for i=1:l
    [mainG, mainS] = mainClassifier.predict(readimage(myMainTestSet,i));
    [selfG, selfS] = selfClassifier.predict(readimage(mySelfTestSet,i));
    mainGuess(i) = mainG;
    mainScores(i,:) = mainS;
    selfGuess(i) = selfG;
    selfScores(i,:) = selfS;
end

mainConfusionMatrix = zeros(c,c);
for k=1:length(mainScores)
    if strcmp(string(mainClassifier.Labels(mainGuess(k))), string(myMainTestSet.Labels(k)))
        mainCorrect(k) = 1;
    end
    q = find(myLabels == string(myMainTestSet.Labels(k)));
    mainConfusionMatrix(q, mainGuess(k)) = mainConfusionMatrix(q, mainGuess(k)) + 1;
end

selfConfusionMatrix = zeros(c,c);
for k=1:length(selfScores)
    if strcmp(string(mainClassifier.Labels(selfGuess(k))), string(myMainTestSet.Labels(k)))
        selfCorrect(k) = 1;
    end
    q = find(myLabels == string(myMainTestSet.Labels(k)));
    selfConfusionMatrix(q, selfGuess(k)) = selfConfusionMatrix(q, selfGuess(k)) + 1;
end

sumScores = mainScores + selfScores;
sumConfusionMatrix = zeros(c,c);
for k=1:length(sumScores)
    [myMax, myIndex] = max(sumScores(k,:));
    sumGuess(k) = myIndex;
    if strcmp(string(mainClassifier.Labels(sumGuess(k))), string(myMainTestSet.Labels(k)))
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
    if strcmp(string(mainClassifier.Labels(maxGuess(k))), string(myMainTestSet.Labels(k)))
        maxCorrect(k) = 1;
    end
    q = find(myLabels == string(myMainTestSet.Labels(k)));
    maxConfusionMatrix(q, maxGuess(k)) = maxConfusionMatrix(q, maxGuess(k)) + 1;
end


labelCount = countEachLabel(myMainTestSet);
for k=1:length(sumConfusionMatrix)
    mainConfusionMatrix(k,:) = mainConfusionMatrix(k,:) ./ labelCount.Count(k);
    selfConfusionMatrix(k,:) = selfConfusionMatrix(k,:) ./ labelCount.Count(k);
    sumConfusionMatrix(k,:) = sumConfusionMatrix(k,:) ./ labelCount.Count(k);
    maxConfusionMatrix(k,:) = maxConfusionMatrix(k,:) ./ labelCount.Count(k);
end

mainConfusionMatrix
mainPercent = sum(mainCorrect)/length(mainCorrect)
selfConfusionMatrix
selfPercent = sum(selfCorrect)/length(selfCorrect)
sumConfusionMatrix
sumPercent = sum(sumCorrect)/length(sumCorrect)
maxConfusionMatrix
maxPercent = sum(maxCorrect)/length(maxCorrect)
